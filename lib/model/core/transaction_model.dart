import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    this.success,
    this.buySells,
  });

  bool success;
  List<BuySell> buySells;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
          success: json["success"],
          buySells: json["buySells"] != null
              ? List<BuySell>.from(
                  json["buySells"].map((x) => BuySell.fromJson(x)))
              : List<BuySell>());

  Map<String, dynamic> toJson() => {
        "success": success,
        "buySells": List<dynamic>.from(buySells.map((x) => x.toJson())),
      };
}

class BuySell {
  BuySell({
    this.transactionStatus,
    this.id,
    this.amount,
    this.proof,
    this.transactionType,
    this.userId,
    this.transactionId,
    this.addressId,
    this.createdAt,
    this.updatedAt,
  });

  String transactionStatus;
  String id;
  int amount;
  String proof;
  String transactionType;
  String userId;
  String transactionId;
  String addressId;
  DateTime createdAt;
  DateTime updatedAt;

  factory BuySell.fromJson(Map<String, dynamic> json) => BuySell(
        transactionStatus: json["transactionStatus"],
        id: json["_id"],
        amount: json["amount"],
        proof: json["proof"],
        transactionType: json["transactionType"],
        userId: json["userId"],
        transactionId: json["transactionId"],
        addressId: json["addressId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "transactionStatus": transactionStatus,
        "_id": id,
        "amount": amount,
        "proof": proof,
        "transactionType": transactionType,
        "userId": userId,
        "transactionId": transactionId,
        "addressId": addressId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}









// import 'dart:convert';

// TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

// String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

// class TransactionModel {
//     TransactionModel({
//         this.success,
//         this.result,
//     });

//     bool success;
//     List<Result> result;

//     factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
//         success: json["success"],
//         result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "result": List<dynamic>.from(result.map((x) => x.toJson())),
//     };
// }

// class Result {
//     Result({
//         this.transactions,
//         this.pendingTransactions,
//     });

//     Transactions transactions;
//     Transactions pendingTransactions;

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         transactions: Transactions.fromJson(json["transactions"]),
//         pendingTransactions: Transactions.fromJson(json["pending_transactions"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "transactions": transactions.toJson(),
//         "pending_transactions": pendingTransactions.toJson(),
//     };
// }

// class Transactions {
//     Transactions({
//         this.txList,
//         this.nextPage,
//     });

//     List<TxList> txList;
//     bool nextPage;

//     factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
//         txList: List<TxList>.from(json["tx_list"].map((x) => TxList.fromJson(x))),
//         nextPage: json["next_page"],
//     );

//     Map<String, dynamic> toJson() => {
//         "tx_list": List<dynamic>.from(txList.map((x) => x.toJson())),
//         "next_page": nextPage,
//     };
// }

// class TxList {
//     TxList({
//         this.blockHeight,
//         this.type,
//         this.hash,
//         this.out,
//         this.amount,
//         this.address,
//         this.fee,
//         this.timelineBalance,
//         this.timelineSentCount,
//         this.timelineReceivedCount,
//         this.timelineInvalidCount,
//         this.createTimestamp,
//         this.timestamp,
//         this.createTime,
//         this.time,
//     });

//     int blockHeight;
//     String type;
//     String hash;
//     int out;
//     int amount;
//     String address;
//     int fee;
//     int timelineBalance;
//     int timelineSentCount;
//     int timelineReceivedCount;
//     int timelineInvalidCount;
//     int createTimestamp;
//     int timestamp;
//     DateTime createTime;
//     DateTime time;

//     factory TxList.fromJson(Map<String, dynamic> json) => TxList(
//         blockHeight: json["block_height"] == null ? null : json["block_height"],
//         type: json["type"],
//         hash: json["hash"],
//         out: json["out"],
//         amount: json["amount"],
//         address: json["address"],
//         fee: json["fee"],
//         timelineBalance: json["timeline_balance"],
//         timelineSentCount: json["timeline_sent_count"],
//         timelineReceivedCount: json["timeline_received_count"],
//         timelineInvalidCount: json["timeline_invalid_count"],
//         createTimestamp: json["create_timestamp"],
//         timestamp: json["timestamp"],
//         createTime: DateTime.parse(json["create_time"]),
//         time: DateTime.parse(json["time"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "block_height": blockHeight == null ? null : blockHeight,
//         "type": type,
//         "hash": hash,
//         "out": out,
//         "amount": amount,
//         "address": address,
//         "fee": fee,
//         "timeline_balance": timelineBalance,
//         "timeline_sent_count": timelineSentCount,
//         "timeline_received_count": timelineReceivedCount,
//         "timeline_invalid_count": timelineInvalidCount,
//         "create_timestamp": createTimestamp,
//         "timestamp": timestamp,
//         "create_time": createTime.toIso8601String(),
//         "time": time.toIso8601String(),
//     };
// }
