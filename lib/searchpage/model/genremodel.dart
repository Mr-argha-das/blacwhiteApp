// To parse this JSON data, do
//
//     final allGenreModel = allGenreModelFromJson(jsonString);

import 'dart:convert';

AllGenreModel allGenreModelFromJson(String str) => AllGenreModel.fromJson(json.decode(str));

String allGenreModelToJson(AllGenreModel data) => json.encode(data.toJson());

class AllGenreModel {
    List<String> data;
    int status;

    AllGenreModel({
        required this.data,
        required this.status,
    });

    factory AllGenreModel.fromJson(Map<String, dynamic> json) => AllGenreModel(
        data: List<String>.from(json["data"].map((x) => x)),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
        "status": status,
    };
}
