
import 'package:chatbot_prj/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/active_theme_provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mov=Color(0xFFeb06ff);
    final bllue=Color(0xFF97b4ff);
    final bllue2=Color(0xFF3450a1);
    final customBlue = Color(0xFF041955);

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(1.0), // Add some padding around the logo
        child: Image.asset('images/assistant.png',width: 100,),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              customBlue,
              bllue2,

            ])),
      ),
      title: const Text(
        "AI Assistant",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        Row(
          children: [
            Consumer(
              builder: (context, ref, child) => Icon(
                ref.watch(activeThemeProvider) == Themes.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
            const SizedBox(width: 8),
            const ThemeSwitch(),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {},// Call your logout method here
              tooltip: 'Log out',
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        )
      ],

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
