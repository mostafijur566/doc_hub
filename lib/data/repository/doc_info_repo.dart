import 'package:doc_hub/data/api/api_client.dart';
import 'package:doc_hub/utils/app_contants.dart';
import 'package:get/get.dart';

class DocInfoRepo extends GetxService{
  final ApiClient apiClient;
  DocInfoRepo({required this.apiClient});

  Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstants.DOC_INFO_ENDPOINT);
  }
}