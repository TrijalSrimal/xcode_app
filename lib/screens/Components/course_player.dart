import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../main.dart';
import '../home/home.dart';
import 'database.dart';
import 'constants.dart';

class Yt extends StatefulWidget {
  String inputurl;

  Yt({required this.inputurl});

  @override
  State<Yt> createState() => _YtState(inputurl: inputurl);
}

class _YtState extends State<Yt> {
  final String inputurl;

  _YtState({required this.inputurl});

  late YoutubePlayerController _controller;
  late Duration duration;
  Timer? timer;
  var user;
  int points = 0;

  @override
  Future<void> navigateToHome(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: const Home(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  void subtractTime() {
    setState(() {
      if (_controller.value.isPlaying) {
        final seconds = duration.inSeconds + 1;
        duration = Duration(seconds: seconds);
      } else {
        duration = Duration(seconds: duration.inSeconds);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose;
    timer?.cancel();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => subtractTime());
  }

  @override
  void initState() {
    final id = YoutubePlayer.convertUrlToId(inputurl);
    _controller = YoutubePlayerController(
        initialVideoId: id!,
        flags: YoutubePlayerFlags(
          loop: true,
          mute: false,
          hideControls: false,
          showLiveFullscreenButton: true,
          controlsVisibleAtStart: true,
        ));
    duration = Duration(milliseconds: 0);
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DocumentSnapshot?>(context);
    Map<String, dynamic> data = new Map();
    if (user != null) {
      data = user?.data() as Map<String, dynamic>;
      print(data);
    } else {
      print("Error");
    }
    if (points != -1 &&
        duration.inSeconds >=
            90.0 * _controller.metadata.duration.inSeconds / 100.0 &&
        _controller.value.position.inSeconds > 1) {
      points = 1;
      print(points);
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .updateUserData(data['Class'], data['Name'], data['Registration No.'],
              data['Email'], data['Points'] + 1, data['Coding Streak']);
      points = -1;
    }
    return StreamProvider<DocumentSnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              manage().set(YoutubePlayer.convertUrlToId(inputurl).toString(),
                  _controller.metadata.duration.inSeconds);
              if (_controller.value.isFullScreen) {
                _controller.toggleFullScreenMode();
              }
              Navigator.pop(context);
            },
          )),
          body: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  )),
            ],
          )),
    );
  }
}
