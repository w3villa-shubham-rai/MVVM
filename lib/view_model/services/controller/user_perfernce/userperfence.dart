import 'package:get/get.dart';
import 'package:model_viewmodel_view_practice/models/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(LoginResponseModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    sp.setBool('islogin', responseModel.islogin!);
    return true;
  }

  Future<LoginResponseModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
     bool? isLogin = sp.getBool('islogin');
    return LoginResponseModel(
      token: token,
      islogin: isLogin
    );
  }

  Future<bool> removeuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
