import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import 'package:ibrahim_project/features/home/presentation/manager/category_cubit/states.dart';


class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit(this.homeRepo) : super(InitialCategoryState());

  static CategoryCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;

  Future<void> fetchCategoryData() async {
    emit(LoadingCategoryState());
    var result = await homeRepo.fetchCategoryData();

    result.fold((failure) {
      emit(ErrorCategoryState(failure.errorMessage));
    }, (categoryModel) {
      emit(SuccessCategoryState(categoryModel));
    });
  }
}
