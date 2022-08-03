import 'package:doc_hub/data/repository/patient_list_repo.dart';
import 'package:doc_hub/models/PatientListModel.dart';
import 'package:doc_hub/models/get_patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientListController extends GetxController{
  final PatientListRepo patientListRepo;
  PatientListController({required this.patientListRepo});

  List<dynamic> _allPatientList = [];
  List<dynamic> get allPatientList => _allPatientList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? name;
  int? age;
  String? weight;
  String? gender;
  String? medicine;
  String? disease;

  Future<void> getPatientList() async{
    Response response = await patientListRepo.getPatientList();
    if(response.statusCode == 200){
      _allPatientList = [];
      _allPatientList.addAll(Patient.fromJson(response.body).patients);
      _isLoading = true;
      update();
    }

    else{
      Get.snackbar('Error!', 'Please check your internet connection!',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
  }

  Future<void> getPatient(String id) async{
    Response response = await patientListRepo.getPatient(id);
    if(response.statusCode == 200){
      name = GetPatient.fromJson(response.body).name;
      age = GetPatient.fromJson(response.body).age;
      weight = GetPatient.fromJson(response.body).weight;
      gender = GetPatient.fromJson(response.body).gender;
      medicine = GetPatient.fromJson(response.body).medicine;
      disease = GetPatient.fromJson(response.body).disease;

      _isLoading = true;
      update();
    }

    else{
      Get.snackbar('Error!', 'Please check your internet connection!',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
  }
}