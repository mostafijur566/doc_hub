import 'package:doc_hub/pages/add_patient_page.dart';
import 'package:doc_hub/pages/home_page.dart';
import 'package:doc_hub/pages/login_page.dart';
import 'package:doc_hub/pages/patient_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const PatientListPage()
    );
  }
}
