class ForgotPasswordData {
  bool? success;
  int? userId;
  String? email;
  String? message;

  ForgotPasswordData({this.success, this.userId, this.email, this.message});

  ForgotPasswordData.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    userId = json["user_id"];
    email = json["email"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    data["user_id"] = userId;
    data["email"] = email;
    data["message"] = message;
    return data;
  }
}
