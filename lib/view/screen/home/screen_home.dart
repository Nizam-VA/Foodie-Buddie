import 'package:flutter/material.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/home/widgets/categories_grid.dart';
import 'package:foodiebuddie/view/screen/home/widgets/header.dart';
import 'package:foodiebuddie/view/screen/home/widgets/product_list.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/search_text_field.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  String name = 'Nizam';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHight20,
                HeaderSection(name: name, width: width, height: height),
                kHight20,
                SearchTextField(text: 'Search restaurants...'),
                kHight20,
                const SectionHead(heading: 'Categories'),
                kHight10,
                CategoriesGridview(height: height, width: width),
                kHight10,
                const Divider(thickness: 2),
                kHight10,
                const SectionHead(heading: 'New & Trending'),
                ProductListWidget(height: height, width: width, count: 5),
                kHight10,
                const Divider(thickness: 2),
                kHight10,
                const SectionHead(heading: 'Best offers'),
                ProductListWidget(height: height, width: width, count: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
