import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        this.email,
        this.password,
        this.isLoggedIn
    });

    String email;
    String password;
    bool isLoggedIn;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        email: json["email"],
        password: json["password"],
        isLoggedIn: json['isLoggedIn']
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
