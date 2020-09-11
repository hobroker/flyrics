import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'track_model.g.dart';

@JsonSerializable()
class TrackModelStore extends TrackModelStoreBase with _$TrackModelStore {
  TrackModelStore();

  factory TrackModelStore.fromJson(Map<String, dynamic> json) =>
      _$TrackModelStoreFromJson(json);
}

abstract class TrackModelStoreBase with Store {
  String id;

  @observable
  String name;

  @observable
  String album;

  @observable
  String artist;

  @observable
  String artwork;
}
