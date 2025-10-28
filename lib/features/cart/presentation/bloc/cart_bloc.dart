import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_response.dart';
import 'package:shopaz_e_commerce/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shopaz_e_commerce/features/cart/domain/usecases/change_product_quantity_usecase.dart';
import 'package:shopaz_e_commerce/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:shopaz_e_commerce/features/main_layout/favourite/domain/usecases/add_to_favourite_usecase.dart';
import '../../data/models/add_to_cart_response.dart';
import '../../domain/usecases/delete_all_cart_items_usecase.dart';
import '../../domain/usecases/get_cart_items_usecase.dart';

part 'cart_event.dart';

part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  AddToCartUseCase addToCartUseCase;
  GetCartItemsUseCase getCartItemsUseCase;
  ChangeProductQuantityUseCase changeProductQuantityUseCase;
  DeleteCartItemUseCase deleteCartItemUseCase;
  DeleteAllCartItemsUseCase deleteAllCartItemsUseCase;
  AddToFavouriteUseCase addToFavouriteUseCase;
  int numOfCartItems = 0;

  static CartBloc get(context) => BlocProvider.of(context);

  CartBloc(
    this.addToCartUseCase,
    this.getCartItemsUseCase,
    this.changeProductQuantityUseCase,
    this.deleteCartItemUseCase,
    this.deleteAllCartItemsUseCase,
    this.addToFavouriteUseCase,
  ) : super(CartInitial()) {
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
                    addToCartResponse: r,
                  ),
                );
                numOfCartItems = r.numOfCartItems;
              },
            );
          }
        case GetCartItemsEvent():
          {
            emit(
              state.copyWith(getCartItemsRequestState: RequestState.loading),
            );

            var res = await getCartItemsUseCase.call();

            res.fold(
              (l) {
                print("failed at GetCartItemsEvent ${l.toString()}");

                emit(
                  state.copyWith(
                    getCartItemsRequestState: RequestState.error,
                    failure: l,
                  ),
                );
              },
              (r) {
                print("ssssssssssssuccccccccccccccccces");
                emit(
                  state.copyWith(
                    getCartItemsRequestState: RequestState.success,
                    cartResponse: r,
                  ),
                );
                numOfCartItems = r.numOfCartItems ?? 0;
              },
            );
          }

        case ChangeProductQuantityEvent():
          {
            emit(
              state.copyWith(
                changeProductQuantityRequestState: RequestState.loading,
              ),
            );

            var res = await changeProductQuantityUseCase.call(
              event.productId,
              event.request,
            );

            res.fold(
              (l) {
                print("fialed at ChangeProductQuantityEvent ${l.toString()}");

                emit(
                  state.copyWith(
                    changeProductQuantityRequestState: RequestState.error,
                    failure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    changeProductQuantityRequestState: RequestState.success,
                  ),
                );
                add(GetCartItemsEvent());
              },
            );
          }
        case DeleteCartItemEvent():
          {
            emit(
              state.copyWith(
                deleteCartItemRequestState: RequestState.loading,
              ),
            );
            var res = await deleteCartItemUseCase.call(event.productId);
            res.fold(
              (l) {
                print("fialed at ChangeProductQuantityEvent ${l.toString()}");

                emit(
                  state.copyWith(
                    deleteCartItemRequestState: RequestState.error,
                    failure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    deleteCartItemRequestState: RequestState.success,
                    cartResponse: r,
                  ),
                );
                numOfCartItems = r.numOfCartItems ?? 0;
              },
            );
          }
        case DeleteAllCartItemsEvent():
        {
          emit(
            state.copyWith(
              deleteAllCartItemsRequestState: RequestState.loading,
            ),
          );
          var res = await deleteAllCartItemsUseCase.call();
          res.fold(
                (l) {
              print("fialed at DeleteAllCartItemsEvent ${l.toString()}");

              emit(
                state.copyWith(
                  deleteAllCartItemsRequestState: RequestState.error,
                  failure: l,
                ),
              );
            },
                (r) {
              emit(
                state.copyWith(
                  deleteAllCartItemsRequestState: RequestState.success,
              ));
              Future.delayed(const Duration(milliseconds: 200));
              add(GetCartItemsEvent());
            },
          );
        }
      }
    });
  }
}
