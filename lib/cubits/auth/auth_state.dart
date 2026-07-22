import 'package:ecommerce_app/data/login/models/user_model.dart';


enum AuthStatus { initial, loading, success, error }

class AuthState {
  final AuthStatus status;
  final String? errMsg;
  final UserModel? user;

  AuthState({required this.status, this.errMsg, this.user});

  factory AuthState.initial() {
    return AuthState(status: AuthStatus.initial);
  }

  AuthState copyWith({AuthStatus? status, String? errMsg, UserModel? user}) {
    return AuthState(
      status: status ?? this.status,
      errMsg: errMsg ?? this.errMsg,
      user: user ?? this.user,
    );
  }
}
