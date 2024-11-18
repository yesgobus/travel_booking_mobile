// To parse this JSON data, do
//
//     final popularDestinationModel = popularDestinationModelFromJson(jsonString);

import 'dart:convert';

PopularDestinationModel popularDestinationModelFromJson(String str) =>
    PopularDestinationModel.fromJson(json.decode(str));

String popularDestinationModelToJson(PopularDestinationModel data) =>
    json.encode(data.toJson());

class PopularDestinationModel {
  bool? status;
  Data? data;
  String? message;

  PopularDestinationModel({
    this.status,
    this.data,
    this.message,
  });

  factory PopularDestinationModel.fromJson(Map<String, dynamic> json) =>
      PopularDestinationModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  List<Destination>? destination;

  Data({
    this.destination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        destination: List<Destination>.from(
            json["destination"].map((x) => Destination.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "destination": List<dynamic>.from(destination!.map((x) => x.toJson())),
      };
}

class Destination {
  String? id;
  String? destination;
  String? duration;
  int? startingPrice;
  String? image;
  String? rating;

  Destination({
    this.id,
    this.destination,
    this.duration,
    this.startingPrice,
    this.image,
    this.rating,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        id: json["_id"],
        destination: json["destination"],
        duration: json["duration"],
        startingPrice: json["startingPrice"],
        image: json["image"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "destination": destination,
        "duration": duration,
        "startingPrice": startingPrice,
        "image": image,
        "rating": rating,
      };
}
