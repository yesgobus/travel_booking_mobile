// To parse this JSON data, do
//
//     final todaysOffersModel = todaysOffersModelFromJson(jsonString);

import 'dart:convert';

TodaysOffersModel todaysOffersModelFromJson(String str) => TodaysOffersModel.fromJson(json.decode(str));

String todaysOffersModelToJson(TodaysOffersModel data) => json.encode(data.toJson());

class TodaysOffersModel {
    bool? status;
    Data ?data;
    String? message;

    TodaysOffersModel({
        this.status,
        this.data,
        this.message,
    });

    factory TodaysOffersModel.fromJson(Map<String, dynamic> json) => TodaysOffersModel(
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
    List<Offer>? offers;

    Data({
        this.offers,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offers": List<dynamic>.from(offers!.map((x) => x.toJson())),
    };
}

class Offer {
    String ?id;
    String ?destinationId;
    String ?destination;
    String ?image;
    String ?offerFor;
    String ?validTill;
    String ?offer;

    Offer({
        this.id,
        this.destinationId,
        this.destination,
        this.image,
        this.offerFor,
        this.validTill,
        this.offer,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["_id"],
        destinationId: json["destinationId"],
        destination: json["destination"],
        image: json["image"],
        offerFor: json["offerFor"],
        validTill: json["validTill"],
        offer: json["offer"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "destinationId": destinationId,
        "destination": destination,
        "image": image,
        "offerFor": offerFor,
        "validTill": validTill,
        "offer": offer,
    };
}
