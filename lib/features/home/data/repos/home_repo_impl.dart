import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibrahim_project/core/errors/failuers.dart';
import 'package:ibrahim_project/core/utiles/dio_helper.dart';
import 'package:ibrahim_project/features/home/data/model/category_model/CategoryModel.dart';
import 'package:ibrahim_project/features/home/data/model/favorite_model/FavoriteModel.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import '../model/product_model/HomeModel.dart';


class HomeRepoImpl implements HomeRepo
{
  HomeRepoImpl(this.dio);
  DioHelper dio;


  @override
  Future<Either<Failure, HomeModel>> fetchProductData()async {
    try {
      var data = await dio.getData(endPoint: 'home');
      HomeModel homeModel;
      homeModel = HomeModel.fromJson(data);
      return right(homeModel);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> fetchCategoryData()async {
    try {
      var data = await dio.getData(endPoint: 'categories');
      CategoryModel categoryModel;
      categoryModel = CategoryModel.fromJson(data);
      return right(categoryModel);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> fetchFavoriteData()async {
    try {
      var data = await dio.getData(endPoint: 'favorites');
      FavoriteModel favoriteModel;
      favoriteModel = FavoriteModel.fromJson(data);
      return right(favoriteModel);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }

}