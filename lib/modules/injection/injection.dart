import 'package:flutter/widgets.dart';

typedef InjectionFactory<T extends Object> = T Function(T Function<T>() get);
typedef _InjectionFactoryProvider = Iterable<InjectionFactory> Function();
typedef CanCreate = bool Function(Type type);
typedef OnCreate = void Function(Object service);
typedef OnDispose = void Function(Object service);

class _Injection extends InheritedWidget {
  const _Injection({
    Key key,
    @required this.injectionController,
    @required Widget child,
  })  : assert(injectionController != null && child != null),
        super(key: key, child: child);

  final InjectionController injectionController;

  static InjectionController of(BuildContext context) {
    final element =
        context.getElementForInheritedWidgetOfExactType<_Injection>();
    if (element != null) {
      return (element.widget as _Injection).injectionController;
    } else {
      return null;
    }
  }

  @override
  bool updateShouldNotify(_Injection old) {
    return false;
  }
}

class Injection extends StatefulWidget {
  const Injection({
    Key key,
    @required this.providers,
    this.canCreate,
    this.onCreate,
    this.onDispose,
    this.child,
  }) : super(key: key);

  final _InjectionFactoryProvider providers;
  final CanCreate canCreate;
  final OnCreate onCreate;
  final OnDispose onDispose;

  final Widget child;

  static InjectionController of(BuildContext context) {
    return _Injection.of(context);
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

  static InjectionFactory<T> getFactory<T>(BuildContext context) {
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

  static void provideForRoot(Iterable<InjectionFactory> factories) {
    InjectionInjector.root.provide(factories);
  }

  static void useRootAsDefault([bool useRootAsDefault = true]) {
    InjectionInjector._useRootAsDefault = useRootAsDefault;
  }

  static void clearRoot() {
    InjectionInjector.root.clear();
  }

  @override
  _InjectionState createState() => _InjectionState();
}

abstract class InjectionController {
  T get<T>();

  InjectionFactory<T> getFactory<T>({bool searchAllAncestors = false});
}

class _InjectionState extends State<Injection> implements InjectionController {
  InjectionInjector _injection;

  @override
  void initState() {
    super.initState();
    _injection = InjectionInjector._(get);
    _setUpProviders();
    _setUpCallbacks();
  }

  @override
  void didUpdateWidget(Injection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setUpCallbacks();
  }

  @override
  void dispose() {
    _injection.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Injection(injectionController: this, child: widget.child);
  }

  @override
  T get<T>() {
    return _injection.get<T>() ??
        Injection.get<T>(context, returnNullIfNotFound: true) ??
        InjectionInjector.root.get<T>();
  }

  @override
  InjectionFactory<T> getFactory<T>({bool searchAllAncestors = false}) {
    if (searchAllAncestors) {
      if (InjectionInjector._useRootAsDefault) {
        return InjectionInjector.root.get<T>() ??
            _injection.getFactory<T>() ??
            Injection.getFactory<T>(context);
      } else {
        return _injection.getFactory<T>() ??
            Injection.getFactory<T>(context) ??
            InjectionInjector.root.get<T>();
      }
    } else {
      return _injection.getFactory<T>();
    }
  }

  void _setUpProviders() {
    if (widget.providers != null) {
      _injection.provide(widget.providers());
    }
  }

  void _setUpCallbacks() {
    _injection._canCreate = widget.canCreate;
    _injection._onCreate = widget.onCreate;
    _injection._onDispose = widget.onDispose;
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

  final _factories = <InjectionFactory>{};

  final _services = <Type, Object>{};

  void provide(Iterable<InjectionFactory> factories) {
    _factories.addAll(factories);
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

  InjectionFactory<T> getFactory<T>() {
    return _factories.lastWhereOrNull((f) => f is InjectionFactory<T>);
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
