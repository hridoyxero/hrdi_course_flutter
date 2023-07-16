import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_04/song.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  // bool isPlaying = false;
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  late AudioPlayer _audioPlayer;

  IconData playIc = Icons.play_arrow;
  List<Song> songs = [
    Song(name: "Song 01"),
    Song(name: "Song 02"),
    Song(name: "Song 03"),
    Song(name: "Song 04"),
    Song(name: "Song 05"),
  ];
  List<String> songsPath = [
    "music/demo_music_01.mp3",
    "music/demo_music_02.mp3",
    "music/demo_music_01.mp3",
    "music/demo_music_02.mp3",
    "music/demo_music_01.mp3",
  ];

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();
  }
  @override
  void dispose() {
    _audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return SongTile(audioPlayer: _audioPlayer, songTitle: songs.elementAt(index).name, songPath: songsPath.elementAt(index),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongTile extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final String songTitle;
  final String songPath;
  final bool isPlaying;

  const SongTile({super.key, required this.songTitle, required this.songPath, this.isPlaying = false, required this.audioPlayer,});

  @override
  _SongTileState createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.songTitle),
      // subtitle: Text(widget.songTitle),
      trailing: IconButton(
        icon: isPlaying
            ? Icon(Icons.pause_circle_filled)
            : Icon(Icons.play_circle_filled),
        onPressed: (){
          if (isPlaying) {
            pauseAudio();
          } else {
            playAudio(widget.songPath);
          }
          setState(() {

          });
          // Logic to start or stop playing the song
          print('Playing: ${widget.songTitle}');
        },
      ),
    );
  }

  void pauseAudio() async {
    isPlaying = false;
    await widget.audioPlayer.pause();
  }

  Future<void> playAudio(String audioUrl) async {
    isPlaying = true;
    await widget.audioPlayer.play(AssetSource(audioUrl));
  }

  void stopAudio() async {
    isPlaying = false;
    await widget.audioPlayer.stop();
  }
}
