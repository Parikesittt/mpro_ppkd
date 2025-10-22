import 'package:belajar_ppkd/theme/theme_provider.dart';
import 'package:belajar_ppkd/tugas_10/components/field_pendaftara.dart';
import 'package:belajar_ppkd/tugas_10/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPendaftaranPage extends StatefulWidget {
  const FormPendaftaranPage({super.key});

  @override
  State<FormPendaftaranPage> createState() => _FormPendaftaranPageState();
}

class _FormPendaftaranPageState extends State<FormPendaftaranPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _kotaDomisiliController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Pendaftaran"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toogleTheme();
            },
            icon: Icon(Icons.lightbulb),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
          spacing: 12,
          children: [
            FormFieldPendaftaran(labelText: "Nama Lengkap", controller: _namaController, validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama lengkap tidak boleh kosong';
              }
              return null;
            },),
            FormFieldPendaftaran(labelText: "Email", controller: _emailController, validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Format email tidak valid';
              }
              return null;
            },),
            FormFieldPendaftaran(labelText: "Nomor HP", controller: _nomorHpController),
            FormFieldPendaftaran(labelText: "Kota Domisili", controller: _kotaDomisiliController, validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kota domisili tidak boleh kosong';
              } return null;
            },),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("Pastikan Data Telah Sesuai"),
                      content: Text("Nama: ${_namaController.text} \nEmail: ${_emailController.text} \nNomor HP: ${_nomorHpController.text} \nKota Domisili: ${_kotaDomisiliController.text}"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.of(context).pop();
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return WelcomePage(
                                nama: _namaController.text,
                                domisili: _kotaDomisiliController.text,
                              );
                            },));
                          },
                          child: Text("Proceed"),
                        ),
                      ],
                    );
                  },);
                }
              },
              child: Text("Submit"),
            ),
          ],
        )),
      ),
    );
  }
}

