import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/shop_app_model/login_model.dart';
import 'package:flutter_project/modules/Shop_App/register_screen/register_cubit/states.dart';
import 'package:flutter_project/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_points.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  bool isSecret = true;

  void changeIconPassword()
  {
    isSecret = !isSecret;
    emit(ShopRegisterPasswordSecretState());
  }
//**************************************************************

  ShopLoginModel? registerModel;
  void postRegisterData({
    required userEmail,
    required userPassword,
    required userName,
    required userPhone,
})
  {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          'email' : userEmail,
          'password' : userPassword,
          'name' : userName,
          'phone' : userPhone,
        }
    ).then((value) {
      registerModel = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(registerModel!));
    }).catchError((error){
      emit(ShopRegisterErrorState());
    });
  }
}