import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/offer/offer_bloc.dart';
import 'package:foodiebuddie/controller/blocs/profile/profile_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/all_categories/screen_all_categories.dart';
import 'package:foodiebuddie/view/screen/home/widgets/categories_grid.dart';
import 'package:foodiebuddie/view/screen/home/widgets/header.dart';
import 'package:foodiebuddie/view/screen/home/widgets/product_list.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/search_text_field.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<OfferBloc>().add(GetAllOfferEvent());
    context.read<ProfileBloc>().add(GetProfileEvent());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHight20,
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return HeaderSection(
                        name: state.profile?.firstName ?? 'Name',
                        width: width,
                        height: height);
                  },
                ),
                kHight20,
                SearchTextField(text: 'Search restaurants...'),
                kHight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHead(heading: 'Categories'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScreenAllCategories(),
                            ),
                          );
                        },
                        child: const Text('View all'))
                  ],
                ),
                CategoriesGridview(height: height, width: width),
                kHight10,
                const Divider(thickness: 2),
                kHight10,
                const SectionHead(heading: 'Best offers'),
                BlocBuilder<OfferBloc, OfferState>(
                  builder: (context, state) {
                    return state.offers.isEmpty
                        ? const Center(
                            child: Text('No offers available'),
                          )
                        : ProductListWidget(
                            height: height,
                            width: width,
                            offers: state.offers,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
