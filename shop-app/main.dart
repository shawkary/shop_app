import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_project/layout/shop_app/shop_layout.dart';
import 'package:flutter_project/modules/Shop_App/on_boarding/on_boarding.dart';
import 'package:flutter_project/shared/components/constants.dart';
import 'package:flutter_project/shared/cubit/cubit.dart';
import 'package:flutter_project/shared/network/local/cache_helper.dart';
import 'package:flutter_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_project/shared/styles/themes.dart';
import 'modules/Shop_App/login_screen/shop_login_screen.dart';
import 'modules/Shop_App/search/cubit/search_cubit.dart';
import 'modules/users/users_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  Widget widget;
  if(onBoarding){
    if(token != null){
      widget = const ShopLayout();
    }else{
      widget = ShopLoginScreen();
    }
  }else{
    widget = OnBoardingScreen();
  }

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ShopCubit>(
             create: (BuildContext context) => ShopCubit()
               ..getHomeData()
               ..getCategoryData()
               ..getFavoriteData()
               ..getUserData(),
          ),
          BlocProvider<SearchCubit>(
             create: (BuildContext context) => SearchCubit()
          ),
          BlocProvider<AppCubit>(
             create: (BuildContext context) => AppCubit()
          ),
        ],
          child: MyApp(widget)
      ));
  }

class MyApp extends StatelessWidget {
  const MyApp(this.widget,{super.key});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
       return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: widget,
        );
  }
}
