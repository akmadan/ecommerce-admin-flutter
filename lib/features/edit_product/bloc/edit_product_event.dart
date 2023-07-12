part of 'edit_product_bloc.dart';

@immutable
abstract class EditProductEvent {}

class EditProductSubmittedEvent extends EditProductEvent {
  final String name;
  final String description;
  final double price;
  final String status;
  final String productId;
  EditProductSubmittedEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    required this.productId
  });
}
