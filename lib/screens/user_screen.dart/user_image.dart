import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final String? imgProfile;
  const UserImage({
    Key? key,
    required this.imgProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: imgProfile == ""
              ? const FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover,
                )
              : FadeInImage(
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(
                    '$imgProfile',
                  ),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
