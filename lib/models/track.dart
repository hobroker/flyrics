class Track {
  String name;
  String album;
  String artwork;

  Track.fromJson(Map json) {
    this.name = json['name'];
    this.album = json['album'];
    this.artwork = json['artwork'];
  }
}
