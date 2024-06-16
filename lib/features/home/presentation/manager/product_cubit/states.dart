import 'package:ibrahim_project/features/home/data/model/product_model/HomeModel.dart';
import '../../../data/model/category_model/CategoryModel.dart';


abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class LoadingProductState extends HomeStates {}
class SuccessProductState extends HomeStates {
  final HomeModel homeModel;
  SuccessProductState(this.homeModel);
}
class ErrorProductState extends HomeStates {
  final String errMessage;
  ErrorProductState(this.errMessage);
}