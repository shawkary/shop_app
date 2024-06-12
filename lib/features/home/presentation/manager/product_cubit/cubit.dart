import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import 'package:ibrahim_project/features/home/presentation/manager/product_cubit/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;

  Future<void> fetchProductData() async {
    emit(LoadingHomeState());
    var result = await homeRepo.fetchProductData();

    result.fold((failure) {
      emit(ErrorHomeState(failure.errorMessage));
    }, (homeModel) {
      emit(SuccessHomeState(homeModel));
    });
  }
}
