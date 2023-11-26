part of 'favorites_bloc.dart';

class FavoritesEvent {}

final class AddToFavoritesEvent extends FavoritesEvent {
  final int dishId;
  final BuildContext context;
  AddToFavoritesEvent({required this.dishId, required this.context});
}

final class DeleteFromFavoritesEvent extends FavoritesEvent {
  final int dishId;
  final BuildContext context;

  DeleteFromFavoritesEvent({required this.dishId, required this.context});
}

final class GetAllFavoritesEvent extends FavoritesEvent {}
