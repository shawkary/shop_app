import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/data/model/category_model/CategoryModel.dart';
import 'package:ibrahim_project/features/home/data/model/product_model/HomeModel.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import 'package:ibrahim_project/features/home/presentation/manager/shop_cubit/states.dart';
import '../../../data/model/favorite_model/FavoriteList.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit(this.homeRepo) : super(InitialHomeState());
  final HomeRepo homeRepo;
  static ShopCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  Future<void> fetchProductData() async {
    emit(LoadingProductState());
    var result = await homeRepo.fetchProductData();

    result.fold((failure) {
      emit(ErrorProductState(failure.errorMessage));
    }, (homeModel) {
      this.homeModel = homeModel;
      emit(SuccessProductState());
    });
  }

  //////////////////////////////////////////////////////////////

  CategoryModel? categoryModel;
  Future<void> fetchCategoryData() async {
    emit(LoadingCategoryState());
    var result = await homeRepo.fetchCategoryData();

    result.fold((failure) {
      emit(ErrorCategoryState(failure.errorMessage));
    }, (categoryModel) {
      this.categoryModel = categoryModel;
      emit(SuccessCategoryState());
    });
  }

  ///////////////////////////////////////////////////////////////

  List<FavoriteList>? favorite;
  Future<void> fetchFavoritesData() async {
    emit(LoadingFavoriteState());
    var result = await homeRepo.fetchFavoriteData();

    result.fold((failure) {
      emit(ErrorFavoriteState(failure.errorMessage));
    }, (favorite) {
      this.favorite = favorite;
      emit(SuccessFavoriteState());
    });
  }

  //////////////////////////////////////////////////////////////


  void addFavorite({
    required num productId,
  }){
    emit(LoadingAddFavoriteState());
    homeRepo.addOrRemoveFavorites(productId: productId).then((value){
      emit(SuccessAddFavoriteState());
    }).catchError((error){
      emit(ErrorAddFavoriteState());
    });
  }
}
