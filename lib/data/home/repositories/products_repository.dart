import 'package:ecommerce_app/data/home/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/data/home/models/product_model.dart';

class ProductsRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductsRepository(this.remoteDataSource);

  Future<List<ProductModel>> getProducts() async {
    return remoteDataSource.getProducts();
  }
}
