// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Item {
  final String imgUrl;
  final String name;
  final num persentase;
  final String waktu;

  const Item(
      {required this.imgUrl,
      required this.name,
      required this.persentase,
      required this.waktu});
  static const List<Item> generatedItem = [
    Item(
      imgUrl: 'assets/image/logo_real.png',
      name: 'Nama Votingnya',
      persentase: 25,
      waktu: '13 Hari Lagi',
    ),
    Item(
      imgUrl: 'assets/image/logo_real.png',
      name: 'Nama Votingnya2',
      persentase: 30,
      waktu: '7 Hari Lagi',
    ),
    Item(
      imgUrl: 'assets/image/logo_real.png',
      name: 'Nama Votingnya3',
      persentase: 50,
      waktu: '6 Hari Lagi',
    ),
    Item(
      imgUrl: 'assets/image/logo_real.png',
      name: 'Nama Votingnya4',
      persentase: 100,
      waktu: '1 Hari Lagi',
    )
  ];
}
