class Track {
  int? trackId;
  String? trackName;
  int? trackRating;
  int? instrumental;
  int? explicit;
  int? hasLyrics;
  int? hasSubtitles;
  int? hasRichsync;
  int? numFavourite;
  int? albumId;
  String? albumName;
  int? artistId;
  String? artistName;
  String? trackShareUrl;
  String? trackEditUrl;
  int? restricted;
  String? updatedTime;

  Track({
    this.trackId,
    this.trackName,
    this.trackRating,
    this.instrumental,
    this.explicit,
    this.hasLyrics,
    this.hasSubtitles,
    this.hasRichsync,
    this.numFavourite,
    this.albumId,
    this.albumName,
    this.artistId,
    this.artistName,
    this.trackShareUrl,
    this.trackEditUrl,
    this.restricted,
    this.updatedTime,
  });

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    trackRating = json['track_rating'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    data['track_rating'] = trackRating;
    data['instrumental'] = instrumental;
    data['explicit'] = explicit;
    data['has_lyrics'] = hasLyrics;
    data['has_subtitles'] = hasSubtitles;
    data['has_richsync'] = hasRichsync;
    data['num_favourite'] = numFavourite;
    data['album_id'] = albumId;
    data['album_name'] = albumName;
    data['artist_id'] = artistId;
    data['artist_name'] = artistName;
    data['track_share_url'] = trackShareUrl;
    data['track_edit_url'] = trackEditUrl;
    data['restricted'] = restricted;
    data['updated_time'] = updatedTime;
    return data;
  }
}
