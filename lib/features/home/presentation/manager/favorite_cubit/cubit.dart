import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/dio_helper.dart';
import 'package:ibrahim_project/features/home/presentation/manager/favorite_cubit/states.dart';
import '../../../../../constants.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit(this.dio) : super(InitialFavoriteState());

  static FavoriteCubit get(context) => BlocProvider.of(context);
  final DioHelper dio;

  List favoriteList = [];
  void fetchFavoriteData() async {
    emit(LoadingFavoriteState());
   await dio.getData(
      endPoint: 'favorites',
      token: token,
    ).then((value) {
      for(var item in value['data']['data']){
        favoriteList.add(item);
      }
      emit(SuccessFavoriteState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorFavoriteState());
    });
  }
}
