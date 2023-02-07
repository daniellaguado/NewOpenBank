import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowPassword extends StateNotifier<bool> {
  ShowPassword() : super(true);
  void changeState() => state = state == true ? false : !state;
}

final showPasswordProvider = StateNotifierProvider<ShowPassword, bool>(
  (ref) => ShowPassword(),
);
