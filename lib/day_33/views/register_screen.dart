import 'package:belajar_ppkd/day_33/extensions/navigation.dart';
import 'package:belajar_ppkd/day_33/models/user.dart';
import 'package:belajar_ppkd/day_33/services/api.dart';
import 'package:belajar_ppkd/day_33/views/profile_screen.dart';
import 'package:belajar_ppkd/home_page.dart';
import 'package:belajar_ppkd/preferences/preference_handler.dart';
import 'package:belajar_ppkd/tugasUI/components/button.dart';
import 'package:belajar_ppkd/tugasUI/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreenApi extends StatefulWidget {
  const RegisterScreenApi({super.key});

  @override
  State<RegisterScreenApi> createState() => _RegisterScreenApiState();
}

class _RegisterScreenApiState extends State<RegisterScreenApi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  bool isLoading = false;
  RegisterUserModel user = RegisterUserModel();
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: nameController,
                          hint: 'Enter your full name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Full name harus diisi";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Column(
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
                    // SizedBox(height: 24),
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
                      text: 'Register',
                      height: 56,
                      width: double.infinity,
                      isLoading: isLoading,
                      click: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final result = await AuthAPI.registerUser(
                              email: emailController.text,
                              name: nameController.text,
                              password: passwordController.text,
                            );
                            setState(() {
                              isLoading = false;
                              user = result;
                              PreferenceHandler.saveToken(user.data!.token!);
                            });
                            context.pushReplacement(ProfileScreenApi());
                          } catch (e) {
                            print(e);
                            Fluttertoast.showToast(msg: e.toString());
                            setState(() {
                              isLoading = false;
                            });
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Register berhasil")),
                          );
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, '/home');
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xff888888)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign In",
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
