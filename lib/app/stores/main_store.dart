import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainState {
  late String text;

  MainState({required this.text});
}

final mainStore = StateProvider<MainState>((ref) => MainState(
      text: 'unchanged State',
    ));

void changeState(WidgetRef ref, String value) {
  print(value);
  ref.read(mainStore.state).state.text = value;
}
