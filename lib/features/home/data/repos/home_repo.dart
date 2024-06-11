import 'package:ibrahim_project/features/home/data/model/HomeModel.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failuers.dart';

abstract class HomeRepo
{
  Future<Either<Failure, HomeModel>> fetchHomeData();
}