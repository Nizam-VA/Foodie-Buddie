import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/favorites/favorites_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenFavorites extends StatelessWidget {
  const ScreenFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<FavoritesBloc>().add(GetAllFavoritesEvent());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 12, top: 8),
                  width: width - (width * .5),
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
                                image: AssetImage(state.dishes[index].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      kHight10,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(''),
                          ),
                          kWidth10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.dishes[index].name),
                              Text(state.dishes[index].description)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: state.dishes.length,
            );
          },
        ),
      ),
    );
  }
}
