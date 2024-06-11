import 'package:ibrahim_project/features/home/data/model/HomeModel.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class LoadingHomeState extends HomeStates {}
class SuccessHomeState extends HomeStates {
  final HomeModel homeModel;
  SuccessHomeState(this.homeModel);
}
class ErrorHomeState extends HomeStates {
  final String errMessage;
  ErrorHomeState(this.errMessage);
}