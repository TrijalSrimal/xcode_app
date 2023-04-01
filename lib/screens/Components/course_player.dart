// ignore_for_file: no_logic_in_create_state

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/determinant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../home/home.dart';
import 'database.dart';
import 'constants.dart' ;

// ignore: must_be_immutable
//used to play all videos, takes url and starting pos from constants and firebase
class Yt extends StatefulWidget {
  final String inputurl;
  final int startAt;
  final viewedDuration;
  const Yt({super.key, required this.inputurl, required this.startAt, required this.viewedDuration});

  @override
  State<Yt> createState() => _YtState(inputurl: inputurl ,startAt: startAt, viewedDuration: viewedDuration);
}

class _YtState extends State<Yt> {
  final String inputurl;
  final int startAt;
  final int viewedDuration;
  _YtState({required this.inputurl, required this.startAt, required this.viewedDuration});
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
//duration increases with video playing
  void addTime() {
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
//timer that calculates video playing
  void startTimer() {
      timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
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
    duration = Duration(seconds: viewedDuration);
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //taking listid to play and playid to check which video of playlist
    int listid = int.parse(inputurl.substring(inputurl.lastIndexOf('=') + 1));
    String playid = inputurl.substring(inputurl.lastIndexOf("list=") + 5,inputurl.lastIndexOf('\\'));
    //deviation is used so that acccurate position of video in duration can be identified, for more details, view determinant.dart
    int deviation = determinant(a: playid).diversion();
    //gets data from provider stream
    final user = Provider.of<DocumentSnapshot?>(context);
    Map<String, dynamic> data = {};
    if (user != null) {
      data = user.data() as Map<String, dynamic>;
    }
    else
      {
        return const Center(child: CircularProgressIndicator());
      }
    //point adding when 80 percent video played, it is ensured that point added only once in lifetime, point added only when viewing maincourse
    if (points != -1 &&
        duration.inSeconds.toDouble()*_controller.value.playbackRate >= ((80.0 * _controller.metadata.duration.inSeconds.toDouble() )/ 100.0) &&
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
      //willpopscope and on willpop  is used to close player and edit duration if back button of device is presses,
      //onwillpop changes back to portrait if app is exited when fullscreen mode is on
      child: WillPopScope(
        onWillPop: (){
          List replacement = data['DURATION'];
          print("till here no pb");
          List replacement2 = data['POINT_ARRAY_DURATIONS'];
          print("till here no pb");
          replacement2[listid-1+deviation] = replacement2[listid-1+deviation] + (duration.inSeconds*_controller.value.playbackRate).round();
          print("till here no pb");
          replacement[listid-1+deviation] = _controller.value.position.inSeconds;
          print("till here no pb");
          DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .updateUserDuration(replacement);
          print("till here no pb");
          DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .updateUserPointArray(replacement2);
          print("till here no pb");
          DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).updateUserLasts( inputurl, _controller.value.position.inSeconds, _controller.metadata.title);
          if (_controller.value.isFullScreen) {
            SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          }
          Navigator.of(context).pop();
          return Future.value(true);
        },
        //this scaffold houses the youtube video player
        child: Scaffold(
            appBar: _controller.value.isFullScreen?null:AppBar(
              title: Text(_controller.metadata.title),
                leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                //updating the duration of video and its firebase counterpart
                List replacement = data['DURATION'];
                replacement[listid-1+deviation] = _controller.value.position.inSeconds;
                List replacement2 = data['POINT_ARRAY_DURATIONS'];
                replacement2[listid-1+deviation] = replacement2[listid-1+deviation] + (duration.inSeconds*_controller.value.playbackRate).round();
                DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                    .updateUserDuration(replacement);
                DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                    .updateUserPointArray(replacement2);
                //updating lastvideo and its time
                DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).updateUserLasts( inputurl, _controller.value.position.inSeconds, _controller.metadata.title);
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
