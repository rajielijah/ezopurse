import 'dart:convert';

GenerateAddressModel generateAddressModelFromJson(String str) => GenerateAddressModel.fromJson(json.decode(str));
String generateAddressModelToJson(GenerateAddressModel data) => json.encode(data.toJson());
class GenerateAddressModel {
    GenerateAddressModel({
        this.success,
        this.message,
        this.address,
    });
    bool success;
    String message;
    Address address;

    factory GenerateAddressModel.fromJson(Map<String, dynamic> json) => GenerateAddressModel(
        success: json["success"],
        message: json["message"],
        address: Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "address": address.toJson(),
    };
}

class Address {
    Address({
        this.id,
        this.user,
        this.paymentCode,
        this.confirmations,
        this.domainHash,
        this.address,
        this.domain,
        this.invoice,
        this.currency,
    });

    String id;
    User user;
    String paymentCode;
    int confirmations;
    String domainHash;
    String address;
    String domain;
    String invoice;
    String currency;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        paymentCode: json["payment_code"],
        confirmations: json["confirmations"],
        domainHash: json["domain_hash"],
        address: json["address"],
        domain: json["domain"],
        invoice: json["invoice"],
        currency: json["currency"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "payment_code": paymentCode,
        "confirmations": confirmations,
        "domain_hash": domainHash,
        "address": address,
        "domain": domain,
        "invoice": invoice,
        "currency": currency,
    };
}

class User {
    User({
        this.confirmed,
        this.id,
        this.email,
        this.password,
        this.referralId,
        this.type,
        this.createdAt,
        this.updatedAt,
    });

    bool confirmed;
    String id;
    String email;
    String password;
    String referralId;
    String type;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        confirmed: json["confirmed"],
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        referralId: json["referral_id"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "_id": id,
        "email": email,
        "password": password,
        "referral_id": referralId,
        "type": type,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
