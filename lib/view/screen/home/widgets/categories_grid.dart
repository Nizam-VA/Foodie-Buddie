import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiebuddie/controller/blocs/category/category_bloc.dart';

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
        return SizedBox(
          height: height * .35,
          child: Expanded(
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
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
                        index < 6
                            ? state.categories[index].iconUrl != ''
                                ? SvgPicture.network(
                                    state.categories[index].iconUrl,
                                    height: height * .07,
                                  )
                                : Image.asset(
                                    'assets/images/categories/drink.png')
                            : Image.asset('assets/images/categories/drink.png'),
                        const SizedBox(height: 4),
                        index < 6
                            ? state.categories[index].name != ''
                                ? Text(
                                    state.categories[index].name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                : const Text('Category')
                            : const Text('Category')
                      ],
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
