import 'package:belajar_ppkd/components/custom_button.dart';
import 'package:belajar_ppkd/components/custom_input_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: Center(
        child: Stack(
          // alignment: AlignmentGeometry.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              width: 343,
              height: 553,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.fromBorderSide(
                  BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  height(12),
                  Text("Enter your email and password to login"),
                  height(24),
                  InputForm(),
                  height(8),
                  InputForm(),
                  height(16),
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                rememberMe = !rememberMe;
                              });
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets
                                  .zero, // 🔹 Hilangin padding horizontal default
                              minimumSize: Size(
                                0,
                                0,
                              ), // opsional, biar gak nambah space
                              tapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap, // rapat area klik
                            ),
                            child: Text(
                              "Remember Me",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: Color(0xff4D81E7),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  height(24),
                  Button(buttonText: "Login", height: 48, width: 295),
                  height(24),
                  Text("Or login with"),
                  height(24),
                  Row(
                    children: [
                      // ImageButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);
}
