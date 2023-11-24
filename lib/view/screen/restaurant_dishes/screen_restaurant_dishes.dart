import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenRestaurantDishes extends StatelessWidget {
  const ScreenRestaurantDishes({super.key, required this.seller});
  final Seller seller;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<DishBloc>().add(GetDishBySeller(sellerId: seller.id));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: seller.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<DishBloc, DishState>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                return Container(
                  width: width * .8,
                  height: height * .2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {},
                        child: Container(
                          width: width * .4,
                          height: height * .2,
                        ),
                      ),
                      Container(
                        width: width * .35,
                        height: height * .2,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                state.dishes[index].imageUrl,
                              ),
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                );
              }),
              itemCount: state.dishes.length,
            );
          },
        ),
      ),
    );
  }
}
