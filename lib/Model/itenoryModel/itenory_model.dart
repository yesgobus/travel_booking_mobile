// To parse this JSON data, do
//
//     final itenoryModel = itenoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

ItenoryModel itenoryModelFromJson(String str) =>
    ItenoryModel.fromJson(json.decode(str));

String itenoryModelToJson(ItenoryModel data) => json.encode(data.toJson());

class ItenoryModel {
  bool? status;
  Data? data;
  String? message;

  ItenoryModel({
    this.status,
    this.data,
    this.message,
  });

  factory ItenoryModel.fromJson(Map<String, dynamic> json) => ItenoryModel(
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
  HotelData? hotelData;

  Data({
    this.hotelData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hotelData: HotelData.fromJson(json["hotel_data"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel_data": hotelData!.toJson(),
      };
}

class HotelData {
  Hotel? hotel;
  List<Itinerary>? itinerary;

  HotelData({
    this.hotel,
    this.itinerary,
  });

  factory HotelData.fromJson(Map<String, dynamic> json) => HotelData(
        hotel: Hotel.fromJson(json["hotel"]),
        itinerary: List<Itinerary>.from(
            json["itinerary"].map((x) => Itinerary.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hotel": hotel!.toJson(),
        "itinerary": List<dynamic>.from(itinerary!.map((x) => x.toJson())),
      };
}

class Hotel {
  String? hotelName;
  String? roomName;
  String? eodInfo;
  List<String>? additionalInfo;
  String? rating;
  String? address;
  String? image;
  String? fullAddress;
  String? destination;
  String? checkIn;
  String? checkOut;

  Hotel({
    this.hotelName,
    this.roomName,
    this.eodInfo,
    this.additionalInfo,
    this.rating,
    this.address,
    this.image,
    this.fullAddress,
    this.destination,
    this.checkIn,
    this.checkOut,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        hotelName: json["hotelName"],
        roomName: json["room_name"],
        eodInfo: json["end_of_day_info"],
        additionalInfo:
            List<String>.from(json["additional_info"].map((x) => x)),
        rating: json["rating"].toString(),
        address: json["address"],
        image: json["image"],
        fullAddress: json["fullAddress"],
        destination: json["destination"],
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
      );

  Map<String, dynamic> toJson() => {
        "hotelName": hotelName,
        "rating": rating,
        "address": address,
        "image": image,
        "fullAddress": fullAddress,
        "destination": destination,
        "checkIn": checkIn,
        "checkOut": checkOut,
      };
}

class Itinerary {
  String? title;
  String? eodInfo;

  String? plan;
  String? image;
  String? activities;
  String? activitiesHoure;
  String? activitieAddress;

  Itinerary({
    this.title,
    this.eodInfo,
    this.plan,
    this.image,
    this.activities,
    this.activitiesHoure,
    this.activitieAddress,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        title: json["title"],
        eodInfo: json["end_of_day_info"],
        plan: json["plan"],
        image: json["image"],
        activities: json["activities"],
        activitiesHoure: json["activitiesHoure"],
        activitieAddress: json["activitieAddress"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "plan": plan,
        "image": image,
        "activities": activities,
        "activitiesHoure": activitiesHoure,
        "activitieAddress": activitieAddress,
      };
}
