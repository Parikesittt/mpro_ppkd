import 'package:belajar_ppkd/day_19/database/db_helper.dart';
import 'package:belajar_ppkd/day_19/model/user_model.dart';
import 'package:flutter/material.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  getData() {
    DBHelper.getAllUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("List User")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("List data user:"),
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
