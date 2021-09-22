// To parse this JSON data, do
//
//     final walletStateModel = walletStateModelFromJson(jsonString);

import 'dart:convert';

WalletStateModel walletStateModelFromJson(String str) => WalletStateModel.fromJson(json.decode(str));

String walletStateModelToJson(WalletStateModel data) => json.encode(data.toJson());

class WalletStateModel {
    WalletStateModel({
        this.success,
        this.balance,
        this.result,
    });

    bool success;
    List<int> balance;
    List<Result> result;

    factory WalletStateModel.fromJson(Map<String, dynamic> json) => WalletStateModel(
        success: json["success"],
        balance: List<int>.from(json["balance"].map((x) => x)),
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "balance": List<dynamic>.from(balance.map((x) => x)),
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.addressCount,
        this.pendingReceivedAmount,
        this.pendingSentAmount,
        this.receivedAmount,
        this.sentAmount,
        this.serviceFeePaidAmount,
        this.sentTx,
        this.receivedTx,
        this.pendingSentTx,
        this.pendingReceivedTx,
        this.invalidTx,
        this.balanceAmount,
        this.createDate,
        this.createDateTimestamp,
        this.lastUsedNonce,
        this.walletIdHash,
        this.notificationLinkDomain,
        this.successCallbacks,
        this.failedCallbacks,
        this.currency,
    });

    int addressCount;
    int pendingReceivedAmount;
    int pendingSentAmount;
    int receivedAmount;
    int sentAmount;
    int serviceFeePaidAmount;
    int sentTx;
    int receivedTx;
    int pendingSentTx;
    int pendingReceivedTx;
    int invalidTx;
    int balanceAmount;
    DateTime createDate;
    int createDateTimestamp;
    int lastUsedNonce;
    String walletIdHash;
    String notificationLinkDomain;
    int successCallbacks;
    int failedCallbacks;
    String currency;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressCount: json["address_count"],
        pendingReceivedAmount: json["pending_received_amount"],
        pendingSentAmount: json["pending_sent_amount"],
        receivedAmount: json["received_amount"],
        sentAmount: json["sent_amount"],
        serviceFeePaidAmount: json["service_fee_paid_amount"],
        sentTx: json["sent_tx"],
        receivedTx: json["received_tx"],
        pendingSentTx: json["pending_sent_tx"],
        pendingReceivedTx: json["pending_received_tx"],
        invalidTx: json["invalid_tx"],
        balanceAmount: json["balance_amount"],
        createDate: DateTime.parse(json["create_date"]),
        createDateTimestamp: json["create_date_timestamp"],
        lastUsedNonce: json["last_used_nonce"],
        walletIdHash: json["wallet_id_hash"],
        notificationLinkDomain: json["notification_link_domain"],
        successCallbacks: json["success_callbacks"],
        failedCallbacks: json["failed_callbacks"],
        currency: json["currency"],
    );

    Map<String, dynamic> toJson() => {
        "address_count": addressCount,
        "pending_received_amount": pendingReceivedAmount,
        "pending_sent_amount": pendingSentAmount,
        "received_amount": receivedAmount,
        "sent_amount": sentAmount,
        "service_fee_paid_amount": serviceFeePaidAmount,
        "sent_tx": sentTx,
        "received_tx": receivedTx,
        "pending_sent_tx": pendingSentTx,
        "pending_received_tx": pendingReceivedTx,
        "invalid_tx": invalidTx,
        "balance_amount": balanceAmount,
        "create_date": createDate.toIso8601String(),
        "create_date_timestamp": createDateTimestamp,
        "last_used_nonce": lastUsedNonce,
        "wallet_id_hash": walletIdHash,
        "notification_link_domain": notificationLinkDomain,
        "success_callbacks": successCallbacks,
        "failed_callbacks": failedCallbacks,
        "currency": currency,
    };
}
