class UserInformationModel{
  String? pathImage;
  String? email;
  static const collectionName = "users";
  bool? isAccountSocial;
  String? id;
  String? fullName;
  UserInformationModel({ this.fullName, this.email, this.id,this.pathImage,this.isAccountSocial});
  UserInformationModel.formFireStore(Map<String,dynamic>?data):this(
    pathImage: data?['pathImage'],
    email: data?['email'],
    id: data?['id'],
    isAccountSocial: data?['isAccountSocial'],
    fullName: data?['name'],
  );
  Map<String,dynamic>toFireStore(){
    return {
      "name":fullName,
      "pathImage":pathImage,
      "email":email,
      "id":id,
      "isAccountSocial":isAccountSocial,
    };
  }

  @override
  String toString() {
    return 'InformationUserModel{fullName: $fullName, email: $email, pathImage: $pathImage}';
  }
}