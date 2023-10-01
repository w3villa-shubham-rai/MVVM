class LoginResponseModel {
  String? token;
  bool? islogin;

  LoginResponseModel({this.token, this.islogin});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    islogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
     data['isLogin'] = this.token;
    return data;
  }
}
