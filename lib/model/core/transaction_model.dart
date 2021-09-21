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
        this.transactions,
        this.pendingTransactions,
    });

    Transactions transactions;
    Transactions pendingTransactions;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        transactions: Transactions.fromJson(json["transactions"]),
        pendingTransactions: Transactions.fromJson(json["pending_transactions"]),
    );

    Map<String, dynamic> toJson() => {
        "transactions": transactions.toJson(),
        "pending_transactions": pendingTransactions.toJson(),
    };
}

class Transactions {
    Transactions({
        this.txList,
        this.nextPage,
    });

    List<dynamic> txList;
    bool nextPage;

    factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        txList: List<dynamic>.from(json["tx_list"].map((x) => x)),
        nextPage: json["next_page"],
    );

    Map<String, dynamic> toJson() => {
        "tx_list": List<dynamic>.from(txList.map((x) => x)),
        "next_page": nextPage,
    };
}
