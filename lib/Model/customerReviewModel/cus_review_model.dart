// To parse this JSON data, do
//
//     final customerReviewModel = customerReviewModelFromJson(jsonString);

import 'dart:convert';

CustomerReviewModel customerReviewModelFromJson(String str) =>
    CustomerReviewModel.fromJson(json.decode(str));

String customerReviewModelToJson(CustomerReviewModel data) =>
    json.encode(data.toJson());

class CustomerReviewModel {
  bool? status;
  Data? data;
  String? message;

  CustomerReviewModel({
    this.status,
    this.data,
    this.message,
  });

  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) =>
      CustomerReviewModel(
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
  List<FeedbackData>? feedback;
  Data({
    this.feedback,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        feedback: List<FeedbackData>.from(
            json["feedback"].map((x) => FeedbackData.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "feedback": List<dynamic>.from(feedback!.map((x) => x.toJson())),
      };
}

class FeedbackData {
  String? id;
  UserId? userId;
  double? rating;
  String? feedback;
  String? feedbackDate;
  int? totalGuest;
  String? destination;

  FeedbackData({
    this.id,
    this.userId,
    this.rating,
    this.feedback,
    this.feedbackDate,
    this.totalGuest,
    this.destination,
  });

  factory FeedbackData.fromJson(Map<String, dynamic> json) => FeedbackData(
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        rating: json["rating"].toDouble(),
        feedback: json["feedback"],
        feedbackDate: json["feedbackDate"],
        totalGuest: json["totalGuest"],
        destination: json["destination"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId!.toJson(),
        "rating": rating,
        "feedback": feedback,
        "feedbackDate": feedbackDate,
        "totalGuest": totalGuest,
        "destination": destination,
      };
}

class UserId {
  String? id;
  String? name;

  UserId({
    this.id,
    this.name,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
