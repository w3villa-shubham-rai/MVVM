import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewmodel_view_practice/res/routes/routes_name.dart';
import 'package:model_viewmodel_view_practice/view_model/services/controller/user_perfernce/userperfence.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  UserPreference up = UserPreference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                up.removeuser().then((value) {
                  Get.toNamed(RouteName.loginview);
                });
              },
              icon: Icon(Icons.login_outlined)),
        ],
      ),
    );
  }
}
