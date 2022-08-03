import 'package:doc_hub/widgets/button.dart';
import 'package:flutter/material.dart';

import '../utils/theme.dart';
import '../widgets/input_field.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {

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
              MyInputField(title: "Name", hint: "Enter name",),
              MyInputField(title: "Age", hint: "Enter age",),
              MyInputField(title: "Weight", hint: "Enter weight",),
              MyInputField(title: "Gender", hint: "Enter gender",),
              MyInputField(title: "Medicine", hint: "Enter medicine",),
              MyInputField(title: "Disease", hint: "Enter disease"),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(label: "Add Patient",
                      onTap: (){

                  }),
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
