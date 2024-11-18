// To parse this JSON data, do
//
//     final packageListModel = packageListModelFromJson(jsonString);

import 'dart:convert';

PackageListModel packageListModelFromJson(String str) =>
    PackageListModel.fromJson(json.decode(str));

String packageListModelToJson(PackageListModel data) =>
    json.encode(data.toJson());

class PackageListModel {
  bool? status;
  Data? data;
  String? message;

  PackageListModel({
    this.status,
    this.data,
    this.message,
  });

  factory PackageListModel.fromJson(Map<String, dynamic> json) =>
      PackageListModel(
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
  List<Package>? packages;
  String? tagline;

  Data({
    this.packages,
    this.tagline,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
        tagline: json["tagline"],
      );

  Map<String, dynamic> toJson() => {
        "packages": List<dynamic>.from(packages!.map((x) => x.toJson())),
      };
}

class Package {
  String? id;
  String? name;
  String? destinationId;
  String? hotelId;
  String? destination;
  String? image;
  int? duration;
  List<String>? tripBenefit;
  String? disText;
  String? couponCode;
  String? witheFlitePrice;
  String? withoutFlitePrice;
  String? totalDuration;
  bool? isWishlisted;

  Package(
      {this.id,
      this.name,
      this.destinationId,
      this.couponCode,
      this.hotelId,
      this.destination,
      this.tripBenefit,
      this.image,this.disText,
      this.duration,
      this.witheFlitePrice,
      this.withoutFlitePrice,
      this.totalDuration,
      this.isWishlisted});

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["_id"],
        name: json["name"],
        destinationId: json["destinationID"],
        hotelId: json["hotelId"],
        couponCode: json["couponCode"],
        destination: json["destination"],
        image: json["image"],
        disText: json["discountText"],
        tripBenefit:List<String>.from(json["tripBenifit"].map((x) => x)),
        isWishlisted: json["isWishlisted"],
        duration: json["duration"],
        witheFlitePrice: json["witheFlitePrice"].toString(),
        withoutFlitePrice: json["withoutFlitePrice"].toString(),
        totalDuration: json["totalDuration"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "destinationID": destinationId,
        "hotelId": hotelId,
        "destination": destination,
        "image": image,
        "duration": duration,
        "witheFlitePrice": witheFlitePrice,
        "withoutFlitePrice": withoutFlitePrice,
        "totalDuration": totalDuration,
      };
}
