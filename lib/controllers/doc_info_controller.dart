import 'package:doc_hub/data/repository/doc_info_repo.dart';
import 'package:doc_hub/models/doc_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocInfoController extends GetxController{
  final DocInfoRepo docInfoRepo;
  DocInfoController({required this.docInfoRepo});

  String? name;
  String? email;
  String? username;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getUserInfo() async{
    Response response = await docInfoRepo.getUserInfo();
    if(response.statusCode == 200){
      name = DocInfoModel.fromJson(response.body).name;
      email = DocInfoModel.fromJson(response.body).email;
      username = DocInfoModel.fromJson(response.body).username;
      _isLoading = true;
      update();
    }

    else{
      print('400');
      Get.snackbar('Error!', 'Something went wrong!',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
  }
}