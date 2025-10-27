import 'package:belajar_ppkd/components/custom_button.dart';
import 'package:belajar_ppkd/components/custom_input_form.dart';
import 'package:belajar_ppkd/components/custome_image_button.dart';
import 'package:belajar_ppkd/view/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool rememberMe = false;
  final TextEditingController fullNameC = TextEditingController();
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff8C5CF5), Color(0xffEB489A)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: AlignmentGeometry.center,
                        child: Text(
                          "I",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                      height(16),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          color: Color(0xff101828),
                          fontSize: 30,
                        ),
                      ),
                      height(8),
                      Text(
                        "Start managing your inventory today",
                        style: TextStyle(
                          color: Color(0x60101828),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  height(32),
                  Container(
                    padding: EdgeInsets.all(24),
                    width: 343,
                    // height: 453,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(8),
                        Text(
                          "Full Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        height(8),
                        InputForm(
                          hint: "Enter your full name",
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                        height(24),
                        Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        height(8),
                        InputForm(
                          hint: "Enter your username",
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                        height(24),
                        Text(
                          "Email Address",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        height(8),
                        InputForm(
                          hint: "Enter your email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        height(24),
                        Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        height(8),
                        InputForm(
                          hint: "Enter your password",
                          prefixIcon: Icon(Icons.lock_outline),
                          isPassword: true,
                        ),
                        height(24),
                        Text(
                          "Confirm Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        height(8),
                        InputForm(
                          hint: "Confirm your password",
                          isPassword: true,
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                        ),
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
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0x80101828),
                                    ),
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
                        Button(
                          buttonText: "Sign In",
                          height: 48,
                          width: 295,
                          icon: Icons.arrow_forward,
                        ),
                        height(24),
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(child: Divider(color: Color(0x20101828))),
                            Text(
                              "Or login with",
                              style: TextStyle(color: Color(0x60101828)),
                            ),
                            Expanded(child: Divider(color: Color(0x20101828))),
                          ],
                        ),
                        height(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 12,
                          children: [
                            ImageButton(
                              image: 'assets/images/iconGoogle.png',
                              buttonText: "Google",
                              onPressed: () {},
                            ),
                            ImageButton(
                              image: 'assets/images/Vector.png',
                              buttonText: "Github",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Color(0x60101828)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Color(0xff8B5CF6)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);
}
