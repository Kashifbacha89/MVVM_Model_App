import 'package:flutter/material.dart';
import 'package:mvvm_model_app/utils/routes/routes_name.dart';
import 'package:mvvm_model_app/view/home_view.dart';
import 'package:mvvm_model_app/view/login_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>const LoginView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}