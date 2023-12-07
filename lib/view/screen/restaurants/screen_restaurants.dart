import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/restaurant/restaurant_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/screen/profile/widgets/sub_text.dart';
import 'package:foodiebuddie/view/screen/restaurant_dishes/screen_restaurant_dishes.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:foodiebuddie/view/widgets/search_text_field.dart';

class ScreenRestaurants extends StatelessWidget {
  ScreenRestaurants({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<RestaurantBloc>().add(RestaurantEvent());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: AppBarWidget(title: 'Restaurants')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(text: 'Search restaurants...'),
              kHight20,
              const SectionHead(heading: 'All Restaurants'),
              kHight10,
              BlocBuilder<RestaurantBloc, RestaurantState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.restaurants.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () async {
                            // await DishApiServices().fetchAllDishesBySellerId(
                            //     state.restaurants[index].id);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ScreenRestaurantDishes(
                                  seller: state.restaurants[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            height: height * .2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  height: height * .15,
                                  width: width * .225,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SectionHead(
                                        heading: state.restaurants[index].name),
                                    SubText(
                                        text: state
                                            .restaurants[index].description)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
