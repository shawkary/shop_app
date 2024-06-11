import 'package:dartz/dartz.dart';
import 'package:ibrahim_project/core/errors/failuers.dart';
import 'package:ibrahim_project/features/home/data/model/HomeModel.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo
{
  @override
  Future<Either<Failure, HomeModel>> fetchHomeData() {
    // TODO: implement fetchHomeData
    throw UnimplementedError();
  }

}