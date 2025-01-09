// To parse this JSON data, do
//
//     final homeArtistsModel = homeArtistsModelFromJson(jsonString);

import 'dart:convert';

HomeArtistsModel homeArtistsModelFromJson(String str) => HomeArtistsModel.fromJson(json.decode(str));

String homeArtistsModelToJson(HomeArtistsModel data) => json.encode(data.toJson());

class HomeArtistsModel {
    String message;
    List<Datum> data;
    int page;
    int limit;
    int status;

    HomeArtistsModel({
        required this.message,
        required this.data,
        required this.page,
        required this.limit,
        required this.status,
    });

    factory HomeArtistsModel.fromJson(Map<String, dynamic> json) => HomeArtistsModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        page: json["page"],
        limit: json["limit"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "page": page,
        "limit": limit,
        "status": status,
    };
}

class Datum {
    Id id;
    String image;
    String name;
    String genreType;

    Datum({
        required this.id,
        required this.image,
        required this.name,
        required this.genreType,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
