import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:santander_app/pages/home/home_page.dart';
import 'package:santander_app/shared/app_settings.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettings.screenWidth = MediaQuery.of(context).size.width;
    AppSettings.screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Santander Dev Week',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
