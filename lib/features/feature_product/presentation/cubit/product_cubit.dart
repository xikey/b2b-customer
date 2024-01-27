
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../../common/resources/data_state.dart';
import '../../../../common/utils/prefs_operator.dart';
import '../../../../locator.dart';
import '../../repository/product_repository.dart';

part 'product_state.dart';

part 'product_status.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepository productRepository;

  ProductCubit(
    this.productRepository,
  ) : super(ProductState(productStatus: InitialStatus()));

  void getAllProducts() async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState = await productRepository.getAllProducts(token);

    emit(state.copyWith(newStatus: GetProductsStatus(dataState)));
  }

  void getAllProductsOfCategory(int categoryID) async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState = await productRepository.getAllProductsOfCategory(token,categoryID);

    emit(state.copyWith(newStatus: GetProductsOfCategoryStatus(dataState)));
  }

  void search(String keySearch) async {
    emit(state.copyWith(newStatus: LoadingStatus()));
    emit(state.copyWith(newStatus: SearchStatus(keySearch)));
  }


  void getAllNewProducts() async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState =
        await productRepository.getAllNewProducts(token);

    emit(state.copyWith(newStatus: GetProductsStatus(dataState)));
  }


  void getAllSpecialProducts() async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState =
        await productRepository.getAllSpecialProducts(token);

    emit(state.copyWith(newStatus: GetProductsStatus(dataState)));
  }

  void getAllCategories() async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState = await productRepository.getAllCategories(token);

    emit(state.copyWith(newStatus: GetCategoriesStatus(dataState)));
  }



}
