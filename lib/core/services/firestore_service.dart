import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/auth/choose the registration method screen/data/models/user_information_model.dart';

class FirestoreService{
  static CollectionReference<UserInformationModel> getUsersCollection(){
    return FirebaseFirestore.instance.collection(UserInformationModel.collectionName).withConverter(
      fromFirestore: (snapshot, options) =>
          UserInformationModel.formFireStore(snapshot.data()),
      toFirestore: (value, options) => value.toFireStore(),
    );
  }
  static Future<void> createUser(UserInformationModel userModel)async{
    var usersCollection = getUsersCollection();
    var doc = usersCollection.doc(userModel.id);
    await doc.set(userModel);
  }
  static Future<void> removeUser(String uId)async{
    var usersCollection = getUsersCollection();
    var doc = usersCollection.doc(uId);
    await doc.delete();
  }
  static Future<UserInformationModel?> getUser(String uid)async{
    var doc = getUsersCollection().doc(uid);
    var docSnapshot = await doc.get();
    return docSnapshot.data();
  }
  static Future<void> editFieldInUser(
      {required String uid, required Map<String, dynamic> newData})async{
    var doc = getUsersCollection().doc(uid);
    await doc.update(newData);
  }
}