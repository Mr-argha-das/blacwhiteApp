// To parse this JSON data, do
//
//     final toddaysBiggestModel = toddaysBiggestModelFromJson(jsonString);

import 'dart:convert';

ToddaysBiggestModel toddaysBiggestModelFromJson(String str) => ToddaysBiggestModel.fromJson(json.decode(str));

String toddaysBiggestModelToJson(ToddaysBiggestModel data) => json.encode(data.toJson());

class ToddaysBiggestModel {
    String message;
    List<Datum> data;
    Pagination pagination;
    int status;

    ToddaysBiggestModel({
        required this.message,
        required this.data,
        required this.pagination,
        required this.status,
    });

    factory ToddaysBiggestModel.fromJson(Map<String, dynamic> json) => ToddaysBiggestModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
        "status": status,
    };
}

class Datum {
    Song song;
    Artist artist;
    List<Track> track;

    Datum({
        required this.song,
        required this.artist,
        required this.track,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        song: Song.fromJson(json["song"]),
        artist: Artist.fromJson(json["artist"]),
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "song": song.toJson(),
        "artist": artist.toJson(),
        "track": List<dynamic>.from(track.map((x) => x.toJson())),
    };
}

class Artist {
    Id id;
    String image;
    String name;
    String genreType;

    Artist({
        required this.id,
        required this.image,
        required this.name,
        required this.genreType,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: Id.fromJson(json["_id"]),
        image: json["image"],
        name: json["name"],
        genreType: json["genre_type"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "image": image,
        "name": name,
        "genre_type": genreType,
    };
}

class Id {
    String oid;

    Id({
        required this.oid,
    });

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
    };
}

class Song {
    Id id;
    String artistsIDs;
    String albumName;
    String image;
    String title;
    List<String> genrieType;
    String trackUrl;
    List<Like> like;
    int played;

    Song({
        required this.id,
        required this.artistsIDs,
        required this.albumName,
        required this.image,
        required this.title,
        required this.genrieType,
        required this.trackUrl,
        required this.like,
        required this.played,
    });

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: Id.fromJson(json["_id"]),
        artistsIDs: json["artistsIDs"],
        albumName: json["album_name"],
        image: json["image"],
        title: json["title"],
        genrieType: List<String>.from(json["genrie_type"].map((x) => x)),
        trackUrl: json["track_url"],
        like: List<Like>.from(json["like"].map((x) => likeValues.map[x]!)),
        played: json["played"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "artistsIDs": artistsIDs,
        "album_name": albumName,
        "image": image,
        "title": title,
        "genrie_type": List<dynamic>.from(genrieType.map((x) => x)),
        "track_url": trackUrl,
        "like": List<dynamic>.from(like.map((x) => likeValues.reverse[x])),
        "played": played,
    };
}

enum Like {
    ADMIN
}

final likeValues = EnumValues({
    "admin": Like.ADMIN
});

class Track {
    Id id;
    String songId;
    String url;

    Track({
        required this.id,
        required this.songId,
        required this.url,
    });

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: Id.fromJson(json["_id"]),
        songId: json["songId"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "songId": songId,
        "url": url,
    };
}

class Pagination {
    int page;
    int limit;
    int totalSongs;
    int totalPages;

    Pagination({
        required this.page,
        required this.limit,
        required this.totalSongs,
        required this.totalPages,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        limit: json["limit"],
        totalSongs: json["total_songs"],
        totalPages: json["total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "total_songs": totalSongs,
        "total_pages": totalPages,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
