import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/api_services/sellers/api_calls.dart';
import 'package:foodiebuddie/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddie/model/category.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/view/screen/category/widgets/dish_container.dart';
import 'package:foodiebuddie/view/screen/dish_details/screen_dish_details.dart';
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
        padding: const EdgeInsets.all(18),
        child: BlocBuilder<DishBloc, DishState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return state.dishes.isEmpty
                ? Center(
                    child: Image.asset(
                      'assets/images/icons/empty.gif',
                      width: width * .5,
                    ),
                  )
                : GridView.builder(
                    itemCount: state.dishes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: width / height / .53),
                    itemBuilder: (context, index) {
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
                        child: DishContainer(
                          width: width,
                          height: height,
                          dish: state.dishes[index],
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
