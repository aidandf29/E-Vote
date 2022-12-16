// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Item {
  final String imgUrl;
  final String nomorUrutan;
  final String name;

  const Item(
      {required this.imgUrl, required this.name, required this.nomorUrutan});
  static const List<Item> generatedItem = [
    Item(
      imgUrl: 'assets/image/logo_real.png',
      nomorUrutan: 'Nomor Urut 1',
      name: 'Prabowo Subianto',
    ),
    Item(
      imgUrl: 'assets/image/logo_real.png',
      nomorUrutan: 'Nomor Urut 2',
      name: 'Joko Widodo',
    ),
  ];
}
