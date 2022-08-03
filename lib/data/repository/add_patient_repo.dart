import 'package:doc_hub/data/api/api_client.dart';
import 'package:doc_hub/utils/app_contants.dart';
import 'package:get/get.dart';

import '../../models/add_data_model.dart';

class AddPatientRepo extends GetxService{
  final ApiClient apiClient;
  AddPatientRepo({required this.apiClient});

  Future<Response> addData(AddDataModel addDataModel) async{
    return await apiClient.postData(AppConstants.ADD_PATIENT_DATA_ENDPOINT, addDataModel.toJson());
  }
  
  Future<Response> deleteData(String id) async{
    return await apiClient.deleteData("api/v1/delete/patient/$id/");
  }
}