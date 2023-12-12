import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/api_services/sellers/api_calls.dart';
import 'package:foodiebuddie/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/dish_details/screen_dish_details.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/screen/restaurant_dishes/widgets/search-food.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenRestaurantDishes extends StatelessWidget {
  const ScreenRestaurantDishes({super.key, required this.seller});
  final Seller seller;
  @override
  Widget build(BuildContext context) {
    context.read<DishBloc>().add(GetDishBySeller(sellerId: seller.id));
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: seller.name),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(text: 'Search foods...', sellerId: seller.id),
            kHight20,
            const SectionHead(heading: 'All Dishes'),
            BlocBuilder<DishBloc, DishState>(
              builder: (context, state) {
                return state.dishes.isEmpty
                    ? Center(
                        child: Image.asset('assets/images/icons/empty.gif'))
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () async {
                                Seller? seller = await SellerApiServices()
                                    .getSellerById(
                                        state.dishes[index].sellerId);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenDishDetails(
                                      dish: state.dishes[index],
                                      seller: seller!,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width * .8,
                                height: height * .2,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * .5,
                                      height: height * .2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(state.dishes[index].name,
                                              style: boldBlack),
                                          Text(
                                            '₹ ${state.dishes[index].price}',
                                            style: boldGreen,
                                          ),
                                          Text(
                                            'Only ${state.dishes[index].quantity}s left',
                                            style: semiBoldBlack,
                                          ),
                                          Text(
                                            state.dishes[index].isVeg
                                                ? 'Vegetarian'
                                                : 'Non-Veg',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * .35,
                                      height: height * .2,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: .1),
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
                              ),
                            );
                          }),
                          itemCount: state.dishes.length,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
