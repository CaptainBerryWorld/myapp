import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return UserModel(uid: user!.uid, email: user.email!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return UserModel(uid: user!.uid, email: user.email!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
