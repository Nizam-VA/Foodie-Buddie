import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiebuddie/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddie/view/screen/category/screen_category.dart';

class CategoriesGridview extends StatelessWidget {
  CategoriesGridview({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(CategoryEvent());
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state.categories.isEmpty) {
          return const CircularProgressIndicator();
        }
        return GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ScreenCategory(category: state.categories[index]),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        state.categories[index].iconUrl,
                        height: height * .07,
                        placeholderBuilder: (context) {
                          return Image.asset(
                            'assets/images/categories/drink.png',
                            height: height * .07,
                          );
                        },
                        semanticsLabel: 'Category logo',
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.categories[index].name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
