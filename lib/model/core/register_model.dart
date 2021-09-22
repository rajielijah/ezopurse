import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.terms,
    });

    String firstName;
    String lastName;
    String email;
    String password;
    bool terms;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        terms: json["terms"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "terms": terms,
    };
}
