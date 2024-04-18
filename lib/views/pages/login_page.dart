import 'package:ar_market/controller/auth.dart';
import 'package:ar_market/utilities/routes.dart';
import 'package:flutter/material.dart';
import '../../utilities/assets_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.loginScrean,
            width: size.width * 1,
            height: size.height * 0.8,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Text(
                    "Welcom A.M Market",
                    style: TextStyle(fontSize: 24, color: Colors.orangeAccent),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.deepOrange)),
                        onPressed: () {
                         Auth().signInWithGoogle().then((result) {
                            Navigator.of(context).pushReplacementNamed(
                                AppRoutes.navBarPageRoute);
                          });
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "login With Gmail",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
