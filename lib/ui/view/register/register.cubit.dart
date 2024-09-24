import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/constant/status.k.dart';
import 'package:skeleton/ui/view/register/register.state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState()) {
    _listen();
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> _listen() async {
    email.addListener(() {
      emit(state.copyWith(
        email: email.text,
      ));
    });
    password.addListener(() {
      emit(state.copyWith(
        password: password.text,
      ));
    });
  }

  Future<void> register() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    emit(state.copyWith(status: Status.loading));
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      emit(state.copyWith(status: Status.loaded));
    } on FirebaseAuthException catch (_) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
