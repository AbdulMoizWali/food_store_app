import 'package:equatable/equatable.dart';

class RestaurantFood extends Equatable {
  const RestaurantFood({
    required this.name,
    required this.price,
    required this.description,
    required this.imgUrl,
  });

  final String name;
  final double price;
  final String description;
  final String imgUrl;

  @override
  List<Object?> get props => [name, price, description, imgUrl];
}
