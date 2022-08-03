import 'package:doc_hub/controllers/add_patient_controller.dart';
import 'package:doc_hub/controllers/auth_controller.dart';
import 'package:doc_hub/controllers/doc_info_controller.dart';
import 'package:doc_hub/controllers/patient_list_controller.dart';
import 'package:doc_hub/controllers/update_patient_data_controller.dart';
import 'package:doc_hub/data/api/api_client.dart';
import 'package:doc_hub/data/repository/add_patient_repo.dart';
import 'package:doc_hub/data/repository/auth_repo.dart';
import 'package:doc_hub/data/repository/doc_info_repo.dart';
import 'package:doc_hub/data/repository/patient_list_repo.dart';
import 'package:doc_hub/data/repository/update_patient_data_repo.dart';
import 'package:doc_hub/utils/app_contants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => DocInfoRepo(apiClient: Get.find()));
  Get.lazyPut(() => PatientListRepo(apiClient: Get.find()));
  Get.lazyPut(() => AddPatientRepo(apiClient: Get.find()));
  Get.lazyPut(() => UpdatePatientDataRepo(apiClient: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => DocInfoController(docInfoRepo: Get.find()));
  Get.lazyPut(() => PatientListController(patientListRepo: Get.find()), fenix: true);
  Get.lazyPut(() => AddPatientController(addPatientRepo: Get.find()));
  Get.lazyPut(() => UpdatePatientDataController(updatePatientDataRepo: Get.find()));
}