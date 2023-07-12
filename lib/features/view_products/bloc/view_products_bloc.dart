import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_products_event.dart';
part 'view_products_state.dart';

class ViewProductsBloc extends Bloc<ViewProductsEvent, ViewProductsState> {
  ViewProductsBloc() : super(ViewProductsInitial()) {
    on<ViewProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
