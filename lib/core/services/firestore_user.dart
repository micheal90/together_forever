import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:together_forever/models/user_model.dart';

class FireStoreUser {
 static final CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection('users');

  static Future addUserToFireStore(UserModel userModel) async {
    await userCollectionReference.doc(userModel.userId).set(userModel.toMap());
  }

 static Future<DocumentSnapshot> getCurrentUserFromFireStore(String uId) async {
    var val = await userCollectionReference.doc(uId).get();
    return val;
  }
}
