import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.email,
        this.password,
        this.isLoggedIn
    }); 

    String email;
    String password;
    bool isLoggedIn;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
        isLoggedIn: json['isLoggedIn']
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}


// class LoginModel {
//   String email;
//   String token;
//   bool isLoggedIn;
//   String userId;
//   List<String> role;
//   String resetToken;
//   LoginModel({
//     this.email,
//     this.token,
//     this.isLoggedIn,
//     this.role,
//     this.userId,
//     this.resetToken,
//   });

//   factory LoginModel.fromJson(Map<String, dynamic> responseData) {
//     print(responseData);
//     return LoginModel(
//         email: responseData['email'],
//         isLoggedIn: responseData['isLoggedIn'],
//         userId: responseData['userId'],
//         role: responseData['role'] != null
//             ? new List<String>.from(responseData['role'])
//             : null,
//         token: responseData['access_token'],
//         resetToken: responseData['reset_token']);
//   }

//   Map<String, dynamic> toJson() => {
//         'token': token,
//         'email': email,
//         'isLoggedIn': isLoggedIn,
//         'role': role,
//         'userId': userId,
//         'reset_token': resetToken
//       };
    
// }
