import 'package:ibrahim_project/features/home/data/model/favorite_model/FavoriteModel.dart';

abstract class FavoriteStates {}

class InitialFavoriteState extends FavoriteStates {}

class LoadingFavoriteState extends FavoriteStates {}
class SuccessFavoriteState extends FavoriteStates {
  final FavoriteModel favoriteModel;
  SuccessFavoriteState(this.favoriteModel);
}
class ErrorFavoriteState extends FavoriteStates {
  final String errMessage;
  ErrorFavoriteState(this.errMessage);
}