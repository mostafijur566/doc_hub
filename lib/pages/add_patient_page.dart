import 'package:doc_hub/controllers/add_patient_controller.dart';
import 'package:doc_hub/controllers/doc_info_controller.dart';
import 'package:doc_hub/controllers/patient_list_controller.dart';
import 'package:doc_hub/controllers/update_patient_data_controller.dart';
import 'package:doc_hub/models/add_data_model.dart';
import 'package:doc_hub/pages/home_page.dart';
import 'package:doc_hub/widgets/button.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/theme.dart';
import '../widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:doc_hub/helper/dependencies.dart' as dep;

class AddPatientPage extends StatefulWidget {
  AddPatientPage({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {

  var user;
  String? name;
  String? age;
  String? weight;
  String? gender;
  String? medicine;
  String? disease;

  void initState() {
    super.initState();
    loadResource();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController medicineController = TextEditingController();
  TextEditingController diseaseController = TextEditingController();

  deletePost() async{
    await Get.find<AddPatientController>().deleteData(widget.id.toString());
  }

  Future<void> loadResource() async{
    await Get.find<DocInfoController>().getUserInfo();
    user = Get.find<DocInfoController>().username;
    if(widget.id != null){
      await Get.find<PatientListController>().getPatient(widget.id.toString());
      name = Get.find<PatientListController>().name;
      age = Get.find<PatientListController>().age.toString();
      weight = Get.find<PatientListController>().weight;
      gender = Get.find<PatientListController>().gender;
      medicine = Get.find<PatientListController>().medicine;
      disease = Get.find<PatientListController>().disease;

      nameController.text = name!;
      ageController.text = age!;
      weightController.text = weight!;
      genderController.text = gender!;
      medicineController.text = medicine!;
      diseaseController.text = disease!;
    }
  }

  Future<void> addData(AddPatientController addPatientController) async{
    String name = nameController.text;
    String age = ageController.text;
    String weight = weightController.text;
    String gender = genderController.text;
    String medicine = medicineController.text;
    String disease = diseaseController.text;

    if(name.isEmpty){
      Get.snackbar('Oops!', 'Name field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(age.isEmpty){
      Get.snackbar('Oops!', 'Age field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(weight.isEmpty){
      Get.snackbar('Oops!', 'Weight field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(gender.isEmpty){
      Get.snackbar('Oops!', 'Gender field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(medicine.isEmpty){
      Get.snackbar('Oops!', 'Medicine field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(disease.isEmpty){
      Get.snackbar('Oops!', 'Disease field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else{
      AddDataModel addDataModel = AddDataModel(doctorId: user, name: name, age: int.parse(age), weight: double.parse(weight), gender: gender, medicine: medicine, disease: disease);
      addPatientController.addData(addDataModel).then((status) async{
        if(status.isSuccess){
          await dep.init();
          Get.to(HomePage());
        }
        else{

        }
      });
    }
  }

  Future<void> updateData(UpdatePatientDataController updatePatientDataController) async{
    String name = nameController.text;
    String age = ageController.text;
    String weight = weightController.text;
    String gender = genderController.text;
    String medicine = medicineController.text;
    String disease = diseaseController.text;

    if(name.isEmpty){
      Get.snackbar('Oops!', 'Name field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(age.isEmpty){
      Get.snackbar('Oops!', 'Age field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(weight.isEmpty){
      Get.snackbar('Oops!', 'Weight field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(gender.isEmpty){
      Get.snackbar('Oops!', 'Gender field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(medicine.isEmpty){
      Get.snackbar('Oops!', 'Medicine field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else if(disease.isEmpty){
      Get.snackbar('Oops!', 'Disease field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else{
      AddDataModel addDataModel = AddDataModel(doctorId: user, name: name, age: int.parse(age), weight: double.parse(weight), gender: gender, medicine: medicine, disease: disease);
      updatePatientDataController.updateData(widget.id.toString(), addDataModel).then((status) async{
        if(status.isSuccess){
          await dep.init();
          Get.to(HomePage());
        }
        else{

        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => AddPatientController(addPatientRepo: Get.find()));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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

      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        width: double.maxFinite,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Patient',
                style: headingStyle,
              ),
              MyInputField(title: "Name", hint: "Enter name", controller: nameController,),
              MyInputField(title: "Age", hint: "Enter age", controller: ageController,),
              MyInputField(title: "Weight", hint: "Enter weight", controller: weightController,),
              MyInputField(title: "Gender", hint: "Enter gender", controller: genderController,),
              MyInputField(title: "Medicine", hint: "Enter medicine", controller: medicineController,),
              MyInputField(title: "Disease", hint: "Enter disease", controller: diseaseController,),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.id == null ? Container() : GestureDetector(
                    onTap: (){
                      deletePost();
                      Get.to(HomePage());
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                      ),

                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget.id == null ? Container() : SizedBox(width: 10,),
                  widget.id == null ? Container() : GestureDetector(
                    onTap: (){
                      var updateController = Get.find<UpdatePatientDataController>();
                      updateData(updateController);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: AppColors.mainColor, width: 2)
                      ),

                      child: Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget.id == null ? GetBuilder<AddPatientController>(builder: (addPatient){
                    return MyButton(label: "Add Patient",
                        onTap: (){
                          addData(addPatient);
                        });
                  }) :  Container()
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
