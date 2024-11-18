// To parse this JSON data, do
//
//     final preBookingModel = preBookingModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ui';

PreBookingModel preBookingModelFromJson(String str) =>
    PreBookingModel.fromJson(json.decode(str));

String preBookingModelToJson(PreBookingModel data) =>
    json.encode(data.toJson());

class PreBookingModel {
  bool? status;
  Data? data;
  String? message;

  PreBookingModel({
    this.status,
    this.data,
    this.message,
  });

  factory PreBookingModel.fromJson(Map<String, dynamic> json) =>
      PreBookingModel(
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
  BookingData? bookingData;

  Data({
    this.bookingData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bookingData: BookingData.fromJson(json["bookingData"]),
      );

  Map<String, dynamic> toJson() => {
        "bookingData": bookingData!.toJson(),
      };
}

class BookingData {
  String? userId;
  String? bookingId;
  String? packageId;
  String? fromPlace;
  String? toPlace;
  String? departureDate;
  String? returnDate;
  String? totalGuests;
  int? totalRoom;
  bool? witheFlight;
  String? guestsType;
  String? totalPackagePrice;
  List<dynamic>? guestDetails;
  bool? paymentDone;
  String? couponDiscount;
  String? feesTexes;
  String? totalBasicCost;
  String? id;
  String? createdAt;
  String? updatedAt;

  BookingData({
    this.userId,
    this.bookingId,
    this.packageId,
    this.fromPlace,
    this.toPlace,
    this.departureDate,
    this.returnDate,
    this.totalGuests,
    this.totalRoom,
    this.witheFlight,
    this.guestsType,
    this.totalPackagePrice,
    this.guestDetails,
    this.paymentDone,
    this.couponDiscount,
    this.feesTexes,
    this.totalBasicCost,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        userId: json["userId"],
        bookingId: json["bookingId"],
        packageId: json["packageId"],
        fromPlace: json["fromPlace"],
        toPlace: json["toPlace"],
        departureDate: json["departureDate"],
        returnDate: json["returnDate"],
        totalGuests: json["totalGuests"],
        totalRoom: json["totalRoom"],
        witheFlight: json["witheFlight"],
        guestsType: json["guestsType"],
        totalPackagePrice: json["totalPackagePrice"].toString(),
        guestDetails: List<dynamic>.from(json["guestDetails"].map((x) => x)),
        paymentDone: json["paymentDone"],
        couponDiscount: json["couponDiscount"].toString(),
        feesTexes: json["feesTexes"].toString(),
        totalBasicCost: json["totalBasicCost"].toString(),
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "packageId": packageId,
        "fromPlace": fromPlace,
        "toPlace": toPlace,
        "departureDate": departureDate,
        "returnDate": returnDate,
        "totalGuests": totalGuests,
        "totalRoom": totalRoom,
        "witheFlight": witheFlight,
        "guestsType": guestsType,
        "totalPackagePrice": totalPackagePrice,
        "guestDetails": List<dynamic>.from(guestDetails!.map((x) => x)),
        "paymentDone": paymentDone,
        "couponDiscount": couponDiscount,
        "feesTexes": feesTexes,
        "totalBasicCost": totalBasicCost,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
