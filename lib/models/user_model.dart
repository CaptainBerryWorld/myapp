class UserModel {
  final String uid;
  final String email;

  UserModel({required this.uid, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
    );
  }
}
