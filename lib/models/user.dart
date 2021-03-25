class Users {
  final String idUser;
  final String userName;
  final String email;
  final String birthDate;
  final String phone;
  final String adresse;
  final String sexe;
  Users(
      {this.idUser,
      this.userName,
      this.email,
      this.adresse,
      this.birthDate,
      this.phone,
      this.sexe});
  Users.fromData(Map<String, dynamic> data)
      : idUser = data['id_user'],
        email = data['email'],
        adresse = data['adresse'],
        birthDate = data['birth_date'],
        sexe = data['sexe'],
        userName = data['user_name'],
        phone = data['phone'];
  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'user_name': userName,
      'sexe': sexe,
      'phone': phone,
      'birth_date': birthDate,
      'email': email,
      'adresse': adresse,
    };
  }
}
