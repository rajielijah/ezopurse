import 'dart:convert';

SendBtc sendBtcFromJson(String str) => SendBtc.fromJson(json.decode(str));

String sendBtcToJson(SendBtc data) => json.encode(data.toJson());

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
        this.txList,
    });

    List<TxList> txList;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        txList: List<TxList>.from(json["tx_list"].map((x) => TxList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tx_list": List<dynamic>.from(txList.map((x) => x.toJson())),
    };
}

class TxList {
    TxList({
        this.txHash,
        this.out,
        this.amount,
        this.address,
        this.type,
        this.commitment,
    });

    String txHash;
    dynamic out;
    int amount;
    String address;
    String type;
    String commitment;

    factory TxList.fromJson(Map<String, dynamic> json) => TxList(
        txHash: json["tx_hash"],
        out: json["out"],
        amount: json["amount"],
        address: json["address"],
        type: json["type"],
        commitment: json["commitment"],
    );

    Map<String, dynamic> toJson() => {
        "tx_hash": txHash,
        "out": out,
        "amount": amount,
        "address": address,
        "type": type,
        "commitment": commitment,
    };
}
