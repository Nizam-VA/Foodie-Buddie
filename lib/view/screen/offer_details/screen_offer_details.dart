import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/api_services/sellers/api_calls.dart';
import 'package:foodiebuddie/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/dish_details/screen_dish_details.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenOfferDetails extends StatelessWidget {
  const ScreenOfferDetails(
      {super.key,
      required this.sellerId,
      required this.catId,
      required this.offer});
  final int sellerId;
  final int catId;
  final String offer;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context
        .read<DishBloc>()
        .add(GetDishBySellerAndCategory(sellerId: sellerId, categoryId: catId));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: offer),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<DishBloc, DishState>(
          builder: (context, state) {
            return state.dishes.isEmpty
                ? Center(child: Image.asset('assets/images/icons/empty.gif'))
                : ListView.builder(
                    // shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () async {
                          Seller? seller = await SellerApiServices()
                              .getSellerById(state.dishes[index].sellerId);
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * .5,
                                height: height * .2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
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
