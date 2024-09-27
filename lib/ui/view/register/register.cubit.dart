import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeleton/constant/password_validation.dart';
import 'package:skeleton/constant/status.k.dart';
import 'package:skeleton/ui/view/register/register.state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState()) {
    _listen();
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

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
    confirmPassword.addListener(() {
      emit(state.copyWith(
        confirmedPassword: confirmPassword.text,
      ));
    });
  }

  void check(String value) {
    final result = validPassword(value);
    if (result.contains(PasswordValidation.length) &&
        result.contains(PasswordValidation.specialCharacter) &&
        result.contains(PasswordValidation.character)) {
      emit(state.copyWith(
        isValid: true,
      ));
    } else {
      emit(state.copyWith(
        isValid: false,
      ));
    }
  }

  Future<void> register() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final UserCredential userCredential =
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('olala').doc(user.uid).set({
          'email': email.text,
          'uid': user.uid,
        });
      };

      Fluttertoast.showToast(
        msg: 'Register successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      emit(state.copyWith(
        status: Status.loaded,
      ));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
      );
      emit(
        state.copyWith(
          status: Status.idle,
        ),
      );
    }
  }

  Set<PasswordValidation> validPassword(String password) {
    final result = <PasswordValidation>{};
    if (password.length >= 8) {
      result.add(PasswordValidation.length);
    }
    if (password.contains(RegExp('[a-z]')) ||
        password.contains(RegExp('[A-Z]'))) {
      result.add(PasswordValidation.character);
    }
    if (password.contains(RegExp('[0-9]')) &&
        password.contains(RegExp(r'[,.!@#$%&*\-_]'))) {
      result.add(PasswordValidation.specialCharacter);
    }
    return result;
  }
}
