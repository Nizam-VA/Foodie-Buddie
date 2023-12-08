import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/restaurant/restaurant_bloc.dart';
import 'package:foodiebuddie/model/offer.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/offer_details/screen_offer_details.dart';
import 'package:intl/intl.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({
    super.key,
    required this.height,
    required this.width,
    required this.offers,
  });

  final double height;
  final double width;
  final List<Offer> offers;
  @override
  Widget build(BuildContext context) {
    context.read<RestaurantBloc>().add(RestaurantEvent());

    return SizedBox(
      height: height * .275,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: offers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ScreenOfferDetails(
                    sellerId: offers[index].sellerId,
                    catId: offers[index].categoryId,
                    offer: offers[index].offerTitle,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12, top: 8),
              width: width - (width * .4),
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
                            image: NetworkImage(offers[index].image),
                            fit: BoxFit.cover)),
                  ),
                  kHight10,
                  Row(
                    children: [
                      kWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offers[index].offerTitle,
                            style: boldBlack,
                          ),
                          Text(
                            offers[index].sellerId.toString(),
                            style: semiBoldGrey,
                          ),
                          Row(
                            children: [
                              const Text('ends with: '),
                              Text(
                                DateFormat.yMMMMd('en_US').format(
                                    DateTime.parse(offers[index].endDate)),
                                style: semiBoldGreen,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 23,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Text(
                              '${offers[index].offerPercentage.toString()}%'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
