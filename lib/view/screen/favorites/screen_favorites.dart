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
        padding: const EdgeInsets.all(18),
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final dishIds =
                    state.dishes.map((dish) => dish.dishId).toList();
                return Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(right: 12, top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: .5, color: Colors.green),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: height * .175,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: .5, color: Colors.green),
                            image: DecorationImage(
                                image:
                                    NetworkImage(state.dishes[index].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      kHight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // CircleAvatar(
                          //   radius: 18,
                          //   backgroundColor: Colors.white,
                          //   backgroundImage: AssetImage(''),
                          // ),
                          // kWidth10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.dishes[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('₹ ${state.dishes[index].price}')
                            ],
                          ),
                          BlocBuilder<FavoritesBloc, FavoritesState>(
                            builder: (context, state) {
                              return CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    dishIds.contains(state.dishes[index].dishId)
                                        ? Colors.red
                                        : Colors.white,
                                child: IconButton(
                                  onPressed: () async {
                                    context.read<FavoritesBloc>().add(
                                        DeleteFromFavoritesEvent(
                                            dishId: state.dishes[index].dishId,
                                            context: context));
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 22,
                                    color: dishIds.contains(
                                            state.dishes[index].dishId)
                                        ? Colors.white
                                        : Colors.red,
                                  ),
                                ),
                              );
                            },
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
