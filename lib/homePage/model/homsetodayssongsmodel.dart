import 'dart:convert';

class SongResponse {
  final int page;
  final int pageSize;
  final int totalSongs;
  final int totalPages;
  final List<Song> songs;
  final int status;

  SongResponse({
    required this.page,
    required this.pageSize,
    required this.totalSongs,
    required this.totalPages,
    required this.songs,
    required this.status,
  });

  factory SongResponse.fromJson(Map<String, dynamic> json) {
    return SongResponse(
      page: json['page'],
      pageSize: json['page_size'],
      totalSongs: json['total_songs'],
      totalPages: json['total_pages'],
      songs: List<Song>.from(json['songs'].map((x) => Song.fromJson(x))),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'page_size': pageSize,
      'total_songs': totalSongs,
      'total_pages': totalPages,
      'songs': songs.map((x) => x.toJson()).toList(),
      'status': status,
    };
  }
}

class Song {
  final String id;
  final String artistsIds;
  final Artist artists;
  final String albumName;
  final String image;
  final String title;
  final List<String> genreType;
  final String trackUrl;
  final List<String> likedBy;
  final int played;
  final String? lyrics;
  final Track track;

  Song({
    required this.id,
    required this.artistsIds,
    required this.artists,
    required this.albumName,
    required this.image,
    required this.title,
    required this.genreType,
    required this.trackUrl,
    required this.likedBy,
    required this.played,
    required this.lyrics,
    required this.track,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['_id'],
      artistsIds: json['artistsIDs'],
      artists: Artist.fromJson(json['artists']),
      albumName: json['album_name'],
      image: json['image'],
      title: json['title'],
      genreType: List<String>.from(json['genrie_type'].map((x) => x)),
      trackUrl: json['track_url'],
      likedBy: List<String>.from(json['like'].map((x) => x)),
      played: json['played'],
      lyrics: json['lyrics'],
      track: Track.fromJson(json['track']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'artistsIDs': artistsIds,
      'artists': artists.toJson(),
      'album_name': albumName,
      'image': image,
      'title': title,
      'genrie_type': genreType,
      'track_url': trackUrl,
      'like': likedBy,
      'played': played,
      'lyrics': lyrics,
      'track': track.toJson(),
    };
  }
}

class Artist {
  final String id;
  final String image;
  final String name;
  final String genreType;

  Artist({
    required this.id,
    required this.image,
    required this.name,
    required this.genreType,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['_id']['\$oid'],
      image: json['image'],
      name: json['name'],
      genreType: json['genre_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': {'\$oid': id},
      'image': image,
      'name': name,
      'genre_type': genreType,
    };
  }
}

class Track {
  final String id;
  final String songId;
  final String url;

  Track({
    required this.id,
    required this.songId,
    required this.url,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['_id']['\$oid'],
      songId: json['songId'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': {'\$oid': id},
      'songId': songId,
      'url': url,
    };
  }
}
