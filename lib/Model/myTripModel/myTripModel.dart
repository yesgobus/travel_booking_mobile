// To parse this JSON data, do
//
//     final myTripModel = myTripModelFromJson(jsonString);

import 'dart:convert';

MyTripModel myTripModelFromJson(String str) =>
    MyTripModel.fromJson(json.decode(str));

String myTripModelToJson(MyTripModel data) => json.encode(data.toJson());

class MyTripModel {
  bool ?status;
  Data ?data;
  String? message;

  MyTripModel({
    this.status,
    this.data,
    this.message,
  });

  factory MyTripModel.fromJson(Map<String, dynamic> json) => MyTripModel(
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
  List<BookingDatum>? bookingData;

  Data({
    this.bookingData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bookingData: List<BookingDatum>.from(
            json["bookingData"].map((x) => BookingDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bookingData": List<dynamic>.from(bookingData!.map((x) => x.toJson())),
      };
}

class BookingDatum {
  String? id;
  String? name;
  String? destinationId;
  String? destination;
  String? image;
  int? duration;
  String? witheFlitePrice;
  List<String>? tripBenefit;
  String? disText;
  String? withoutFlitePrice;
  String? totalDuration;
  String? hotelId;
  String? bookingStatus;
  String? statusTime;

  BookingDatum({
    this.id,
    this.name,
    this.destinationId,
    this.destination,
    this.image,
    this.tripBenefit,
    this.disText,
    this.duration,
    this.witheFlitePrice,
    this.withoutFlitePrice,
    this.totalDuration,
    this.hotelId,
    this.bookingStatus,
    this.statusTime,
  });

  factory BookingDatum.fromJson(Map<String, dynamic> json) => BookingDatum(
        id: json["_id"],
        name: json["name"],
        destinationId: json["destinationID"],
        destination: json["destination"],
        image: json["image"],
        duration: json["duration"],
        witheFlitePrice: json["witheFlitePrice"].toString(),
        withoutFlitePrice: json["withoutFlitePrice"].toString(),
        totalDuration: json["totalDuration"],
        disText: json["discountText"],
        tripBenefit: List<String>.from(json["tripBenifit"].map((x) => x)),
        hotelId: json["hotelId"],
        bookingStatus: json["bookingStatus"],
        statusTime: json["statusTime"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "destinationID": destinationId,
        "destination": destination,
        "image": image,
        "duration": duration,
        "witheFlitePrice": witheFlitePrice,
        "withoutFlitePrice": withoutFlitePrice,
        "totalDuration": totalDuration,
        "hotelId": hotelId,
        "bookingStatus": bookingStatus,
        "statusTime": statusTime,
      };
}
