import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginKey extends ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool isValidForm() {
    return loginFormKey.currentState?.validate() ?? false;
  }
}

final loginKeyProvider = ChangeNotifierProvider<LoginKey>((ref) {
  return LoginKey();
});

class RegisterKey extends ChangeNotifier {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  bool isValidForm() {
    return registerFormKey.currentState?.validate() ?? false;
  }
}

final registerKeyProvider = ChangeNotifierProvider<RegisterKey>((ref) {
  return RegisterKey();
});
