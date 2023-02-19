import 'package:doc_hub/controllers/auth_controller.dart';
import 'package:doc_hub/models/change_password_model.dart';
import 'package:doc_hub/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/doc_info_controller.dart';
import '../utils/theme.dart';
import '../widgets/input_field.dart';

import 'package:get/get.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool hide = false;

  String name = '';
  String email = '';
  @override
  void initState(){
    super.initState();
    loadResource();
  }

  Future<void> loadResource() async{
    await Get.find<DocInfoController>().getUserInfo();
    setState((){
      name = Get.find<DocInfoController>().name!;
      email = Get.find<DocInfoController>().email!;
    });
  }

  _changePassword(){
    hide = true;
    String oldPassword = oldPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    if(oldPassword.isEmpty){
      Get.snackbar('Please', 'Please insert your old password',
          icon: Icon(FontAwesomeIcons.stop,),
          backgroundColor: Colors.red
      );
    }

    else if(newPassword.isEmpty){
      Get.snackbar('Please', 'Please insert new password',
          icon: Icon(FontAwesomeIcons.stop,),
          backgroundColor: Colors.red
      );
    }

    else if(confirmPassword.isEmpty){
      Get.snackbar('Please', 'Please insert confirm password',
          icon: Icon(FontAwesomeIcons.stop,),
          backgroundColor: Colors.red
      );
    }
    ChangePasswordModel changePasswordModel = ChangePasswordModel(oldPassword: oldPassword, newPassword: newPassword, confirmNewPassword: confirmPassword);
    Get.find<AuthController>().changePassword(changePasswordModel)..then((status) {
      if(status.isSuccess){
        hide = false;
        Get.to(HomePage());
      }
      else{
        hide = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Change Password",
          style: titleStyle.copyWith(fontSize: 20),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/images/doctor.jpg')),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 22,
                ),
              ),
              Text(
                email,
              ),
              MyInputField(title: "Old Password", hint: "old password", controller: oldPasswordController,),
              MyInputField(title: "New Password", hint: "new password", controller: newPasswordController,),
              MyInputField(title: "Confirm Password", hint: "confirm password", controller: confirmPasswordController,),
              SizedBox(height: 20,),
              hide ? Container() : GestureDetector(
                onTap: (){
                  _changePassword();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                  ),

                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
