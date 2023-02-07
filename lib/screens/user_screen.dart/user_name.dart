import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final dynamic username;
  const UserName({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      username,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ));
  }
}
