

import 'package:chatbot_prj/log_in/sing_in.dart';
import 'package:chatbot_prj/screens/chat_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'constants/themes.dart';
import 'providers/active_theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: App()));

}

class App extends ConsumerWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);
    return GetMaterialApp(
      theme: lightTheme, // ThemeData
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false, // ThemeData.dark()
      themeMode: activeTheme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
      home:Sign_in(),
    ); // MaterialApp
  }
}
