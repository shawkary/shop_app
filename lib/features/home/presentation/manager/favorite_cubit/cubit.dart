import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import 'package:ibrahim_project/features/home/presentation/manager/favorite_cubit/states.dart';


class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit(this.homeRepo) : super(InitialFavoriteState());

  static FavoriteCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;

  Future<void> fetchFavoriteData() async {
    emit(LoadingFavoriteState());
    var result = await homeRepo.fetchFavoriteData();

    result.fold((failure) {
      emit(ErrorFavoriteState(failure.errorMessage));
    }, (favoriteModel) {
      emit(SuccessFavoriteState(favoriteModel));
    });
  }
}
