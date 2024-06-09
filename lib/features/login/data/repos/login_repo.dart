import 'package:dartz/dartz.dart';
import 'package:ibrahim_project/features/login/data/model/LoginModel.dart';

import '../../../../core/errors/failuers.dart';

abstract class LoginRepo
{
  Future<Either<Failure, LoginModel>> postEmailAndPassword();
}