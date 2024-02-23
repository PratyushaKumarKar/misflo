import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SleepMusic extends StatefulWidget {
  const SleepMusic({super.key});

  @override
  _SleepMusicState createState() => _SleepMusicState();
}

class _SleepMusicState extends State<SleepMusic> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Pre-load the first song if you have a default song to play
    // _audioPlayer.setUrl('Your Firebase URL Here');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Adjust as needed
            child: Image.network(
              'https://via.placeholder.com/350x150', // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Deep Sleep Release',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            'Atif Aslam, Boss Menn',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Slider(
            value: 0.5, // This should be the current playback position
            onChanged: (newPosition) {
              // Implement seeking functionality
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  // Play or pause the music
                  if (_isPlaying) {
                    _audioPlayer.pause();
                  } else {
                    _audioPlayer.play();
                  }
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  // Implement navigation to explore albums
                },
                child: Text('Explore Albums'),
                style: TextButton.styleFrom(
                  primary: Colors.orange, // Text Color
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


