import 'package:model_viewmodel_view_practice/data/network/network_api_services.dart';
import 'package:model_viewmodel_view_practice/res/app_url/app_url.dart';

class LoginRepositry {
  final _apiservice = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic responsce = _apiservice.postApi(data, AppUrl.loginApi);
    return responsce;
  } 
}
