import 'package:doc_hub/data/api/api_client.dart';
import 'package:doc_hub/models/change_password_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/signin_body.dart';
import '../../models/signup_body.dart';
import '../../utils/app_contants.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async{
    return await apiClient.post(AppConstants.REGISTER_ENDPOINT, signUpBody.toJson());
  }

  Future<String> getUserToken() async{
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }

  bool userLoggedIn() {
    getUserToken();
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> login(SignInBody signInBody) async{
    return await apiClient.post(AppConstants.LOGIN_ENDPOINT, signInBody.toJson());
  }

  Future<bool> saveUserToken(String token) async{
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveEmailAndPassowrd(String email, String password) async{
    try{
      await sharedPreferences.setString(AppConstants.EMAIL, email);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }
    catch(e){
      throw e;
    }
  }

  Future<void> clearToken() async{
    await sharedPreferences.clear();
  }

  Future<Response> changedPassword(ChangePasswordModel changePasswordModel) async{
    return await apiClient.updateData(AppConstants.CHANGE_PASSWORD_ENDPOINT, changePasswordModel.toJson());
  }
}