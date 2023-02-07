import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openbank/models/user_models.dart';
import 'package:openbank/screens/user_screen.dart/user_image.dart';
import 'package:openbank/screens/user_screen.dart/user_name.dart';
import 'package:openbank/ui/custom_icon.dart';
import 'icon_manage_account.dart';

class UserScreen extends StatelessWidget {
  final UserModel user;
  const UserScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromRGBO(86, 13, 35, 1),
        leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then(
                  (value) => Navigator.pushReplacementNamed(context, 'main'));
            }),
        centerTitle: true,
        title: const Text(
          'OpenBank',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                height: 150,
                // margin: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(120)),
                  color: Color.fromRGBO(86, 13, 35, 1),
                ),
                child: Row(
                  children: [
                    UserImage(imgProfile: user.imgProfile),
                    UserName(
                      username: user.name,
                    ),
                    IconManageAccount(
                      userId: user.id,
                      userCpf: user.cpf,
                      userName: user.name,
                      userData: user.data,
                      userEmail: user.email,
                      userImgProfie: user.imgProfile,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: ((context, index) => const _ItemListView())),
          ),
          // const SizedBox(height: 100),

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomIcon(icon: Icons.cabin_sharp),
                CustomIcon(icon: Icons.access_time),
                CustomIcon(icon: Icons.accessibility_rounded),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomIcon(icon: Icons.account_balance_wallet_outlined),
                CustomIcon(icon: Icons.account_tree),
                CustomIcon(icon: Icons.account_balance_rounded),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class _ItemListView extends StatelessWidget {
  const _ItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color.fromARGB(255, 15, 15, 15), blurRadius: 4),
            ]),
        width: 300,
      ),
    );
  }
}
