import 'dart:convert';

AddBankModel addBankModelFromJson(String str) => AddBankModel.fromJson(json.decode(str));

String addBankModelToJson(AddBankModel data) => json.encode(data.toJson());

class AddBankModel {
    AddBankModel({
        this.status,
        this.message,
        this.user,
    });

    int status;
    String message;
    User user;

    factory AddBankModel.fromJson(Map<String, dynamic> json) => AddBankModel(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    User({
        this.accountInfo,
        this.referralCode,
        this.btcWalletAmount,
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.terms,
        this.user,
        this.createdAt,
        this.updatedAt,
    });

    AccountInfo accountInfo;
    String referralCode;
    String btcWalletAmount;
    String id;
    String firstName;
    String lastName;
    String email;
    bool terms;
    String user;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        accountInfo: AccountInfo.fromJson(json["accountInfo"]),
        referralCode: json["referralCode"],
        btcWalletAmount: json["btc_wallet_amount"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        terms: json["terms"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "accountInfo": accountInfo.toJson(),
        "referralCode": referralCode,
        "btc_wallet_amount": btcWalletAmount,
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "terms": terms,
        "user": user,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class AccountInfo {
    AccountInfo({
        this.accountNumber,
        this.bankName,
        this.accountName,
        this.bvn,
    });

    String accountNumber;
    String bankName;
    String accountName;
    String bvn;

    factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        accountNumber: json["accountNumber"],
        bankName: json["bankName"],
        accountName: json["accountName"],
        bvn: json["bvn"],
    );

    Map<String, dynamic> toJson() => {
        "accountNumber": accountNumber,
        "bankName": bankName,
        "accountName": accountName,
        "bvn": bvn,
    };
}
