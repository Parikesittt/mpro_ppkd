import 'package:belajar_ppkd/components/custom_button.dart';
import 'package:belajar_ppkd/components/spacing_helper.dart';
import 'package:belajar_ppkd/day_33/models/profile_model.dart';
import 'package:belajar_ppkd/day_33/services/api.dart';
import 'package:belajar_ppkd/day_33/views/login_screen.dart';
import 'package:belajar_ppkd/preferences/preference_handler.dart';
import 'package:flutter/material.dart';

class ProfileScreenApi extends StatefulWidget {
  const ProfileScreenApi({super.key});

  @override
  State<ProfileScreenApi> createState() => _ProfileScreenApiState();
}

class _ProfileScreenApiState extends State<ProfileScreenApi> {
  ProfileModel profile = ProfileModel();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final token = await PreferenceHandler.getToken();
    final data = await AuthAPI.getUserProfile(token: token ?? '');
    setState(() {
      profile = data;
    });
  }

  void showEditDialog() async {
    TextEditingController nameC = TextEditingController(
      text: profile.data?.name ?? "",
    );

    showDialog(
      context: context,
      builder: (context) {
        bool loading = false;

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Edit Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    h(20),
                    TextField(
                      controller: nameC,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    h(24),
                    loading
                        ? const CircularProgressIndicator()
                        : Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text("Cancel"),
                                ),
                              ),
                              w(12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (nameC.text.isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text("Name cannot be empty"),
                                        ),
                                      );
                                      return;
                                    }

                                    setStateDialog(() => loading = true);

                                    final token =
                                        await PreferenceHandler.getToken();

                                    await AuthAPI.updateUserProfile(
                                      token: token ?? "",
                                      name: nameC.text.trim(),
                                    );

                                    await fetchData();

                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text("Save"),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (profile.data == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      appBar: AppBar(title: Text('Profile Screen'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                spacing: 12,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  Text(
                    profile.data!.name ?? 'John Doe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff222222),
                    ),
                  ),
                  Text(
                    profile.data!.email ?? '',
                    style: TextStyle(color: Color(0xff1F2937)),
                  ),
                  Button(
                    buttonText: "Edit Profile",
                    height: 48,
                    width: double.infinity,
                    click: () {
                      showEditDialog();
                    },
                  ),
                ],
              ),
            ),
            h(16),
            InkWell(
              onTap: () {
                PreferenceHandler.clearToken();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreenApi(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Logout"),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
