// To parse this JSON data, do
//
//     final suggestionSongsModel = suggestionSongsModelFromJson(jsonString);

import 'dart:convert';

SuggestionSongsModel suggestionSongsModelFromJson(String str) => SuggestionSongsModel.fromJson(json.decode(str));

String suggestionSongsModelToJson(SuggestionSongsModel data) => json.encode(data.toJson());

class SuggestionSongsModel {
    String message;
    List<Datum> data;
    int status;

    SuggestionSongsModel({
        required this.message,
        required this.data,
        required this.status,
    });

    factory SuggestionSongsModel.fromJson(Map<String, dynamic> json) => SuggestionSongsModel(
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
    String artistsIDs;
    String albumName;
    String image;
    String title;
    List<GenrieType> genrieType;
    String trackUrl;
    List<String> like;
    int played;
    Artist artist;
    List<Track> track;

    Datum({
        required this.artistsIDs,
        required this.albumName,
        required this.image,
        required this.title,
        required this.genrieType,
        required this.trackUrl,
        required this.like,
        required this.played,
        required this.artist,
        required this.track,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        artistsIDs: json["artistsIDs"],
        albumName: json["album_name"],
        image: json["image"],
        title: json["title"],
        genrieType: List<GenrieType>.from(json["genrie_type"].map((x) => genrieTypeValues.map[x]!)),
        trackUrl: json["track_url"],
        like: List<String>.from(json["like"].map((x) => x)),
        played: json["played"],
        artist: Artist.fromJson(json["artist"]),
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "artistsIDs": artistsIDs,
        "album_name": albumName,
        "image": image,
        "title": title,
        "genrie_type": List<dynamic>.from(genrieType.map((x) => genrieTypeValues.reverse[x])),
        "track_url": trackUrl,
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

enum GenrieType {
    FILMI,
    MODERN_BOLLYWOOD
}

final genrieTypeValues = EnumValues({
    "filmi": GenrieType.FILMI,
    "modern bollywood": GenrieType.MODERN_BOLLYWOOD
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
