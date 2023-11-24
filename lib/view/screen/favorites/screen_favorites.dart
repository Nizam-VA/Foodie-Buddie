import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenFavorites extends StatelessWidget {
  const ScreenFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Text('data');
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
