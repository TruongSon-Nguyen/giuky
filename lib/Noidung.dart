// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Noidung extends StatelessWidget {
  const Noidung({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Nội dung bài thi giữa kỳ gồm 03 câu',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
