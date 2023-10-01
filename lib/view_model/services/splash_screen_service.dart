import 'dart:async';

import 'package:get/get.dart';
import 'package:model_viewmodel_view_practice/res/routes/routes_name.dart';
import 'package:model_viewmodel_view_practice/view_model/services/controller/user_perfernce/userperfence.dart';

class SplashServices {
  UserPreference userperfernce = UserPreference();
  void isLogin() {
    userperfernce.getUser().then((value) {
      print(value.token);
      if (value.islogin==false || value.islogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.loginview));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.homeview));
      }
    });
  }
}
