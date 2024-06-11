import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/cache_helper.dart';
import 'package:ibrahim_project/features/on_boarding/presentation/views/boarding_view.dart';
import 'constants.dart';
import 'core/utiles/components.dart';
import 'features/login/presentation/views/login_view.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  isLast = CacheHelper.getData(key: 'isLast');
  Widget widget;
  if(isLast != null){
    widget = const LoginView();
  }else{
    widget = const OnBoardingView();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  const MyApp(this.widget, {super.key});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget,
    );
  }
}
