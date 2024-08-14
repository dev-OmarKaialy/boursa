import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:p_boursa/core/services/shared_preferences_service.dart';
import 'package:p_boursa/core/services/wish_list_model.dart';
import 'package:p_boursa/features/auth/presentation/bloc/auth_bloc.dart';

import 'features/advertisements/advertisements_screen.dart';
import 'features/splash_animated/splashAnimated.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  await Hive.initFlutter();
  Hive.registerAdapter(WishListModelAdapter());
  await Hive.openBox('wishlist');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'details': (context) =>
            const AdvertisementsScreen(), ///////////////// صفحة التفاصيل
      },
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: const Splash_Animated(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
