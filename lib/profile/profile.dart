import 'package:flutter/material.dart';
import 'package:la_plaza/utils/colors.dart' as color;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final logo = 'assets/la_plaza_logo.png';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: color.AppColor.backgroundColor,
        title: Image.asset(
          logo,
          width: size.width * 0.5,
        ),
      ),
      body: Center(
        child: Text(
          'Perfil',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color.AppColor.lightGreenColor,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
