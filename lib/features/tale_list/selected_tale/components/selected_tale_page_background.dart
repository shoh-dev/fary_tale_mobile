import 'package:flutter/material.dart';

class SelectedTalePageBackroundComponent extends StatelessWidget {
  const SelectedTalePageBackroundComponent({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
