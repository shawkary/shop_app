import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibrahim_project/core/errors/failures.dart';
import 'package:ibrahim_project/core/utiles/dio_helper.dart';
import 'package:ibrahim_project/features/home/data/model/category_model/CategoryModel.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import '../../../../constants.dart';
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
  Future<Either<Failure, List<dynamic>>> fetchFavoriteData()async {
    try {
      var data = await dio.getData(
          endPoint: 'favorites',
          token: token,
      );
      List favoriteList = [];
      for(var item in data['data']['data']){
        favoriteList.add(item);
      }
      return right(favoriteList);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
}