// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

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
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'TrackStoreBase.isLoading'))
          .value;

  final _$trackAtom = Atom(name: 'TrackStoreBase.track');

  @override
  Track get track {
    _$trackAtom.reportRead();
    return super.track;
  }

  @override
  set track(Track value) {
    _$trackAtom.reportWrite(value, super.track, () {
      super.track = value;
    });
  }

  final _$statusAtom = Atom(name: 'TrackStoreBase.status');

  @override
  DataStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(DataStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$errorAtom = Atom(name: 'TrackStoreBase.error');

  @override
  Object get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Object value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
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
track: ${track},
status: ${status},
error: ${error},
hasTrack: ${hasTrack},
isLoading: ${isLoading}
    ''';
  }
}
