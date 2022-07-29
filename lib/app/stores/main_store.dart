import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainState {
  MainState({required this.text});
  final String text;
  MainState copyWith({required String text}) => MainState(
        text: text,
      );
}

class MainStateNotifier extends StateNotifier<MainState> {
  MainStateNotifier() : super(MainState(text: 'Hello World'));
  void changeState(String text) => state = state.copyWith(text: text);
}

final mainStore = StateNotifierProvider<MainStateNotifier,MainState>((ref) => MainStateNotifier());

void changeState(WidgetRef ref, String value) {
  print(value);
  ref.read(mainStore.notifier).changeState(value);
}
