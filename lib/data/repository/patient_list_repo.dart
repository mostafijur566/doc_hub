import 'package:doc_hub/data/api/api_client.dart';
import 'package:doc_hub/utils/app_contants.dart';
import 'package:get/get.dart';

class PatientListRepo extends GetxService{
  final ApiClient apiClient;
  PatientListRepo({required this.apiClient});
  
  Future<Response> getPatientList() async{
    return await apiClient.getData(AppConstants.GET_PATIENT_LIST_ENDPOINT);
  }

  Future<Response> getPatient(String id) async{
    return await apiClient.getData('api/v1/patient/$id/');
  }
}