import 'package:belajar_ppkd/components/custom_input_form.dart';
import 'package:belajar_ppkd/day_19/database/db_helper.dart';
import 'package:belajar_ppkd/day_19/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneNumC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  getData() {
    DBHelper.getAllUser();
    setState(() {});
  }

  Future<void> _onEdit(UserModel user) async {
    final editNameC = TextEditingController(text: user.name);
    final editUsernameC = TextEditingController(text: user.username);
    final editEmailC = TextEditingController(text: user.email);
    final editPhoneNumC = TextEditingController(text: user.phoneNumber);
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              InputForm(hint: "Name", controller: editNameC),
              InputForm(hint: "Username", controller: editUsernameC),
              InputForm(hint: "Email", controller: editEmailC),
              InputForm(hint: "Phone Number", controller: editPhoneNumC),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      final updatedData = UserModel(
        id: user.id,
        username: editNameC.text,
        name: editNameC.text,
        email: editEmailC.text,
        phoneNumber: editPhoneNumC.text,
        password: user.password,
      );
      DBHelper.updateUser(updatedData);
      getData();
    }
  }

  Future<void> _onDelete(UserModel user) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit data"),
          content: Text("Yakin ingin menghapus user dengan nama ${user.name}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tidak"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Ya"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      DBHelper.deleteUser(user.id!);
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("List User")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("List data user:"),
              ),
              IconButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Tambah User"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 12,
                          children: [
                            InputForm(hint: "Name", controller: nameC),
                            InputForm(hint: "Username", controller: usernameC),
                            InputForm(
                              hint: "Phone Number",
                              controller: phoneNumC,
                            ),
                            InputForm(hint: "Email", controller: emailC),
                            InputForm(hint: "Password", controller: passwordC),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Batal"),
                          ),
                          TextButton(
                            onPressed: () {
                              final UserModel data = UserModel(
                                username: usernameC.text,
                                name: nameC.text,
                                email: emailC.text,
                                phoneNumber: phoneNumC.text,
                                password: passwordC.text,
                              );
                              DBHelper.createUser(data);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Register berhasil"),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Text("Buat"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(FontAwesomeIcons.plus),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: DBHelper.getAllUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData ||
                    (snapshot.data as List).isEmpty) {
                  return const Center(child: Text("Tidak ada data"));
                } else {
                  final data = snapshot.data as List<UserModel>;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final items = data[index];
                      return ListTile(
                        title: Text(items.name),
                        subtitle: Text(items.username),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _onEdit(items);
                              },
                              icon: Icon(FontAwesomeIcons.penToSquare),
                            ),
                            IconButton(
                              onPressed: () {
                                _onDelete(items);
                              },
                              icon: Icon(FontAwesomeIcons.trashCan),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
