import 'package:belajar_ppkd/day10/grid.dart';
import 'package:belajar_ppkd/day12/tugas5.dart';
import 'package:belajar_ppkd/tugasUI/components/button.dart';
import 'package:belajar_ppkd/tugasUI/components/custom_text_field.dart';
import 'package:belajar_ppkd/tugasUI/components/ext_login_button.dart';
import 'package:belajar_ppkd/tugasUI/components/input_text.dart';
import 'package:flutter/material.dart';
// import 'components/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List<bool> _isSelected = [true, false];
  int _selectedIndex = 0;
  bool isFilled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isFilled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(),
          margin: EdgeInsets.only(top: 72),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff222222),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Login to access your account",
                style: TextStyle(color: Color(0xff888888)),
              ),
              SizedBox(height: 24),
              // Center(
              //   child: ToggleButtons(
              //     borderRadius: BorderRadius.circular(8),
              //     constraints: BoxConstraints(minHeight: 40, minWidth: 140),
              //     isSelected: _isSelected,
              //     onPressed: (index) {
              //     setState(() {
              //       for (int i = 0; i < _isSelected.length; i++) {
              //         _isSelected[i] = i == index;
              //       }
              //       _selectedIndex = index;
              //     });
              //   }, children: [
              //     Text("Phone Number"),
              //     Text("Email"),
              //   ]),
              // ),
              Container(
                //Switch Phone Number, Email
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xfff5f5f5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 4, top: 4, bottom: 4),
                        width: 152,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Colors.white
                              : Color(0xfff5f5f5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _selectedIndex = 0;
                            setState(() {});
                          },
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                              color: Color(0xff646464),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Spacer(),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 4, top: 4, bottom: 4),
                        alignment: Alignment.center,
                        width: 152,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Color(0xfff5f5f5)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _selectedIndex = 1;
                            setState(() {});
                          },
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: Color(0xff646464),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _selectedIndex == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phone Number'),
                              SizedBox(height: 16),
                              CustomTextField(
                                controller: phoneController,
                                hint: 'Enter your phone number',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Phone number harus diisi";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email'),
                              SizedBox(height: 16),
                              CustomTextField(
                                controller: emailController,
                                hint: 'Enter your email',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email harus diisi";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                    SizedBox(height: 24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Password'),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: passwordController,
                          hint: '*****',
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password harus diisi";
                            }
                            if (value.length < 8) {
                              return "Password minimal 8 karakter";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ButtonWidget(
                      // isEnable: isFilled,
                      text: 'Request OTP',
                      height: 56,
                      width: double.infinity,
                      click: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Semua field harus diisi"),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Divider(color: Color(0xfff2f2f2), thickness: 1),
                  ),
                  Text(
                    'Or Sign In With',
                    style: TextStyle(color: Color(0xff888888)),
                  ),
                  Expanded(
                    child: Divider(color: Color(0xfff2f2f2), thickness: 1),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                spacing: 32,
                children: [
                  ExtLogButton(
                    text: 'Google',
                    height: 48,
                    width: 155,
                    icon: 'assets/images/iconGoogle.png',
                  ),
                  ExtLogButton(
                    text: 'Facebook',
                    height: 48,
                    width: 155,
                    icon: 'assets/images/iconFacebook.png',
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xff888888)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xff21BDCA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
