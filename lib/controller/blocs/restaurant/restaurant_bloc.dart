import 'package:bloc/bloc.dart';
import 'package:foodiebuddie/controller/api_services/sellers/api_calls.dart';
import 'package:foodiebuddie/model/seller.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    on<RestaurantEvent>((event, emit) async {
      List<Seller> restaurants = await SellerApiServices().fetchAllSellers();
      emit(RestaurantState(restaurants: restaurants));
    });

    on<SearchRestaurantEvent>((event, emit) async {
      List<Seller> restaurants =
          await SellerApiServices().searchSellers(event.query);
      emit(RestaurantState(restaurants: restaurants));
    });
  }
}
