// ignore_for_file: no_logic_in_create_state

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/determinant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../home/home.dart';
import 'database.dart';
import 'constants.dart' ;

// ignore: must_be_immutable
class Yt extends StatefulWidget {
  String inputurl;
  int startAt = 0;
  Yt({super.key, required this.inputurl, required this.startAt});

  @override
  State<Yt> createState() => _YtState(inputurl: inputurl ,startAt: startAt);
}

class _YtState extends State<Yt> {
  final String inputurl;
  int startAt = 0;
  _YtState({required this.inputurl, required this.startAt});
  late YoutubePlayerController _controller;
  late Duration duration;
  Timer? timer;
  // ignore: prefer_typing_uninitialized_variables
  var user;
  int points = 0;

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
    super.dispose();
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
          loop: false,
          mute: false,
          hideControls: false,
          showLiveFullscreenButton: true,
          controlsVisibleAtStart: true,
          startAt: startAt,
        ));
    duration = const Duration(milliseconds: 0);
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int listid = int.parse(inputurl.substring(inputurl.lastIndexOf('=') + 1));
    String playid = inputurl.substring(inputurl.lastIndexOf("list=") + 5,inputurl.lastIndexOf('\\'));
    int deviation = determinant(a: playid).diversion();
    final user = Provider.of<DocumentSnapshot?>(context);
    Map<String, dynamic> data = {};
    if (user != null) {
      data = user.data() as Map<String, dynamic>;
    }
    if (points != -1 &&
        duration.inSeconds >=
            1 * _controller.metadata.duration.inSeconds / 100.0 &&
        _controller.value.position.inSeconds > 1 && data['ARRAY'][listid-1] == 0 && currentCourse.compareTo(data['Main Course']) == 0) {
      points = 1;
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .updateUserPoints( data['Points']+1);
      List replacement = data['ARRAY'];
      replacement[listid-1] = 1;
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .updateUserArray(replacement);

      points = -1;
    }
    return StreamProvider<DocumentSnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      child: WillPopScope(
        onWillPop: (){
          List replacement = data['DURATION'];
          replacement[listid-1+deviation] = _controller.value.position.inSeconds;
          DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .updateUserDuration(replacement);
          manage().set(_controller.value.position.inSeconds, inputurl);
          Navigator.of(context).pop();
          return Future.value(true);
        },
        child: Scaffold(
            appBar: AppBar(
                leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                List replacement = data['DURATION'];
                replacement[listid-1+deviation] = _controller.value.position.inSeconds;
                DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                    .updateUserDuration(replacement);
                manage().set(_controller.value.position.inSeconds, inputurl);
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
      ),
    );
  }
}
