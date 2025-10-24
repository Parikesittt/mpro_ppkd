import 'package:belajar_ppkd/day_19/database/db_helper.dart';
import 'package:belajar_ppkd/day_19/model/user_model.dart';
import 'package:belajar_ppkd/tugasUI/components/button.dart';
import 'package:belajar_ppkd/tugasUI/components/custom_text_field.dart';
import 'package:belajar_ppkd/tugasUI/components/ext_login_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                        Text('Username'),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: usernameController,
                          hint: 'Enter your username',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "username harus diisi";
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
                      click: () {
                        if (_formKey.currentState!.validate()) {
                          final UserModel data = UserModel(
                            username: usernameController.text,
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            password: passwordController.text,
                          );
                          DBHelper.createUser(data);
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
