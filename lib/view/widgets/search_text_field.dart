import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/restaurant/restaurant_bloc.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.all(12),
      placeholder: text,
      backgroundColor: Colors.green[100],
      prefixIcon: Icon(CupertinoIcons.search, color: Colors.green[700]),
      suffixIcon:
          Icon(CupertinoIcons.xmark_circle_fill, color: Colors.green[700]),
      style: TextStyle(color: Colors.green[700]),
      onChanged: (value) async {
        context.read<RestaurantBloc>().add(SearchRestaurantEvent(query: value));
        // await SellerApiServices().searchSellers(value);
      },
    );
  }
}
