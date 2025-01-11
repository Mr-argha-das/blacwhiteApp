// To parse this JSON data, do
//
//     final usrRecentPlayedSong = usrRecentPlayedSongFromJson(jsonString);

import 'dart:convert';

UsrRecentPlayedSong usrRecentPlayedSongFromJson(String str) => UsrRecentPlayedSong.fromJson(json.decode(str));

String usrRecentPlayedSongToJson(UsrRecentPlayedSong data) => json.encode(data.toJson());

class UsrRecentPlayedSong {
    String message;
    List<Datum> data;
    int status;

    UsrRecentPlayedSong({
        required this.message,
        required this.data,
        required this.status,
    });

    factory UsrRecentPlayedSong.fromJson(Map<String, dynamic> json) => UsrRecentPlayedSong(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
    };
}

class Datum {
    String alubumName;
    String image;
    String title;
    List<String> like;
    int played;
    Artist artist;
    List<Track> track;

    Datum({
        required this.alubumName,
        required this.image,
        required this.title,
        required this.like,
        required this.played,
        required this.artist,
        required this.track,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        alubumName: json["alubum_name"],
        image: json["image"],
        title: json["title"],
        like: List<String>.from(json["like"].map((x) => x)),
        played: json["played"],
        artist: Artist.fromJson(json["artist"]),
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "alubum_name": alubumName,
        "image": image,
        "title": title,
        "like": List<dynamic>.from(like.map((x) => x)),
        "played": played,
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
