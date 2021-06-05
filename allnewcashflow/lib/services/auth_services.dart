part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  static DocumentReference userDoc;

  static Future<String> signUp(Users users) async {
    await Firebase.initializeApp();
    String dateNow = AcitivityServices.dateNow();
    String msg = "";
    String token = "";
    String uid = "";
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: users.email, password: users.password);
    uid = userCredential.user.uid;
    token = await userCredential.user.getIdToken();

    await userCollection.doc(uid).set({
      'uid': uid,
      'name': users.name,
      'phone': users.phone,
      'email': users.email,
      'password': users.password,
      'token': token,
      'isOn': '0',
      'createdAt': dateNow,
      'updateAt': dateNow
    }).then((value) {
      msg = "Success";
    }).catchError((onError) {
      msg = onError;
    });
    return msg;
  }
}
