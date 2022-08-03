class Patient {
  int? _totalPatients;
  late List<Patients> _patients;
  List<Patients> get patients => _patients;

  Patient({required totalPatients, required patients}){
    _totalPatients = totalPatients;
    _patients = patients;
  }

  Patient.fromJson(Map<String, dynamic> json) {
    _totalPatients = json['total_patients'];
    if (json['patients'] != null) {
      _patients = <Patients>[];
      json['patients'].forEach((v) {
        _patients.add(new Patients.fromJson(v));
      });
    }
  }
}

class Patients {
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

  Patients(
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

  Patients.fromJson(Map<String, dynamic> json) {
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