import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/auth_repo.dart';
import '../models/response_model.dart';
import '../models/signin_body.dart';
import '../models/signup_body.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async{
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      if(response.body["status"] == 400){
        responseModel = ResponseModel(false, response.body["message"]);
        Get.snackbar('Error!', response.body["message"].toString(),
            colorText: Colors.white,
            backgroundColor: Colors.redAccent);
      }
      else{
        authRepo.saveUserToken(response.body["token"]);
        responseModel = ResponseModel(true, response.body["message"]);
        Get.snackbar('Success!', response.body["message"].toString(),
            colorText: Colors.white,
            backgroundColor: Colors.green
        );
      }
    }
    else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading=false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(SignInBody signInBody) async{
    _isLoading = true;
    update();
    Response response = await authRepo.login(signInBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, "success");
    }
    else{
      responseModel = ResponseModel(false, "Unable to log in with provided credentials.");
      Get.snackbar('Error!', "Unable to log in with provided credentials.",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
    _isLoading=false;
    update();
    return responseModel;
  }

  Future <void> loggedInUser() async{
    String token;
    token = await authRepo.getUserToken();
    authRepo.saveUserToken(token);
  }

  void saveEmailAndPassword(String email, String password){
    authRepo.saveEmailAndPassowrd(email, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  Future<void> clearToken() async{
    await authRepo.clearToken();
  }
}