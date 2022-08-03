
import 'package:doc_hub/models/add_data_model.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class UpdatePatientDataRepo extends GetxService{
  final ApiClient apiClient;

  UpdatePatientDataRepo({required this.apiClient});

  Future<Response> updateData(String id, AddDataModel addDataModel) async{
    return await apiClient.updateData('api/v1/update/patient/$id/', addDataModel.toJson());
  }
}