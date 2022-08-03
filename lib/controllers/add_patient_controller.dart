import 'package:doc_hub/data/repository/add_patient_repo.dart';
import 'package:doc_hub/models/add_data_model.dart';
import 'package:doc_hub/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientController extends GetxController{
  final AddPatientRepo addPatientRepo;

  AddPatientController({required this.addPatientRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> addData(AddDataModel addDataModel) async{
    _isLoading = true;
    update();

    Response response = await addPatientRepo.addData(addDataModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      if(response.body['status'] != 400){
        responseModel = ResponseModel(true, response.body["message"]);
        String message;
        message = response.body['message'];
        Get.snackbar(
            'Successful!', message,
            colorText: Colors.white,
            backgroundColor: Colors.green
        );
      }
      else{
        responseModel = ResponseModel(false, 'Something went wrong! Try again later');
        Get.snackbar(
            'Error!', 'Something went wrong! Try again later',
            colorText: Colors.white,
            backgroundColor: Colors.green
        );
      }
    }

    else{
      responseModel = ResponseModel(false, response.statusText!);
      print('cannot add patient');
    }
    _isLoading=false;
    update();
    return responseModel;
  }

  Future<void> deleteData(String id) async{
    Response response = await addPatientRepo.deleteData(id);

    if(response.statusCode == 200){
      String message = response.body['message'];
      Get.snackbar(
          'Successful!', message,
          colorText: Colors.white,
          backgroundColor: Colors.green
      );
    }

    else{
      Get.snackbar('Oops!', "Couldn't delete the blog!");
    }
  }
}