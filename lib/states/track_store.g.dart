// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrackStore on TrackStoreBase, Store {
  Computed<bool> _$hasTrackComputed;

  @override
  bool get hasTrack => (_$hasTrackComputed ??=
          Computed<bool>(() => super.hasTrack, name: 'TrackStoreBase.hasTrack'))
      .value;

  final _$isLoadingAtom = Atom(name: 'TrackStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$trackAtom = Atom(name: 'TrackStoreBase.track');

  @override
  TrackModelStore get track {
    _$trackAtom.reportRead();
    return super.track;
  }

  @override
  set track(TrackModelStore value) {
    _$trackAtom.reportWrite(value, super.track, () {
      super.track = value;
    });
  }

  final _$fetchCurrentTrackAsyncAction =
      AsyncAction('TrackStoreBase.fetchCurrentTrack');

  @override
  Future<dynamic> fetchCurrentTrack() {
    return _$fetchCurrentTrackAsyncAction.run(() => super.fetchCurrentTrack());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
track: ${track},
hasTrack: ${hasTrack}
    ''';
  }
}
