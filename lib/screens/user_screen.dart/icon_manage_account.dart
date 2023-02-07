import 'package:flutter/material.dart';

import '../edit_user_screen.dart/edit_user.dart';

class IconManageAccount extends StatelessWidget {
  final dynamic userId;
  final dynamic userName;
  final dynamic userEmail;
  final dynamic userCpf;
  final dynamic userData;
  final dynamic userImgProfie;

  const IconManageAccount({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userCpf,
    required this.userData,
    required this.userImgProfie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
          color: Colors.white60,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditUser(
                  userName: userName,
                  userCpf: userCpf,
                  userEmail: userEmail,
                  userId: userId,
                  userImgProfile: userImgProfie,
                  userData: userData,
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.manage_accounts,
            size: 30,
          )),
    );
  }
}
