import 'package:flutter/material.dart';
import 'package:la_plaza/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:la_plaza/utils/colors.dart' as color;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late AnimationController _splashAnimationController;
  final logo = 'assets/logo.png';

  @override
  void initState() {
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _splashAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
    showLogo();
    dismissItems();
    navigateHome();
  }

  showLogo() async {
    _logoAnimationController.forward();
  }

  dismissItems() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    _splashAnimationController.forward();
  }

  navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 5500), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NavigationBar(indexPage: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.companyGreenColor,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _logoAnimationController,
                child: Image.asset(
                  logo,
                  width: 160,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FadeTransition(
              opacity: _splashAnimationController,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: color.AppColor.companyGreenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
