// new module header

/// pass n as number of sounds. Max 5.
import void PlayRandomSound(int volume, int n, AudioClip* ac_1,  AudioClip* ac_2 = 0,  AudioClip* ac_3 = 0,  AudioClip* ac_4 = 0,  AudioClip* ac_5 = 0);
import void Sound_AmbientPlay(AudioClip* amb);
import void Sound_MusicPlay(AudioClip* mus);
import void Sound_MusicStop();
import void Sound_AmbientStop();
import void Sound_AmbientSetVolume(int vol);
import void Sound_MusicFadeOut(float time);
import void Sound_SFXPlay(AudioClip* sfx);

// Helper modules are simple modules, made to write once, test once functionality
// Different from utility modules, Helper modules contain game or engine SPECIFIC functionality
//                              <<------>>