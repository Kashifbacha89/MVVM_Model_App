import 'package:mvvm_model_app/data/responce/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status,this.data,this.message);
  ApiResponse.loading():status=Status.LOADING;
  ApiResponse.completed():status=Status.COMPLETED;
  ApiResponse.error():status=Status.ERROR;

  @override
  String toString(){
    return "status:$status \n message:$message\n Data:$data";

  }

}