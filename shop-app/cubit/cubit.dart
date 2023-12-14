import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/shop_app/cubit/states.dart';
import 'package:flutter_project/models/shop_app_model/home_model.dart';
import 'package:flutter_project/modules/News_App/search_screen/search_screen.dart';
import 'package:flutter_project/modules/News_App/settings/news_settings.dart';
import 'package:flutter_project/modules/Shop_App/bottomNav_screens/categories/category_screen.dart';
import 'package:flutter_project/modules/Shop_App/bottomNav_screens/favorities/favorites_screen.dart';
import 'package:flutter_project/modules/Shop_App/bottomNav_screens/products/products_screen.dart';
import 'package:flutter_project/shared/network/end_points.dart';
import 'package:flutter_project/shared/network/local/cache_helper.dart';
import 'package:flutter_project/shared/network/remote/dio_helper.dart';

import '../../../models/shop_app_model/category_model.dart';
import '../../../models/shop_app_model/change_favorite_model.dart';
import '../../../models/shop_app_model/favorite_model.dart';
import '../../../models/shop_app_model/login_model.dart';
import '../../../models/shop_app_model/search_model.dart';
import '../../../modules/Shop_App/bottomNav_screens/settings/settings_screen.dart';
import '../../../shared/components/constants.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    ProductScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  //****************************************************
  HomeModel? homeModel;

  Map<int, bool?> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data?.products?.forEach((element)
      {
        favorites.addAll({
          element.id : element.inFavorites,
        });
      });
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }
//****************************************************
  CategoryModel? categoryModel;
  void getCategoryData() {
    DioHelper.getData(
      url: CATEGORY,
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      emit(ShopSuccessCategoryDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoryDataState());
    });
  }
//****************************************************

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId)
  {
    favorites[productId] = !favorites[productId]!;
    print(favorites[productId]);
    emit(ShopSuccessChangeFavoritesState());
    DioHelper.postData(
        url: FAVORITES,
        token: token,
        data: {
          'product_id' : productId,
        }
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if(!changeFavoritesModel!.status!){
        favorites[productId] = !favorites[productId]!;
      }else{
        getFavoriteData();
      }
      emit(ShopSuccessChangeFavoritesState());
    }).catchError((error){
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesState());
    });
  }

  //**************************************************

  FavoriteModel? favoriteModel;
  void getFavoriteData() {
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      emit(ShopSuccessFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorFavoritesState());
    });
  }

  //**************************************************

  ShopLoginModel? userModel;
  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUserDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  //**************************************************

  void putUpdateData({
    required String name,
    required String email,
    required String phone,
}) {
    emit(ShopLoadingUpdateDataState());
    DioHelper.putData(
      url: UPDATE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUpdateDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateDataState());
    });
  }
}


