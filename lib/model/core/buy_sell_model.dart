import 'dart:convert';

BuySellModel buySellModelFromJson(String str) =>
    BuySellModel.fromJson(json.decode(str));

String buySellModelToJson(BuySellModel data) => json.encode(data.toJson());

class BuySellModel {
  BuySellModel({
    this.success,
    this.message,
  });

  bool success;
  String message;

  factory BuySellModel.fromJson(Map<String, dynamic> json) => BuySellModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
