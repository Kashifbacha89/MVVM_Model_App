import 'package:flutter/material.dart';
import 'package:mvvm_model_app/resources/app_colors.dart';
class RoundButton extends StatelessWidget {
  const RoundButton({Key? key,
  required this.title,
    this.loading=false,
    required this.onPress,


  }) : super(key: key);
  final String title;
  final bool loading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: loading?const CircularProgressIndicator(color: Colors.white,):Text(title,style: TextStyle(color: AppColors.whiteColor),)),
      ),
    );
  }
}
