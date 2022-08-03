import 'package:doc_hub/pages/home_page.dart';
import 'package:doc_hub/utils/app_colors.dart';
import 'package:doc_hub/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';
import '../models/signin_body.dart';
import '../widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:doc_hub/helper/dependencies.dart' as dep;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userLoggedIn();
  }

  userLoggedIn() async{
    if(Get.find<AuthController>().userLoggedIn()){
      await Get.find<AuthController>().loggedInUser();
      Get.off(HomePage());
    }
  }

  void _login(AuthController authController) async{

    String email = emailController.text.toLowerCase().trim();
    String password = passwordController.text;

    if (email.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Email field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Password field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.length <= 6) {
      Get.snackbar(
        'Oops!',
        'Password length should be at least 6 character!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else{
      SignInBody signInBody = SignInBody(username: email, password: password);
      authController.login(signInBody).then((status)  async{
        if(status.isSuccess){
          await dep.init();
          Get.off(HomePage());
        }
        else{
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<AuthController>(builder: (_authController){
          return !_authController.isLoading ? SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.fill,
                  ),
                  CustomText(
                    text: 'DoctorHUB',
                    textColor: AppColors.mainColor,
                    fontSize: 50,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                      text: 'Get all patient\'s data online!',
                      textColor: AppColors.mainColor,
                      fontSize: 15),
                  SizedBox(
                    height: 30,
                  ),
                  AppTextField(
                    emailController: emailController,
                    hintText: 'Email',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    emailController: passwordController,
                    hintText: 'Password',
                    icon: Icons.password,
                    hideText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      _login(_authController);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor),
                      child: Center(
                        child: CustomText(
                          text: 'Log In',
                          textColor: Colors.white,
                          fontSize: 20,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ) :
          const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),);
        },),
      ),
    );
  }
}
