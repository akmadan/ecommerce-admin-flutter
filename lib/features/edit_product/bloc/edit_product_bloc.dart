import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  EditProductBloc() : super(EditProductInitial()) {
    on<EditProductSubmittedEvent>(editProductSubmittedEvent);
  }

  FutureOr<void> editProductSubmittedEvent(
      EditProductSubmittedEvent event, Emitter<EditProductState> emit) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(event.productId)
          .update({
        'name': event.name,
        'description': event.description,
        'status': event.status,
        'price': event.price
      });
      log('Producted Updated');
    } catch (e) {
      log(e.toString());
    }
  }
}
