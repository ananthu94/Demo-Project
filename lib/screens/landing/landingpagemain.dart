import 'package:flutter/material.dart';
import 'landingScreen/landing_screen1.dart';
import 'landingScreen/landing_screen2.dart';
import 'landingScreen/landing_screen3.dart';
import 'package:ecommerce_demo/screens/login/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecommerce_demo/permissionhandling/handlingpermission.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: const [
            Screen1(),
            Screen2(),
            Screen3(),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              padding: const EdgeInsets.all(15),
              height: 80,
              width: double.infinity,
              color: Colors.red[900],
              child: FloatingActionButton(
                onPressed: () {
                  requestPermissions();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                },
                shape: const CircleBorder(
                    side: BorderSide(width: 1, color: Colors.white)),
                backgroundColor: Colors.red[900],
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            )
          : Container(
              height: 80,
              color: Colors.red[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(3);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.white),
                      )),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const JumpingDotEffect(
                      verticalOffset: 10,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white60,
                      spacing: 15,
                    ),
                    onDotClicked: (index) {
                      controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      child: const Text('Next',
                          style: TextStyle(
                            color: Colors.white,
                          )))
                ],
              ),
            ),
    );
  }
}
