import 'package:ibrahim_project/features/home/data/model/category_model/CategoryModel.dart';


abstract class CategoryStates {}

class InitialCategoryState extends CategoryStates {}

class LoadingCategoryState extends CategoryStates {}
class SuccessCategoryState extends CategoryStates {
  final CategoryModel categoryModel;
  SuccessCategoryState(this.categoryModel);
}
class ErrorCategoryState extends CategoryStates {
  final String errMessage;
  ErrorCategoryState(this.errMessage);
}