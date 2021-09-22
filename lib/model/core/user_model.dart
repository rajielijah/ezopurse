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
