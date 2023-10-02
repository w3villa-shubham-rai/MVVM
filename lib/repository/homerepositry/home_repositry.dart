import 'package:model_viewmodel_view_practice/data/network/network_api_services.dart';
import 'package:model_viewmodel_view_practice/models/home/user_list_model.dart';
import 'package:model_viewmodel_view_practice/res/app_url/app_url.dart';

class HomeRepositry {
  final _apiservice = NetworkApiServices();
  Future<UserListModel> userListApi() async {
    Map<String,dynamic> responsce = await _apiservice.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(responsce);
  }
}
