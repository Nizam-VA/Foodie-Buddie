import 'package:bloc/bloc.dart';
import 'package:foodiebuddie/controller/api_services/dishes/api_calls.dart';
import 'package:foodiebuddie/model/dish.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishBloc() : super(DishInitial()) {
    on<GetDishByCategory>((event, emit) async {
      emit(DishState(isLoading: true, dishes: []));
      List<Dish> dishes =
          await DishApiServices().fetchAllDishesByCategory(event.categoryId);
      emit(DishState(isLoading: false, dishes: dishes));
    });
    on<GetDishBySeller>((event, emit) async {
      emit(DishState(isLoading: true, dishes: []));
      List<Dish> dishes =
          await DishApiServices().fetchAllDishesBySellerId(event.sellerId);
      emit(DishState(isLoading: false, dishes: dishes));
    });
    on<GetDishBySellerAndCategory>((event, emit) async {
      emit(DishState(isLoading: true, dishes: []));
      List<Dish> dishes = await DishApiServices()
          .fetchAllDishesByCatAndSeller(event.sellerId, event.categoryId);
      emit(DishState(isLoading: false, dishes: dishes));
    });

    on<SearchDishEvent>((event, emit) async {
      List<Dish> dishes =
          await DishApiServices().searchDishes(event.query, event.sellerId);
      emit(DishState(isLoading: false, dishes: dishes));
    });
  }
}
