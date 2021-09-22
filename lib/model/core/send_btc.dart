import 'dart:convert';

SendBtc sendBtcModelFromJson(String str) => SendBtc.fromJson(json.decode(str));

String sendBtcModelToJson(SendBtc data) => json.encode(data.toJson());

class SendBtc {
    SendBtc({
        this.success,
        this.message,
        this.result,
    });

    bool success;
    String message;
    List<Result> result;

    factory SendBtc.fromJson(Map<String, dynamic> json) => SendBtc(
        success: json["success"],
        message: json["message"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.errorCode,
        this.message,
        this.details,
        this.serverTime,
    });

    int errorCode;
    String message;
    String details;
    int serverTime;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        errorCode: json["error_code"],
        message: json["message"],
        details: json["details"],
        serverTime: json["server_time"],
    );

    Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "message": message,
        "details": details,
        "server_time": serverTime,
    };
}
