import '../../../../models/shop_app_model/search_model.dart';

abstract class SearchStates {}

class InitialSearchDataState extends SearchStates {}

class ShopLoadingSearchDataState extends SearchStates {}

class ShopSuccessSearchDataState extends SearchStates
{
  final SearchModel searchModel;
  ShopSuccessSearchDataState(this.searchModel);
}

class ShopErrorSearchDataState extends SearchStates {}