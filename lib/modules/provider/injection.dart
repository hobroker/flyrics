import 'package:flutter/widgets.dart';

typedef Get = T Function<T>();
typedef ProviderFactory<T extends Object> = T Function(Get get);
typedef PoviderFactory = Object Function(T Function<T>());
typedef CanCreate = bool Function(Type type);
typedef OnCreate = void Function(Object service);
typedef OnDispose = void Function(Object service);

class _Provider extends InheritedWidget {
  const _Provider({
    Key key,
    @required this.controller,
    @required Widget child,
  })  : assert(controller != null && child != null),
        super(key: key, child: child);

  final ProviderController controller;

  static ProviderController of(BuildContext context) {
    final element =
        context.getElementForInheritedWidgetOfExactType<_Provider>();
    if (element != null) {
      return (element.widget as _Provider).controller;
    } else {
      return null;
    }
  }

  @override
  bool updateShouldNotify(_Provider old) {
    return false;
  }
}

class Provider extends StatefulWidget {
  const Provider({
    Key key,
    this.factories,
    this.canCreate,
    this.onCreate,
    this.onDispose,
    this.child,
  }) : super(key: key);

  final Iterable<ProviderFactory> factories;
  final CanCreate canCreate;
  final OnCreate onCreate;
  final OnDispose onDispose;

  final Widget child;

  static ProviderController of(BuildContext context) {
    return _Provider.of(context);
  }

  static T get<T>(BuildContext context, {bool returnNullIfNotFound = false}) {
    T service;

    if (InjectionInjector._useRootAsDefault) {
      service = InjectionInjector.root.get<T>() ?? of(context)?.get<T>();
    } else {
      service = of(context)?.get<T>() ??
          InjectionInjector.root.get<T>() ??
          InjectionInjector.getGlobal<T>();
    }

    if (service != null) {
      return service;
    } else if (returnNullIfNotFound) {
      return null;
    } else {
      throw Exception('A Service of type $T not found.');
    }
  }

  static ProviderFactory<T> getFactory<T>(BuildContext context) {
    return of(context)?.getFactory<T>(searchAllAncestors: true);
  }

  static void setCanCreate(CanCreate canCreate) {
    InjectionInjector.root._canCreate = canCreate;
  }

  static void setOnCreate(OnCreate onCreate) {
    InjectionInjector.root._onCreate = onCreate;
  }

  static void setOnDispose(OnDispose onDispose) {
    InjectionInjector.root._onDispose = onDispose;
  }

  static void provideForRoot(Iterable<ProviderFactory> factories) {
    InjectionInjector.root.provideMany(factories);
  }

  static void useRootAsDefault([bool useRootAsDefault = true]) {
    InjectionInjector._useRootAsDefault = useRootAsDefault;
  }

  static void clearRoot() {
    InjectionInjector.root.clear();
  }

  @override
  _ProviderState createState() => _ProviderState();
}

abstract class ProviderController {
  T get<T>();

  ProviderFactory<T> getFactory<T>({bool searchAllAncestors = false});
}

class _ProviderState extends State<Provider> implements ProviderController {
  InjectionInjector _provider;

  @override
  void initState() {
    super.initState();
    _provider = InjectionInjector._(get);
    _setUpProviders();
    _setUpCallbacks();
  }

  @override
  void didUpdateWidget(Provider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setUpCallbacks();
  }

  @override
  void dispose() {
    _provider.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Provider(controller: this, child: widget.child);
  }

  @override
  T get<T>() {
    return _provider.get<T>() ??
        Provider.get<T>(context, returnNullIfNotFound: true) ??
        InjectionInjector.root.get<T>();
  }

  @override
  ProviderFactory<T> getFactory<T>({bool searchAllAncestors = false}) {
    if (searchAllAncestors) {
      if (InjectionInjector._useRootAsDefault) {
        return InjectionInjector.root.get<T>() ??
            _provider.getFactory<T>() ??
            Provider.getFactory<T>(context);
      } else {
        return _provider.getFactory<T>() ??
            Provider.getFactory<T>(context) ??
            InjectionInjector.root.get<T>();
      }
    } else {
      return _provider.getFactory<T>();
    }
  }

  void _setUpProviders() {
    _provider.provideMany(widget.factories);
  }

  void _setUpCallbacks() {
    _provider._canCreate = widget.canCreate;
    _provider._onCreate = widget.onCreate;
    _provider._onDispose = widget.onDispose;
  }
}

class InjectionInjector {
  InjectionInjector._(this._ownerGet) {
    _ownerGet ??= get;
  }

  T Function<T>() _ownerGet;

  static final InjectionInjector root = InjectionInjector._(null);

  static final _global = <Type, Set<Object>>{};

  static bool _useRootAsDefault = false;

  CanCreate _canCreate;

  OnCreate _onCreate;

  OnDispose _onDispose;

  final _factories = <ProviderFactory>{};

  final _services = <Type, Object>{};

  void provideMany(Iterable<ProviderFactory> factories) {
    _factories.addAll(factories);
  }

  void provideOne(ProviderFactory factory) {
    _factories.add(factory);
  }

  T get<T>() {
    return _services[T] ?? create<T>();
  }

  static T getGlobal<T>() {
    if (_global[T]?.isNotEmpty == true) {
      for (final service in _global[T].toList().reversed) {
        if (service is T) return service;
      }
    }
    return null;
  }

  ProviderFactory<T> getFactory<T>() {
    return _factories.lastWhereOrNull((f) => f is ProviderFactory<T>);
  }

  T create<T>() {
    final factory = getFactory<T>();

    if (factory == null) {
      return null;
    }

    if (_canCreate != null && !_canCreate(T)) {
      throw Exception('Creating an instance of $T is forbidden.');
    }

    if (!_isRoot() &&
        InjectionInjector.root._canCreate != null &&
        !InjectionInjector.root._canCreate(T)) {
      throw Exception('Creating an instance of $T is forbidden.');
    }

    final service = factory(_get);

    if (_onCreate != null) {
      _onCreate(service);
    }

    if (!_isRoot() && InjectionInjector.root._onCreate != null) {
      InjectionInjector.root._onCreate(service);
    }

    if (!_isRoot()) {
      _global[T] ??= {};
      _global[T].add(service);
    }

    return _services[T] = service;
  }

  void clear() {
    for (final service in _services.values) {
      if (_onDispose != null) {
        _onDispose(service);
      }

      if (!_isRoot() && InjectionInjector.root._onDispose != null) {
        InjectionInjector.root._onDispose(service);
      }

      if (service is Sink) {
        service.close();
      }

      if (!_isRoot()) {
        _global[service.runtimeType].remove(service);
      }
    }

    _factories.clear();
    _services.clear();
  }

  bool _isRoot() {
    return this == InjectionInjector.root;
  }

  T _get<T>() {
    final service = _ownerGet<T>();
    if (service != null) {
      return service;
    } else {
      throw Exception('A Service of type $T not found.');
    }
  }
}

extension _IterableExtensions<E> on Set<E> {
  E lastWhereOrNull(bool Function(E element) test) {
    try {
      return lastWhere(test);
    } catch (e) {
      return null;
    }
  }
}
