import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewmodel_view_practice/repository/login_repositry.dart';
import 'package:model_viewmodel_view_practice/utils/utils.dart';

class Loginviewmodel extends GetxController {
  final _api = LoginRepositry();
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordfocusnode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApi() {
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
        Utils.snackBar('login', 'login success');
      }
    }).onError((error, StackTrace) {
      loading.value = false;
      print(error.toString());
      Utils.snackBar('Error', error.toString());
    });
  }
}






 