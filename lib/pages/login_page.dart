import 'package:doc_hub/utils/app_colors.dart';
import 'package:doc_hub/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  icon: Icons.email),
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
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
