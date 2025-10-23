import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/domain/entity/cart_entity.dart';
import 'package:shopaz_e_commerce/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';
import 'package:shopaz_e_commerce/features/products_screen/domain/usecases/get_products.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../cart/data/models/add_to_cart_response.dart';

part 'products_event.dart';

part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  GetProductsUseCase productsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductsBloc(this.productsUseCase,this.addToCartUseCase) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      switch (event) {
        case GetProductsEvent():
          {
            emit(state.copyWith(productsRequestState: RequestState.loading));
            var result = await productsUseCase.call(event.id);

            result.fold(
              (l) {
                print("errrrrrrrrrrrrrrrorGetProductsEvent =- ${l.message}");
                emit(
                  state.copyWith(
                    productsRequestState: RequestState.error,
                    failure: l,
                  ),
                );
              },
              (r) {

                print("TEST =- ${r.data?.length}");
                emit(
                  state.copyWith(
                    productsRequestState: RequestState.success,
                    model: r,
                  ),
                );
              },
            );
          }
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
              },
            );
          }
      }
    });
  }
}
