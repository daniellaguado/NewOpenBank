import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openbank/models/user_models.dart';
import 'package:openbank/services/firestore_services.dart';
import 'package:openbank/services/select_image.dart';
import 'package:openbank/services/upload_image.dart';

class EditUser extends StatefulWidget {
  final dynamic userName;
  final dynamic userEmail;
  final dynamic userCpf;
  final dynamic userImgProfile;
  final dynamic userId;
  final dynamic userData;

  const EditUser({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.userCpf,
    required this.userImgProfile,
    required this.userId,
    required this.userData,
  }) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  // ignore: non_constant_identifier_names
  File? image_to_upload;
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController(text: widget.userEmail);
    TextEditingController imageProfileController =
        TextEditingController(text: widget.userImgProfile);

    const sizedBox = SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(86, 13, 50, 1),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // key: _formKey,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              // color: Colors.red,
                            ),
                            child: image_to_upload != null
                                ? Image.file(image_to_upload!)
                                : const FadeInImage(
                                    placeholder:
                                        AssetImage('assets/loading.gif'),
                                    image: AssetImage(
                                      'assets/no-image.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          )),
                      ElevatedButton(
                        onPressed: () async {
                          final XFile? image = await getImage();
                          setState(() {
                            image_to_upload = File(image!.path);
                          });
                        },
                        child: const Icon(Icons.camera_alt_outlined),
                      ),
                    ],
                  ),
                  sizedBox,

                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: widget.userData,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: widget.userCpf,
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizedBox,

                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: widget.userName,
                    ),
                  ),
                  sizedBox,

                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: widget.userEmail,
                    ),
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                      RegExp regExp = RegExp(pattern);

                      return regExp.hasMatch(value ?? '') ? null : '';
                    },
                  ),
                  //

                  sizedBox,
                  sizedBox,
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(86, 13, 50, 1),
                          padding: const EdgeInsets.only(left: 60, right: 60)),
                      onPressed: () async {
                        if (image_to_upload == null) {
                          return;
                        }
                        final uploaded = await uploadImage(image_to_upload!);

                        // if (uploaded) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Imagem subida com sucesso'),
                        //     ),
                        //   );
                        // } else {
                        //   const SnackBar(
                        //       content: Text(
                        //           'Erro ao momento de tentar subir a imagem'));
                        // }
                        await FirestoreHelper.update(UserModel(
                          id: widget.userId,
                          data: widget.userData,
                          cpf: widget.userCpf,
                          name: widget.userName,
                          email: emailController.text,
                          imgProfile: uploaded.toString(),
                        )).then((value) => Navigator.pop(context));
                      },
                      child: const Text('Salvar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
//
