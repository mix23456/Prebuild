import 'package:flutter/material.dart';
import 'package:responsive/constructor/presetTheme.dart';
import 'package:responsive/pages/home_screen.dart';
import 'package:responsive/provider/themeProvider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Themeprovider>(create: (_) => Themeprovider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      title: 'Responsive Demo',
      themeMode: context.watch<Themeprovider>().themeMode,
      theme: PresetTheme.lightTheme,
      darkTheme: PresetTheme.darkTheme,
      home: const Home_screen(),
    );
  }
}
