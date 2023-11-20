import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddie/model/category.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenCategory extends StatelessWidget {
  ScreenCategory({super.key, required this.category});
  Category category;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<DishBloc>().add(GetDishByCategory(categoryId: category.id));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: category.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<DishBloc, DishState>(
          builder: (context, state) {
            print(state.dishes.length);
            return ListView.separated(
                itemCount: state.dishes.length,
                separatorBuilder: (context, index) {
                  return divider2;
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    width: width - (width * .8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: .5),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: height * .175,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: .5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      state.dishes[index].imageUrl),
                                  fit: BoxFit.cover)),
                        ),
                        kHight10,
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(''),
                            ),
                            kWidth10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.dishes[index].name),
                                Text('Place of hotel')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
