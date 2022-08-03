import 'package:doc_hub/controllers/patient_list_controller.dart';
import 'package:doc_hub/pages/add_patient_page.dart';
import 'package:doc_hub/utils/app_colors.dart';
import 'package:doc_hub/utils/theme.dart';
import 'package:doc_hub/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({Key? key}) : super(key: key);

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {

  @override
  void initState() {
    super.initState();
    loadResource();
  }

  Future<void> loadResource() async{
    await Get.find<PatientListController>().getPatientList();
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
                          margin: EdgeInsets.only(top: 10,),
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xFFe8e8e8),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 5)),
                                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: getPatient.allPatientList[index].name, textColor: Colors.black, fontSize: 20,
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