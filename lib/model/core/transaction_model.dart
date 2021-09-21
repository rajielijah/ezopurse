import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
    TransactionModel({
        this.success,
        this.result,
    });

    bool success;
    List<Result> result;

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        success: json["success"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.txList,
        this.nextPage,
    });

    List<TxList> txList;
    bool nextPage;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        txList: List<TxList>.from(json["tx_list"].map((x) => TxList.fromJson(x))),
        nextPage: json["next_page"],
    );

    Map<String, dynamic> toJson() => {
        "tx_list": List<dynamic>.from(txList.map((x) => x.toJson())),
        "next_page": nextPage,
    };
}

class TxList {
    TxList({
        this.blockHeight,
        this.type,
        this.hash,
        this.out,
        this.amount,
        this.address,
        this.fee,
        this.timelineBalance,
        this.timelineSentCount,
        this.timelineReceivedCount,
        this.timelineInvalidCount,
        this.createTimestamp,
        this.timestamp,
        this.createTime,
        this.time,
    });

    int blockHeight;
    String type;
    String hash;
    int out;
    int amount;
    String address;
    int fee;
    int timelineBalance;
    int timelineSentCount;
    int timelineReceivedCount;
    int timelineInvalidCount;
    int createTimestamp;
    int timestamp;
    DateTime createTime;
    DateTime time;

    factory TxList.fromJson(Map<String, dynamic> json) => TxList(
        blockHeight: json["block_height"] == null ? null : json["block_height"],
        type: json["type"],
        hash: json["hash"],
        out: json["out"],
        amount: json["amount"],
        address: json["address"],
        fee: json["fee"],
        timelineBalance: json["timeline_balance"],
        timelineSentCount: json["timeline_sent_count"],
        timelineReceivedCount: json["timeline_received_count"],
        timelineInvalidCount: json["timeline_invalid_count"],
        createTimestamp: json["create_timestamp"],
        timestamp: json["timestamp"],
        createTime: DateTime.parse(json["create_time"]),
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "block_height": blockHeight == null ? null : blockHeight,
        "type": type,
        "hash": hash,
        "out": out,
        "amount": amount,
        "address": address,
        "fee": fee,
        "timeline_balance": timelineBalance,
        "timeline_sent_count": timelineSentCount,
        "timeline_received_count": timelineReceivedCount,
        "timeline_invalid_count": timelineInvalidCount,
        "create_timestamp": createTimestamp,
        "timestamp": timestamp,
        "create_time": createTime.toIso8601String(),
        "time": time.toIso8601String(),
    };
}
