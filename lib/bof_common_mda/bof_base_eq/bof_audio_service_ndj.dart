import 'package:flame_audio/bgm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FOSAudioServiceGSY {
  final SharedPreferences sharedPreferences;
  final Bgm flameAudio;

  FOSAudioServiceGSY({
    required this.sharedPreferences,
    required this.flameAudio,
  });
  void initAudio() async {
    bool backgroundSoundActive =
        sharedPreferences.getBool("backgroundSound") ?? false;
    await flameAudio.play(
      'music.mp3',
    );

    if (!backgroundSoundActive) {
      await flameAudio.pause();
    }
  }
}
