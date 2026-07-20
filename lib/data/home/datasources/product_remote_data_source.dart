import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/data/home/models/product_model.dart';

class ProductRemoteDataSource {
  ProductRemoteDataSource();

  Future<List<ProductModel>> getProducts() async {
    final response = await ApiClient.dio.get('/products');
    final data = response.data['products'] as List;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
