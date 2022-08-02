import 'package:doc_hub/utils/app_colors.dart';
import 'package:doc_hub/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'Hello', textColor: AppColors.textColor, fontSize: 16),
                      SizedBox(height: 8,),
                      CustomText(text: 'Fahim Goni', textColor: AppColors.textColor, fontSize: 18, weight: FontWeight.bold,),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/doctor.jpg'),
                  )
                ],
              ),

              SizedBox(height: 30,),
              Image.asset('assets/images/home_img.png', width: 150,),
              
              Row(
                children: [
                  Expanded(
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
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.userPlus, size: 35, color: AppColors.mainColor,),
                            SizedBox(height: 20,),
                            CustomText(text: 'Patients List', textColor: AppColors.textColor, fontSize: 18, weight: FontWeight.bold,)
                          ],
                        ),
                      )
                  ),

                  Expanded(
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
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.userGroup, size: 35, color: AppColors.mainColor,),
                            SizedBox(height: 20,),
                            CustomText(text: 'Add Patient', textColor: AppColors.textColor, fontSize: 18, weight: FontWeight.bold,)
                          ],
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height: 70,),
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Icon(FontAwesomeIcons.rightFromBracket, color: AppColors.mainColor, size: 35,),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomText(text: 'Log Out', textColor: AppColors.textColor, fontSize: 18, weight: FontWeight.w600,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
