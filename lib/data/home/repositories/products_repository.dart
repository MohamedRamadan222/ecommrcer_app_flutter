import 'package:ecommerce_app/data/home/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/data/home/models/product_model.dart';

class ProductsRepositories {
  final ProductRemoteDataSource remoteDataSource;
  ProductsRepositories(this.remoteDataSource);


  Future<List<ProductModel>> getProducts() async {
    return remoteDataSource.getProducts();
  }
}