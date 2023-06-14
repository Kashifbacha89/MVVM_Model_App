import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static showToastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }
  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(15),
      titleColor: Colors.white,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(20),
      reverseAnimationCurve: Curves.easeOut,
      backgroundColor: Colors.red,
      positionOffset: 20,
      icon: const Icon(Icons.error,size: 20,color: Colors.white,),

    )..show(context));
  }
  //For Focus Node in TextFormField
  static void fieldFocusChange(BuildContext context,
      FocusNode current,
      FocusNode nextFocus,

      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}