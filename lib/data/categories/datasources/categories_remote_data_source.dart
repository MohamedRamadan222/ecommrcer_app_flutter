import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/data/categories/models/categories_model.dart';

class CategoriesRemoteDataSource {
  CategoriesRemoteDataSource();

  Future<List<CategoriesModel>> getCategories() async {
    final response = await ApiClient.dio.get('/products/categories');
    final data = response.data as List;

    return data.map((category) => CategoriesModel.fromJson(category)).toList();
  }
}
