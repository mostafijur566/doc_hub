import 'package:doc_hub/utils/theme.dart';
import 'package:doc_hub/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PatientListPage extends StatelessWidget {
  const PatientListPage({Key? key}) : super(key: key);

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
          onTap: () {},
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            showSearch(
                context: context,
                delegate: MySearchDelegate());
          },
            icon: Icon(Icons.search, color: Colors.black,),
          )
        ],
      ),
      body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
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
                          CustomText(text: "Fahim", textColor: Colors.black, fontSize: 20,
                            weight: FontWeight.bold,),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("Patient Age: 23",
                                style: subTitleStyle,
                              ),
                              SizedBox(width: 10,),
                              Text("Patient Weight: 87",
                                style: subTitleStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text("Diseases: Cancer",
                            style: titleStyle,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){

      },
    )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
