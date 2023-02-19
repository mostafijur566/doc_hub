import 'package:doc_hub/controllers/patient_list_controller.dart';
import 'package:doc_hub/pages/add_patient_page.dart';
import 'package:doc_hub/utils/app_colors.dart';
import 'package:doc_hub/utils/theme.dart';
import 'package:doc_hub/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/PatientListModel.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({Key? key}) : super(key: key);

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {

  String query = '';
  List<Patients> patients = [];

  @override
  void initState() {
    super.initState();
    loadResource();
  }

  Future<void> loadResource() async{
    await Get.find<PatientListController>().getPatientList(query);
    patients = Get.find<PatientListController>().allPatientList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Patients",
          style: titleStyle.copyWith(fontSize: 20),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 10),
                        color: Colors.grey.withOpacity(0.2)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)
              ),
              child: TextField(
                onChanged: (value){
                  setState((){
                    query=value;
                    loadResource();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search Patient...',
                  prefixIcon: Icon(Icons.search,
                    color: AppColors.mainColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.white
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.white
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            GetBuilder<PatientListController>(builder: (getPatient){
              return getPatient.allPatientList.isEmpty ? Container(
                margin: EdgeInsets.only(top: 10),
                child: Center(
                  child: !getPatient.isLoading ? CircularProgressIndicator(color: AppColors.mainColor,) : Text('No data available!',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20,
                    ),
                  ),
                ),
              ) : Expanded(
                child: ListView.builder(
                    itemCount: getPatient.allPatientList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(AddPatientPage(id: getPatient.allPatientList[index].id.toString(),));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:  [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 0)),
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: getPatient.allPatientList[index].name.toString(), textColor: Colors.black, fontSize: 20,
                                weight: FontWeight.bold,),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text("Patient Age: ${getPatient.allPatientList[index].age.toString()}",
                                    style: subTitleStyle,
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Patient Weight: ${getPatient.allPatientList[index].weight.toString()}",
                                    style: subTitleStyle,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Text("Diseases: ${getPatient.allPatientList[index].disease.toString()}",
                                style: titleStyle,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            })
          ],
      ),
    );
  }
}