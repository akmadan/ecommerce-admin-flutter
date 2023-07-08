part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}


class AddProductDataEvent extends AddProductEvent {
  final String productName;
  final String description;
  final double price;
  final String status;
  AddProductDataEvent({
    required this.productName,
    required this.description,
    required this.price,
    required this.status,
  });
}
