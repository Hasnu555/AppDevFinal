import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SignInState { initial, loading, success, error }

class SignInCubit extends Cubit<SignInState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignInCubit() : super(SignInState.initial);

  Future<void> signIn(String email, String password) async {
    emit(SignInState.loading);

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        emit(SignInState.success);
      } else {
        emit(SignInState.error);
      }
    } catch (e) {
      emit(SignInState.error);
    }
  }
}
