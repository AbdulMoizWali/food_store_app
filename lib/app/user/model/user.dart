import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.username,
  });

  final String id;
  final String username;

  static const empty = User(
    id: '-',
    username: '',
  );

  @override
  List<Object?> get props => [];
}
