class DocInfoModel{
  String? name;
  String? email;
  String? username;

  DocInfoModel({this.name, this.email, this.username});

  DocInfoModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    username = json['username'];
  }
}