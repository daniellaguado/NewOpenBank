import 'package:flutter/material.dart';
import 'package:openbank/models/user_models.dart';
import 'package:openbank/screens/screens_routs.dart';
import 'package:openbank/services/firestore_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       icon: Icon(Icons.abc),
      //       onPressed: () {
      //         FirestoreHelper;
      //       }),
      //   title: Text('home'),
      // ),
      body: Column(
        children: [
          // InkWell(
          //   onTap: () {
          //     FirebaseAuth.instance
          //         .signOut()
          //         .then((value) => Navigator.popAndPushNamed(context, 'login'));
          //   },
          //   child: Container(
          //       width: 120,
          //       height: 35,
          //       decoration: BoxDecoration(
          //         color: Colors.red,
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //       child: const Center(
          //           child: Text(
          //         'Sing Out',
          //         style: TextStyle(
          //             color: Colors.white, fontWeight: FontWeight.bold),
          //       ))),
          // ),
          Expanded(
            child: StreamBuilder<List<UserModel>>(
              stream: FirestoreHelper.read(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.hasData) {
                  final userData = streamSnapshot.data;

                  return ListView.builder(
                    itemCount: userData!.length, //number of rows
                    itemBuilder: (context, index) {
                      final singleUser = userData[index];
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserScreen(
                                  user: UserModel(
                                    name: singleUser.name,
                                    id: singleUser.id,
                                    cpf: singleUser.cpf,
                                    data: singleUser.data,
                                    email: singleUser.email,
                                    imgProfile: singleUser.imgProfile,
                                  ),
                                ),
                              ),
                            );
                          },
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Apagar'),
                                    content: const Text(
                                        'Tem certeza que você quer apagar?'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            FirestoreHelper.delete(singleUser)
                                                .then((value) =>
                                                    Navigator.pop(context));
                                          },
                                          child: const Text('Apagar'))
                                    ],
                                  );
                                });
                          },
                          leading: Text('${singleUser.email}'),

                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => EditUser(
                          //         user: UserModel(
                          //             name: singleUser.name,
                          //             id: singleUser.id),
                          //       ),
                          //     ),
                          //   );
                          //   // Navigator.pushNamed(context, 'edit');
                          // },
                          //     child: Icon(Icons.edit)),
                          // title: Text('${singleUser.email}'),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
