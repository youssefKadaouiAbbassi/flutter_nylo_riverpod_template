import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/stores/auth_store.dart';

class LogoutButton extends HookConsumerWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return
        TextButton(
          child: Text(
            "Logout",
          ),
          onPressed: () => logout(context,ref),
        );
  }
}
