import 'package:dartz/dartz.dart';
import 'package:ibrahim_project/core/errors/failuers.dart';
import 'package:ibrahim_project/features/login/data/model/LoginModel.dart';
import 'package:ibrahim_project/features/login/data/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo
{
  @override
  Future<Either<Failure, LoginModel>> postEmailAndPassword() {
    // TODO: implement postEmailAndPassword
    throw UnimplementedError();
  }
}