import 'package:bloc/bloc.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_count_response.dart';
import 'package:shopaz_e_commerce/features/cart/domain/entity/cart_entity.dart';
import 'package:shopaz_e_commerce/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:shopaz_e_commerce/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  AddToCartUseCase addToCartUseCase;
  GetCartItemsUseCase getCartItemsUseCase;

  CartBloc(this.addToCartUseCase, this.getCartItemsUseCase)
    : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      switch (event) {
        case AddToCartEvent():
          {
            emit(state.copyWith(addToCartRequestState: RequestState.loading));

            var res = await addToCartUseCase.call(
              AddToCartRequest(productId: event.id),
            );

            res.fold(
              (l) {
                emit(
                  state.copyWith(
                    addToCartRequestState: RequestState.error,
                    failure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    addToCartRequestState: RequestState.success,
                    cartEntity: r,
                  ),
                );
              },
            );
          }
        case GetCartItemsEvent():
          {
            emit(state.copyWith(getCartItemsRequestState: RequestState.loading));

            var res = await getCartItemsUseCase.call();

            res.fold(
              (l) {
                emit(
                  state.copyWith(
                    getCartItemsRequestState: RequestState.error,
                    failure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    getCartItemsRequestState: RequestState.success,
                    cartItemsEntity: r,
                  ),
                );
              },
            );
          }
      }
    });
  }
}
