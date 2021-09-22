import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
    ForgotPasswordModel({
        this.success,
        this.message,
    });

    bool success;
    String message;

    factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
