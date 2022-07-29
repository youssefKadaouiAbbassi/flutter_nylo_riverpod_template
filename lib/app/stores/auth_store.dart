import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';

class AuthState {
  bool isAuthenticated;
  User? user;

  AuthState({required this.isAuthenticated, required this.user});
}


final authStore = StateProvider<AuthState>((ref) => AuthState(
  isAuthenticated: false,
  user: null,
));

void changeState(WidgetRef ref,bool value) {
  ref.read(authStore.state).state.isAuthenticated = value;
}
