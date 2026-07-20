import 'package:ecommerce_app/data/categories/datasources/categories_remote_data_source.dart';
import 'package:ecommerce_app/data/categories/models/categories_model.dart';

class CategoryRepository {
  final CategoriesRemoteDataSource remoteDataSource;

  CategoryRepository(this.remoteDataSource);

  Future<List<CategoriesModel>> getCategories() async {
    return remoteDataSource.getCategories();
  }
}
