import 'package:bloc/bloc.dart';
import 'package:foodiebuddie/controller/api_services/categories/api_calls.dart';
import 'package:foodiebuddie/model/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      List<Category> categories =
          await CategoriesApiServices().fetchAllCategories();
      emit(CategoryState(categories: categories, isLoading: false));
    });
  }
}
