import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final videoURL = "https://youtu.be/Z-7p5kNocfA?si=j9wRsoW6ce9d5VVy";
  final youtubeURL = "https://www.youtube.com/watch?v=Z-7p5kNocfA&feature=youtu.be";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Về chúng tôi"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => debugPrint('Sẵn sàng'),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              const PlaybackSpeedButton(),
            ],
          ),
          const SizedBox(height: 16), // Khoảng cách giữa video và link
          Center(
            child: ElevatedButton(
              onPressed: () {
                _openYoutubeLink();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Thiết lập màu đỏ cho nút
              ),
              child: const Text(
                'Xem trên YouTube',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openYoutubeLink() async {
    if (await canLaunch(youtubeURL)) {
      await launch(youtubeURL);
    } else {
      throw 'Không thể mở $youtubeURL';
    }
  }
}
