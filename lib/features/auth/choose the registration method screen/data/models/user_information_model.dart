class UserInformationModel{
  String? pathImage;
  String? email;
  static const collectionName = "users";
  bool? isAccountSocial;
  String? phoneNumber;
  String? id;
  String? fullName;
  UserInformationModel({ this.fullName, this.email, this.id,this.phoneNumber,this.pathImage,this.isAccountSocial});
  UserInformationModel.formFireStore(Map<String,dynamic>?data):this(
    pathImage: data?['pathImage'],
    email: data?['email'],
    id: data?['id'],
    isAccountSocial: data?['isAccountSocial'],
    fullName: data?['name'],
    phoneNumber: data?["phone"],
  );
  Map<String,dynamic>toFireStore(){
    return {
      "name":fullName,
      "pathImage":pathImage,
      "phone":phoneNumber,
      "email":email,
      "id":id,
      "isAccountSocial":isAccountSocial,
    };
  }

  @override
  String toString() {
    return 'InformationUserModel{fullName: $fullName, email: $email, phoneNumber: $phoneNumber, pathImage: $pathImage}';
  }
}