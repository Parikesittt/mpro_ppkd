import 'package:belajar_ppkd/constant/app_image.dart';
import 'package:belajar_ppkd/model/sport_model.dart';
import 'package:flutter/material.dart';

class CategoryListWithModel extends StatefulWidget {
  const CategoryListWithModel({super.key});

  @override
  State<CategoryListWithModel> createState() => _CategoryListWithModelState();
}

class _CategoryListWithModelState extends State<CategoryListWithModel> {
  final List<SportModel> sportEquipment = [
    SportModel(
      name: 'Bola Basket',
      price: 100000,
      image: AppImage.basketball,
      description:
          'Bola standar untuk olahraga basket, berbahan karet atau kulit sintetis.',
    ),
    SportModel(
      name: 'Sarung Tinju',
      price: 150000,
      image: AppImage.glove,
      description: 'Pelindung tangan saat latihan tinju.',
    ),
    SportModel(
      name: 'Bola Sepak',
      price: 250000,
      image: AppImage.football,
      description: 'Bola untuk permainan sepak bola.',
    ),
    SportModel(
      name: 'Raket Badminton',
      price: 80000,
      image: AppImage.badminton,
      description: 'Digunakan untuk bulu tangkis.',
    ),
    SportModel(
      name: 'Raket Tenis',
      price: 1000000,
      image: AppImage.tennis,
      description: 'Raket untuk olahraga tenis lapangan.',
    ),
    SportModel(
      name: 'Dumbbell Set',
      price: 10000000,
      image: AppImage.dumbbell,
      description: 'Alat beban tangan untuk latihan kekuatan.',
    ),
    SportModel(
      name: 'Matras Yoga',
      price: 120000,
      image: AppImage.mat,
      description: 'Alas untuk yoga, pilates, atau peregangan.',
    ),
    SportModel(
      name: 'Skipping Rope',
      price: 70000,
      image: AppImage.skipping,
      description: 'Untuk latihan kardio dan kelincahan.',
    ),
    SportModel(
      name: 'Skateboard',
      price: 170000,
      image: AppImage.skateboard,
      description: 'Papan seluncur untuk olahraga ekstrem atau rekreasi.',
    ),
    SportModel(
      name: 'Sepatu Lari',
      price: 1700000,
      image: AppImage.running,
      description: 'Alas kaki khusus olahraga lari.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sportEquipment.length,
      itemBuilder: (context, index) {
        final item = sportEquipment[index];
        return ListTile(
          leading: Image.asset(item.image, width: 40),
          title: Text(item.name),
          subtitle: Text(item.description),
        );
      },
    );
  }
}
