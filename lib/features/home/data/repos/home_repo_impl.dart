import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibrahim_project/core/errors/failuers.dart';
import 'package:ibrahim_project/core/utiles/dio_helper.dart';
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

}