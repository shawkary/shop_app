import 'package:dartz/dartz.dart';
import 'package:ibrahim_project/features/home/data/model/product_model/HomeModel.dart';
import '../../../../core/errors/failuers.dart';


abstract class HomeRepo
{
  Future<Either<Failure, HomeModel>> fetchProductData();
}