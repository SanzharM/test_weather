import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfoliome/weather/domain/blocs/main_screen/main_screen_bloc.dart';
import 'package:portfoliome/weather/presentation/screens/main_screen/main_screen.dart';
import 'package:portfoliome/weather/presentation/theme/app_theme.dart';

import 'core/constants/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.lightGrey,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: AppTheme().defaultTheme,
      home: BlocProvider<MainScreenBloc>(
        create: (context) => MainScreenBloc(),
        child: const MainScreen(),
      ),
    );
  }
}
