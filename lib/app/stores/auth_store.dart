import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../models/access_token.dart';
import '../models/auth/login_form.dart';
import '../models/auth/signup_form.dart';
import '../models/user.dart';
import '../networking/auth_api_service.dart';

class AuthState {
  final bool isAuthenticated;
  final User? user;

  AuthState copyWith({
    bool? isAuthenticated,
    User? user,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
    );
  }

  AuthState({required this.isAuthenticated, required this.user});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthApiService authApiService = AuthApiService();
  AuthStateNotifier() : super(AuthState(isAuthenticated: false, user: null));
  changeState(AuthState newState) => state = newState;
}


final authStore = StateNotifierProvider<AuthStateNotifier,AuthState>((ref) => AuthStateNotifier());

void login(WidgetRef ref, LoginFormModel values,
    {Function(bool loggedIn)? onLogin}) async {
  AccessToken? token =
      await ref.read(authStore.notifier).authApiService.logIn(
            email: values.email,
            password: values.password,
          );
  if (token == null) {
    return;
  }
  await NyStorage.store("accessToken", token.accessToken);

  User? user = await ref.read(authStore.notifier).authApiService.getUser();
  if (user == null) {
    return;
  }

  ref.read(authStore.notifier).changeState(AuthState(isAuthenticated: true, user: user));

  print(onLogin);
  if (onLogin != null) {
    onLogin(true);
  }
}

Future<void> signup(WidgetRef ref, SignupFormModel values,
    {Function(bool loggedIn)? onLogin}) async {
  AccessToken? token =
      await ref.read(authStore.notifier).authApiService.signUp(
            email: values.email,
            password: values.password,
            firstName: values.firstName,
            lastName: values.lastName,
          );
  if (token == null) {
    return;
  }

  await NyStorage.store("accessToken", token.accessToken);

  User? user = await ref.read(authStore.notifier).authApiService.getUser();
  if (user == null) {
    return;
  }
  ref.read(authStore.notifier).changeState(AuthState(isAuthenticated: true, user: user));
  if (onLogin != null) {
    onLogin(true);
  }
}
