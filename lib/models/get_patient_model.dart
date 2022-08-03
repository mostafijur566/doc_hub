class GetPatient {
  int? id;
  String? name;
  int? age;
  String? weight;
  String? gender;
  String? medicine;
  String? disease;
  String? createdAt;
  String? updatedAt;
  String? doctorId;

  GetPatient(
      {this.id,
        this.name,
        this.age,
        this.weight,
        this.gender,
        this.medicine,
        this.disease,
        this.createdAt,
        this.updatedAt,
        this.doctorId});

  GetPatient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    weight = json['weight'];
    gender = json['gender'];
    medicine = json['medicine'];
    disease = json['disease'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctorId = json['doctor_id'];
  }
}