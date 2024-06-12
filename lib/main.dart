import 'package:book_of_ra/bof_common_mda/bof_base_eq/bof_audio_service_ndj.dart';
import 'package:book_of_ra/bof_pages_none/bof_init_ita/bof_splash_screen_soq.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:book_of_ra/bof_common_mda/bof_ui_iqd/bof_app_theme_tytq.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setPortraitUpOnly();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  Bgm flameAudio = FlameAudio.bgm;
  flameAudio.initialize();

  FOSAudioServiceGSY(
    sharedPreferences: sharedPreferences,
    flameAudio: flameAudio,
  ).initAudio();

  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPreferences>(
          create: ((context) => sharedPreferences),
        ),
        Provider<Bgm>(
          create: ((context) => flameAudio),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const BOFSplashScreenDIA(),
      ),
    );
  }
}
