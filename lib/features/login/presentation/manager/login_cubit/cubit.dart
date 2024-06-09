import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/login/presentation/manager/login_cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(InitialLoginState());


}