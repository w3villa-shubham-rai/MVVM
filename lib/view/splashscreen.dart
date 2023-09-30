import 'package:flutter/material.dart';
import 'package:model_viewmodel_view_practice/data/app_exception.dart';
import 'package:model_viewmodel_view_practice/res/components/internet_exceptions_widget.dart';
import 'package:model_viewmodel_view_practice/utils/utils.dart';
import 'package:model_viewmodel_view_practice/view_model/services/splash_screen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashservie = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservie.isLogin();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
      body: const Center(
          child: Text(
        "Welcome \n Back",
        textAlign: TextAlign.center,
      )),
    );
  }
}
