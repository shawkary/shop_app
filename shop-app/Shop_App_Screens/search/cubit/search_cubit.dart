import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/modules/Shop_App/search/cubit/search_states.dart';

import '../../../../models/shop_app_model/search_model.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(InitialSearchDataState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;
  void postSearchData(String text) {
    emit(ShopLoadingSearchDataState());
    DioHelper.postData(
        url: SEARCH,
        token: token,
        data: {
          'text': text,
        }
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(ShopSuccessSearchDataState(searchModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorSearchDataState());
    });
  }

}