import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok_tutorial/controllers/upload_video_controller.dart';
import 'package:tictok_tutorial/views/widgets/text_input_field.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  UploddVideoController uploddVideoController =
      Get.put(UploddVideoController());

//비디오플레이어 컨트롤러 셋팅-------------------------------------------
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          //선택한 비디오 플레이 화면 디자인 ----------------------------------
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: VideoPlayer(controller),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Song Name 컨테이너 박스 디자인 ---------------------------
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _songController,
                    laberText: 'Song Name',
                    icon: Icons.music_note,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Caption 컨테이너 박스 디자인 -------------------------------
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _captionController,
                    laberText: 'Caption',
                    icon: Icons.closed_caption,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Share! 버튼 디자인 ----------------------------------
                ElevatedButton(
                  onPressed: () => uploddVideoController.uploadVideo(
                      _songController.text,
                      _captionController.text,
                      widget.videoPath),
                  child: const Text(
                    'Share!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
