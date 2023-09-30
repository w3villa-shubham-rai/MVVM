import 'package:model_viewmodel_view_practice/data/responsce/status.dart';

class ApiResponce<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponce(this.status, this.data, this.message);

  ApiResponce.loading() : status = Status.LOADING;
  ApiResponce.completed(this.data) : status = Status.COMOLETED;
  ApiResponce.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n message: $message \n Data:$data";
  }
}
