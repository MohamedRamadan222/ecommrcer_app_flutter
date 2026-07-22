import 'package:ecommerce_app/core/storage/secure_hive_helper.dart';
import 'package:ecommerce_app/core/storage/user_storage.dart';
import 'package:ecommerce_app/cubits/home/categories/categories_cubit.dart';
import 'package:ecommerce_app/cubits/home/products/products_cubit.dart';
import 'package:ecommerce_app/data/categories/repositories/category_repository.dart';
import 'package:ecommerce_app/data/home/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/data/home/repositories/products_repository.dart';
import 'package:ecommerce_app/ui/home/home_screen.dart';
import 'package:ecommerce_app/ui/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/cubits/auth/auth_cubit.dart';
import 'package:ecommerce_app/data/login/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/login/datasources/auth_remote_data_source.dart';
import 'package:ecommerce_app/ui/login/login_screen.dart';
import 'package:hive_flutter/adapters.dart';

import 'data/categories/datasources/categories_remote_data_source.dart';
import 'data/login/models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());

  await SecureHiveHelper.openUserBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRemoteDataSource = AuthRemoteDataSource();
    final categoriesRemoteDataSource = CategoriesRemoteDataSource();
    final productsRemoteDataSource = ProductRemoteDataSource();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthRepository(authRemoteDataSource)),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) {
            final cubit = CategoriesCubit(
              CategoryRepository(categoriesRemoteDataSource),
            );
            if (UserStorage.isLoggedIn) {
              cubit.getCategories();
            }
            return cubit;
          },
        ),
        BlocProvider<ProductsCubit>(
          create: (context) {
            final cubit = ProductsCubit(
              ProductsRepository(productsRemoteDataSource),
            );
            if (UserStorage.isLoggedIn) {
              cubit.getProducts();
            }
            return cubit;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserStorage.isLoggedIn ? const MainScreen() : const LoginScreen(),
      ),
    );
  }
}
