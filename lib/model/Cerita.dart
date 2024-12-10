import 'dart:convert';
// import 'package:dio/dio.dart';

Cerita ceritaFromJson(String str) => Cerita.fromJson(json.decode(str));

String ceritaToJson(Cerita data) => json.encode(data.toJson());

class Cerita {
  final String caption;
  final String deskripsi;
  final String image;
  final String penulis;

  Cerita({
    required this.caption,
    required this.deskripsi,
    required this.image,
    required this.penulis,
  });

  factory Cerita.fromJson(Map<String, dynamic> json) => Cerita(
        caption: json["caption"],
        deskripsi: json["deskripsi"],
        image: json["image"],
        penulis: json["penulis"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "deskripsi": deskripsi,
        "image": image,
        "penulis": penulis,
      };
}
