
import 'package:flutter/material.dart';

class VoiceWidget extends StatefulWidget {
  const VoiceWidget(
      {super.key, this.mode = PlayerMode.mediaPlayer, required this.url});
  final String url;
  final PlayerMode mode;

  @override
  State<VoiceWidget> createState() => _VoiceWidgetState(url, mode);
}

class _VoiceWidgetState extends State<VoiceWidget> {
  final String url;
  final PlayerMode mode;
  late AudioPlayer _audioPlayer;
  PlayerState? _audioplayerState;
  PlayerState _playerState = PlayerState.stopped;
  // PlayingRoute _playingRoute=PlayingRoute.SPEAKERS;

  Duration? _duration;
  Duration? _position;

  // StreamSubscription<PlayerControl>

  _VoiceWidgetState(this.url, this.mode);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

















import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class VoiceWidget extends StatefulWidget {
  const VoiceWidget(
      {super.key, this.mode = PlayerMode.mediaPlayer, required this.url});
  final String url;
  final PlayerMode mode;

  @override
  State<VoiceWidget> createState() => _VoiceWidgetState(url, mode);
}

// class _VoiceWidgetState extends State<VoiceWidget> {
//   final String url;
//   final PlayerMode mode;
//   late AudioPlayer _audioPlayer;
//   PlayerState _playerState = PlayerState.stopped;
//   late StreamSubscription<PlayerControl> _playerSubscription;
//   Duration? _duration;
//   Duration? _position;

//   _VoiceWidgetState(this.url, this.mode);

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer(mode: mode);
//     _playerSubscription = _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
//       setState(() {
//         _playerState = state;
//       });
//     });
//     _audioPlayer.onDurationChanged.listen((Duration duration) {
//       setState(() {
//         _duration = duration;
//       });
//     });
//     _audioPlayer.onPositionChanged.listen((Duration position) {
//       setState(() {
//         _position = position;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('Hello, world!'),
//     );
//   }

//   @override
//   void dispose() {
//     _playerSubscription.cancel();
//     _audioPlayer.dispose();
//     super.dispose();
//   }
// }
