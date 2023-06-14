import 'package:flutter/material.dart';
import 'package:mvvm_model_app/resources/components/round_button.dart';
import 'package:mvvm_model_app/utils/general_utils.dart';
import 'package:mvvm_model_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height*1;
    final authViewModel=Provider.of<AuthViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  focusNode: emailFocus,

                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  onFieldSubmitted: (v) {
                    Utils.fieldFocusChange(context, emailFocus, passwordFocus);
                  },
                ),
                 SizedBox(height: height*.03,),
                ValueListenableBuilder(
                    valueListenable: obscurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: passwordController,
                        focusNode: passwordFocus,
                        obscureText: obscurePassword.value,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: 'password',
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () {
                                obscurePassword.value = !obscurePassword.value;
                              },
                              child: Icon(obscurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility)),
                        ),
                      );
                    }),
                SizedBox(height: height*0.086,),
                RoundButton(
                    loading: authViewModel.loading,
                    title: 'Login', onPress: (){
                  if(emailController.text.isEmpty){
                    Utils.flushBarErrorMessage('please enter a email', context);
                  }
                  else if(passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage('please enter a password', context);

                  }else if(passwordController.text.length <6){
                    Utils.flushBarErrorMessage('please enter atleast 6 digits password', context);
                  }
                  else{
                    Map data={
                      'email':emailController.text.toString(),
                      'password':passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data,context);
                  }
                }),
              ],
            ),
          ),
        ));
  }
}
