import 'package:flutter/material.dart';
import 'package:food_store/restaurant/model/restaurant.dart';
import 'package:food_store/routes/route_transition.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final Restaurant restaurant;

  static Route<dynamic> route(Restaurant restaurant) {
    return RouteTransition.pageRouteBuilder(
      RestaurantPage(
        restaurant: restaurant,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
