import 'package:mvvm_model_app/data/network/base_api_services.dart';
import 'package:mvvm_model_app/data/network/network_api_services.dart';
import 'package:mvvm_model_app/resources/app_urls.dart';

/*
class AuthRepository{
  BaseApiServices _apiServices= NetworkAPiServices();
  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;

    }catch(e){
      throw(e);
    }
  }
}*/
class AuthRepository  {

  BaseApiServices _apiServices = NetworkApiService() ;


  Future<dynamic> loginApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response ;

    }catch(e){
      throw e ;
    }
  }

  /*Future<dynamic> signUpApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response ;


    }catch(e){
      throw e ;
    }
  }*/

}