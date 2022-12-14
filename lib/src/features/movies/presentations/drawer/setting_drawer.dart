import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/enum.dart';
import '../../../../utils/theme.dart';

class SettingDrawer extends ConsumerWidget {
  const SettingDrawer({super.key});

  void toogleTheme(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).toogleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isActive =
        ref.watch(themeNotifierProvider.notifier).mode == ThemeModes.dark;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Text(
            isActive ? "Dark" : "Light",
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline1?.color),
            ),
            Switch.adaptive(
                value: isActive, onChanged: (val) => toogleTheme(ref)),
          ],
        ),
      ),
    );
  }
}
