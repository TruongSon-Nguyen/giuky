// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Lienhe extends StatelessWidget {
  const Lienhe({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.contact_phone,
        size: 96,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
