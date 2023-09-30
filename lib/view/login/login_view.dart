import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:model_viewmodel_view_practice/res/components/roundedbtn.dart';
import 'package:model_viewmodel_view_practice/utils/utils.dart';
import 'package:model_viewmodel_view_practice/view_model/services/controller/login_view_model.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final loginViewModel = Get.put(Loginviewmodel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginViewModel.emailcontroller.value,
                    focusNode: loginViewModel.emailFocusNode.value,
                    validator: (value) {
                      Utils.snackBar('email', 'plese correct the email');
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginViewModel.emailFocusNode.value,
                          loginViewModel.emailFocusNode.value);
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter email', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: loginViewModel.passwordcontroller.value,
                    focusNode: loginViewModel.passwordfocusnode.value,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (value) {
                      Utils.snackBar('password', 'plese enter the pasword');
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter password', border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundButton(
                width: 200,
                title: 'login',
                onPress: () {
                  if (_formkey.currentState!.validate()) {
                    loginViewModel.loginApi();
                  }
                })
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('Loginviewmodel', Loginviewmodel));
  }
}
