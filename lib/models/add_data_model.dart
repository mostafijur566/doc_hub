class AddDataModel {
  String doctorId;
  String name;
  int age;
  double weight;
  String gender;
  String medicine;
  String disease;

  AddDataModel(
      {required this.doctorId,
      required this.name,
      required this.age,
      required this.weight,
      required this.gender,
      required this.medicine,
      required this.disease
      });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['name'] = name;
    data['age'] = age;
    data['weight'] = weight;
    data['gender'] = gender;
    data['medicine'] = medicine;
    data['disease'] = disease;

    return data;
  }
}
