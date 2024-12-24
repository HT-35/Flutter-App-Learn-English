import 'package:english_ap/widgets/appbar_app.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBart(
        title: 'Favorites',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
