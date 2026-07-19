import 'package:ecommerce_app/core/storage/secure_hive_helper.dart';
import 'package:ecommerce_app/core/storage/token_storage.dart';
import 'package:ecommerce_app/core/storage/user_storage.dart';
import 'package:ecommerce_app/data/models/user_model.dart';
import 'package:ecommerce_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/cubits/auth/auth_cubit.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce_app/ui/login/login_screen.dart';
import 'package:hive_flutter/adapters.dart';

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

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthRepository(authRemoteDataSource)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserStorage.isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
