import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:model_viewmodel_view_practice/models/login/login_response_model.dart';
import 'package:model_viewmodel_view_practice/repository/login_repositry.dart';
import 'package:model_viewmodel_view_practice/res/routes/routes_name.dart';
import 'package:model_viewmodel_view_practice/utils/utils.dart';
import 'package:model_viewmodel_view_practice/view_model/services/controller/user_perfernce/userperfence.dart';

class Loginviewmodel extends GetxController {
  final _api = LoginRepositry();
  UserPreference userPreference = UserPreference();
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordfocusnode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApimain() {
    loading.value = true;
    Map data = {
      'email': emailcontroller.value.text,
      'password': passwordcontroller.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        LoginResponseModel userModel = LoginResponseModel(
          token: value['token'],
          islogin: true
        );

        userPreference
            .saveUser(userModel)
            .then((value) {
          Get.toNamed(RouteName.homeview);
        }).onError((error, stackTrace) {});
        Utils.snackBar('login', 'login success');
      }
    }).onError((error, StackTrace) {
      loading.value = false;
      print(error.toString());
      Utils.snackBar('Error', error.toString());
    });
  }
}
