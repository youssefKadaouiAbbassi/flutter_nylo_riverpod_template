import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/stores/main_store.dart';

class Example extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainStore.state).state;
    return Column(
      children: [
        Text(state.text),
        TextButton(
          child: Text("Change state"),
          onPressed: () => changeState(ref, "changed state"),
        ),
      ],
    );
  }
}
