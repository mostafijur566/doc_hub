import 'package:doc_hub/controllers/doc_info_controller.dart';
import 'package:doc_hub/pages/add_patient_page.dart';
import 'package:doc_hub/pages/change_password_page.dart';
import 'package:doc_hub/pages/patient_list_page.dart';
import 'package:doc_hub/utils/app_colors.dart';
import 'package:doc_hub/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String name = '';
  String email = '';
  @override
  void initState(){
    super.initState();
    loadResource();
  }

  Future<void> loadResource() async{
    await Get.find<DocInfoController>().getUserInfo();
    setState((){
      name = Get.find<DocInfoController>().name!;
      email = Get.find<DocInfoController>().email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('Dashboard', ),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: AppColors.mainColor,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/images/doctor.jpg')),
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.key),
              title: Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              onTap: (){
                Get.to(ChangePasswordPage());
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.rightFromBracket, color: Colors.red,),
              title: Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 18
                ),
              ),
              onTap: () async{
                await Get.find<AuthController>().clearToken();
                Get.deleteAll();
                Get.off(LoginPage());
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<DocInfoController>(builder: (docInfo){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: 'Hello',
                            textColor: AppColors.textColor,
                            fontSize: 16),
                        SizedBox(
                          height: 2,
                        ),
                        CustomText(
                          text: docInfo.name == null ? '' : docInfo.name.toString(),
                          textColor: AppColors.textColor,
                          fontSize: 18,
                          weight: FontWeight.bold,
                        ),
                      ],
                    );
                  }),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/doctor.jpg'),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/home_img.png',
                width: 150,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(PatientListPage());
                        },
                        child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xFFe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(0, 5)),
                            BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.userPlus,
                            size: 35,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: 'Patients List',
                            textColor: AppColors.textColor,
                            fontSize: 18,
                            weight: FontWeight.bold,
                          )
                        ],
                    ),
                  ),
                      )),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(AddPatientPage());
                        },
                        child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xFFe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(0, 5)),
                            BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.userGroup,
                            size: 35,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: 'Add Patient',
                            textColor: AppColors.textColor,
                            fontSize: 18,
                            weight: FontWeight.bold,
                          )
                        ],
                    ),
                  ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
