part of 'services.dart';

class AuthServices {
  
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  static DocumentReference userDoc;

  static Future<String> signUp(Users users) async {
    await Firebase.initializeApp();
    String dateNow = AcitivityServices.dateNow();
    String msg = "";
    String token = "";
    String uid = "";
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: users.email, password: users.password);
    uid = userCredential.user.uid;
    token = await userCredential.user.getIdToken();

    await userCollection.doc(uid).set({
    'uid' : uid,
    'name' : users.name,
    'phone' : users.phone,
    'email' : users.email,
    'password' : users.password,
    'token' : token,
    'isOn': '0',
    'createdAt' : dateNow,
    'updateAt' : dateNow
    }).then((value){
      msg = "Success";
    }).catchError((onError){
      msg = onError;
    });
    return msg;
  }
  
static Future<String> signIn(String email, String password) async{
    await Firebase.initializeApp();
    String dateNow = AcitivityServices.dateNow();
    String uid = "";
    String msg = "";

    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    uid = userCredential.user.uid;

    await userCollection.doc(uid).update({
      'isOn': '1',
      'updatedAt': dateNow,
    }).then((value){
      msg = "success";
    }).catchError((onError){
      msg = onError;
    });

    return msg;
  }

   static Future<bool> signOut() async{
    await Firebase.initializeApp();
    String dateNow = AcitivityServices.dateNow();
    String uid = auth.currentUser.uid;

    await auth.signOut().whenComplete((){
      userCollection.doc(uid).update({
        'isOn': '0',
        'updatedAt': dateNow,
      });
    });

    return true;
  }

}
