import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failures.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../domain/usecases/add_to_favourite_usecase.dart';
import '../../domain/usecases/remove_from_favourite_usecase.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

@injectable
class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final AddToFavouriteUseCase addToFavouriteUseCase;
  final RemoveFromFavouriteUseCase removeFromFavouriteUseCase;
  FavouriteBloc(this.addToFavouriteUseCase,this.removeFromFavouriteUseCase) : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) async {
      switch (event) {
        case AddToFavouriteEvent():
          {
            emit(
              state.copyWith(addToFavouriteRequestState: RequestState.loading),
            );
            var res = await addToFavouriteUseCase.call({
              'productId': event.productId,
            });
            res.fold(
              (l) {
                print(" failed at AddToFavouriteEvent ${l.toString()}");
                emit(
                  state.copyWith(
                    addToFavouriteRequestState: RequestState.error,
                    failure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    addToFavouriteRequestState: RequestState.success,
                  ),
                );
                Future.delayed(const Duration(milliseconds: 200));
              },
            );
          }
        case RemoveFromFavouriteEvent():
          {
            emit(
              state.copyWith(removeFromFavouriteRequestState: RequestState.loading),
            );
            var res = await removeFromFavouriteUseCase.call(event.productId);
            res.fold(
                  (l) {
                print(" failed removeFromFavouriteUseCase ${l.toString()}");
                emit(
                  state.copyWith(
                    removeFromFavouriteRequestState: RequestState.error,
                    failure: l,
                  ),
                );
              },
                  (r) {
                emit(
                  state.copyWith(
                    removeFromFavouriteRequestState: RequestState.success,
                  ),
                );
                Future.delayed(const Duration(milliseconds: 200));
              },
            );
          }
      }
    });
  }
}

// {
// emit(state.copyWith(addToFavouriteRequestState: RequestState.loading));
// var res = await addToFavouriteUseCase.call({
// 'productId': event.productId,
// });
// res.fold(
// (l) {
// print(" failed at AddToFavouriteEvent ${l.toString()}");
// emit(
// state.copyWith(
// addToWishListRequestState: RequestState.error,
// failure: l,
// ),
// );
// },
// (r) {
// emit(state.copyWith(addToWishListRequestState: RequestState.success));
// Future.delayed(const Duration(milliseconds: 200));
// },
// );
// }
