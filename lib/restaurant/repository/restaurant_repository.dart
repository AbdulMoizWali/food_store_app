import 'package:food_store/contants/image_contants.dart';
import 'package:food_store/restaurant/model/restaurant.dart';

class RestaurantRepository {
  final List<Restaurant> _restaurants = [
    const Restaurant(
      id: '-',
      name: 'Kinka Izakaya',
      restaurantLogo: ImageContants.restaurantLogo,
      restaurantThumbnail: ImageContants.restaurantThumbnail,
      mainCourse: 'Japanese',
      deliveryFee: 3.99,
      isFeatured: true,
      featuredImage: ImageContants.card,
      foods: [],
    ),
  ];

  Future<List<Restaurant>> getRestaurants() async {
    return _restaurants;
  }

  Future<List<Restaurant>> getFeaturedRestaurant() async {
    return _restaurants.where((restaurant) => restaurant.isFeatured).toList();
  }
}
