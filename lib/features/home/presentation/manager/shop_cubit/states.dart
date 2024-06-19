abstract class ShopStates {}

class InitialHomeState extends ShopStates {}

class LoadingProductState extends ShopStates {}
class SuccessProductState extends ShopStates {}
class ErrorProductState extends ShopStates {
  final String errMessage;
  ErrorProductState(this.errMessage);
}

////////////////////////////////////////////////////////

class LoadingCategoryState extends ShopStates {}
class SuccessCategoryState extends ShopStates {}
class ErrorCategoryState extends ShopStates {
  final String errMessage;
  ErrorCategoryState(this.errMessage);
}

/////////////////////////////////////////////////////////

class LoadingFavoriteState extends ShopStates {}
class SuccessFavoriteState extends ShopStates {}
class ErrorFavoriteState extends ShopStates {
  final String errMessage;
  ErrorFavoriteState(this.errMessage);
}

//////////////////////////////////////////////////////////


class LoadingAddFavoriteState extends ShopStates {}
class SuccessAddFavoriteState extends ShopStates {}
class ErrorAddFavoriteState extends ShopStates {}