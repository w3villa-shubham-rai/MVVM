import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/state_manager.dart';
import 'package:model_viewmodel_view_practice/res/routes/routes_name.dart';
import 'package:model_viewmodel_view_practice/view/home/home_view.dart';
import 'package:model_viewmodel_view_practice/view/login/login_view.dart';
import 'package:model_viewmodel_view_practice/view/splashscreen.dart';

class AppRoutes {

  static appRoutes() => [

    GetPage(name: RouteName.splashScreen, 
    page: ()=>SplashScreen(),
    transitionDuration: Duration(microseconds: 250),
    transition: Transition.leftToRightWithFade),


    GetPage(name: RouteName.loginview, 
    page: ()=>Loginview(),
    transitionDuration: Duration(microseconds: 250),
    transition: Transition.leftToRightWithFade),


    GetPage(name: RouteName.homeview, 
    page: ()=>Homeview(),
    transitionDuration: Duration(microseconds: 250),
    transition: Transition.leftToRightWithFade),



  


  ];
}
