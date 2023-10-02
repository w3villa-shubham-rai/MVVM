import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewmodel_view_practice/data/responsce/status.dart';
import 'package:model_viewmodel_view_practice/res/routes/routes_name.dart';
import 'package:model_viewmodel_view_practice/view_model/services/controller/home/home_view_model.dart';
import 'package:model_viewmodel_view_practice/view_model/services/controller/user_perfernce/userperfence.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  UserPreference up = UserPreference();
  // ignore: non_constant_identifier_names
  final homecontroller = Get.put(Homecontroller());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homecontroller.userlistApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Obx(() {
        switch (homecontroller.rxRequeststatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(child: Text("something went wrong"));
          case Status.COMOLETED:
            return ListView.builder(
              itemCount: homecontroller.UserList.value.data!.length,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage(homecontroller.UserList.value.data![index].avatar.toString())),
                  title: Text(homecontroller.UserList.value.data![index].firstName.toString()),
                  subtitle: Text(homecontroller.UserList.value.data![index].firstName.toString()),
                ),
              );
            });
          default:
            return SizedBox();
        }
      }),
    );
  }
}
