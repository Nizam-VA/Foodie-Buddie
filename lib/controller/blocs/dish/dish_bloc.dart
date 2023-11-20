import 'package:bloc/bloc.dart';
import 'package:foodiebuddie/controller/api_services/dishes/api_calls.dart';
import 'package:foodiebuddie/model/dish.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishBloc() : super(DishInitial()) {
    on<GetDishByCategory>((event, emit) async {
      List<Dish> dishes =
          await DishApiServices().fetchAllDishesByCategory(event.categoryId);
      emit(DishState(isLoading: false, dishes: dishes));
    });
  }
}
