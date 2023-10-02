import 'package:get/get.dart';
import 'package:model_viewmodel_view_practice/data/responsce/status.dart';
import 'package:model_viewmodel_view_practice/models/home/user_list_model.dart';
import 'package:model_viewmodel_view_practice/repository/homerepositry/home_repositry.dart';

class Homecontroller extends GetxController {
  final _api = HomeRepositry();
  final rxRequeststatus = Status.LOADING.obs;
  final UserList = UserListModel().obs;

  void setRxRequestStatus(Status _value) {
    rxRequeststatus.value = _value;
  }

  void setUserList(UserListModel _value) {
    UserList.value = _value;
  }

  void userlistApi() {
    setRxRequestStatus(Status.COMOLETED);
    _api.userListApi().then((value) {
      setUserList(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }
}
