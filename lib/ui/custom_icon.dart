import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color.fromRGBO(86, 13, 35, 1),
      maxRadius: 30,
      child: Icon(
        icon,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}
