class ChangePasswordModel{
  String? oldPassword;
  String? newPassword;
  String? confirmNewPassword;

  ChangePasswordModel({required this.oldPassword, required this.newPassword, required this.confirmNewPassword});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    data['confirm_new_password'] = confirmNewPassword;
    return data;
  }
}