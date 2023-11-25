import 'package:bloc/bloc.dart';
import 'package:foodiebuddie/controller/api_services/favorites/api_calls.dart';
import 'package:foodiebuddie/model/dish.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<GetAllFavoritesEvent>((event, emit) async {
      List<Dish> dishes = await FavoriteApiServices().getAllFavorites();
      emit(FavoritesState(dishes: dishes));
    });
  }
}
