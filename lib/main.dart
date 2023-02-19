import 'package:doc_hub/pages/add_patient_page.dart';
import 'package:doc_hub/pages/home_page.dart';
import 'package:doc_hub/pages/login_page.dart';
import 'package:doc_hub/pages/patient_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<AuthController>().userLoggedIn();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doc Hub',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const LoginPage()
    );
  }
}
