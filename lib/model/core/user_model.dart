import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        this.success,
        this.data,
    });

    bool success;
    Data data;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
