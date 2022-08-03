import 'package:doc_hub/data/repository/update_patient_data_repo.dart';
import 'package:doc_hub/models/add_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/response_model.dart';

class UpdatePatientDataController extends GetxController{
  final UpdatePatientDataRepo updatePatientDataRepo;

  UpdatePatientDataController({required this.updatePatientDataRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> updateData(String id, AddDataModel addDataModel) async{
    _isLoading = true;
    update();

    Response response = await updatePatientDataRepo.updateData(id, addDataModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      responseModel = ResponseModel(true, response.body['message']);
      Get.snackbar(
          'Successful!', response.body['message'],
          colorText: Colors.white,
          backgroundColor: Colors.green
      );
    }

    else{
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading=false;
    update();
    return responseModel;
  }
}