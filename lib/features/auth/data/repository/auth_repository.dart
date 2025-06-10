import 'package:firebase_auth/firebase_auth.dart';
import 'package:ts/features/auth/data/repository/local_repository.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final AuthRepositories repositories = AuthRepositories();

  Future<String> register({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final token = await userCredential.user?.getIdToken();
      repositories.saveToken(token.toString());
      return token ?? '';
    } on FirebaseAuthException catch (e) {
      throw _mapErrorToUzbek(e);
    }
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final token = await userCredential.user?.getIdToken();
      repositories.saveToken(token.toString());
      return token ?? '';
    } on FirebaseAuthException catch (e) {
      throw _mapErrorToUzbek(e);
    }
  }

  Future<void> logout() async {
    repositories.removeToken();
    await _auth.signOut();
  }

  String _mapErrorToUzbek(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Bunday foydalanuvchi topilmadi.';
      case 'wrong-password':
        return 'Parol noto‘g‘ri.';
      case 'email-already-in-use':
        return 'Bu email allaqachon ro‘yxatdan o‘tgan.';
      case 'invalid-email':
        return 'Email noto‘g‘ri formatda.';
      case 'weak-password':
        return 'Parol juda oddiy. Kuchliroq parol kiriting.';
      default:
        return 'Nomaʼlum xatolik: ${e.message}';
    }
  }
}
