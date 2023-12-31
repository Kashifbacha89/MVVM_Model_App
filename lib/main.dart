import 'package:flutter/material.dart';
import 'package:mvvm_model_app/utils/routes/routes_name.dart';
import 'package:mvvm_model_app/view/login_view.dart';
import 'package:mvvm_model_app/view_model/auth_view_model.dart';

import 'utils/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewModel()),
    ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RouteName.login,
          onGenerateRoute: Routes.generateRoute,
        ),);
  }
}


