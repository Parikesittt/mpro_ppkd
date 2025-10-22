import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(child: Icon(Icons.person)),
            SizedBox(height: 12),
            Text(
              "EINVENT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 12),
            Text(
              "EINVENT adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pelaku UMKM (Usaha Mikro, Kecil, dan Menengah) dalam mengelola inventaris barang secara digital dan efisien. Aplikasi ini memudahkan pengguna dalam mencatat barang masuk dan keluar, memantau stok secara real-time, serta menampilkan ringkasan keuangan seperti pendapatan (income) dan pengeluaran (expense) dalam bentuk grafik dan laporan periodik.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              "Parikesit",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text("Alpha 0.0.1", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
