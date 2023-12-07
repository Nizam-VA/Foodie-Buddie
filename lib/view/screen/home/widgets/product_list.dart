import 'package:flutter/material.dart';
import 'package:foodiebuddie/utils/constants.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({
    super.key,
    required this.height,
    required this.width,
    required this.count,
    required this.image,
    required this.offerName,
    required this.endDate,
  });

  final String image;
  final double height;
  final double width;
  final int count;
  final String offerName;
  final String endDate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .275,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: count,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
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
                          image: NetworkImage(image), fit: BoxFit.cover)),
                ),
                kHight10,
                Row(
                  children: [
                    // CircleAvatar(
                    //   radius: 18,
                    //   backgroundColor: Colors.white,
                    //   backgroundImage:
                    //       AssetImage(index % 2 == 0 ? logos[0] : logos[1]),
                    // ),
                    kWidth10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(offerName), Text('ends with: $endDate')],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
