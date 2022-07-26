import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok_tutorial/controllers/video_controller.dart';
import 'package:tictok_tutorial/views/widgets/circle_animation.dart';
import 'package:tictok_tutorial/views/widgets/video_player_item.dart';
import 'package:video_player/video_player.dart';

//업로드한 비디오 홈화면에 게시 --------------------------------------------------
class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

//게시물 프로필 구현 -------------------------------------------------------------------
  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //음악앨범 사이즈, 색, 크기 구현 함수 ---------------------------------------------------
  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.circular(25)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //아이콘 위치 변수 ---------------------------------------------------------
    final size = MediaQuery.of(context).size;
    //게시물 하나씩 넘기기 페이지 컨트롤러 사용 --------------------------------------------
    return Scaffold(
      body: PageView.builder(
        //itemCount: ,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          //홈 게시물 유저네임, 캡션, 음악 아이콘, 음악 이름 제작 ------------------------------------
          return Stack(
            children: [
              // VideoPlayerItem(videoUrl: ,),
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // 유저네임, 캡션, 음악 위치 설정 ---------------------------------------------------------------------
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //유저네임 텍스트 제작 -------------------------------------------------
                                Text(
                                  'username',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //캡션 텍스트 제작 -------------------------------------------------------
                                Text(
                                  'caption',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //음악 아이콘 제작 ------------------------------------------------------
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.music_note,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    //음악 이름 텍스트 제작 ---------------------------------------------
                                    Text(
                                      'song name',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //아이콘(프로필, 좋아요,공유, 댓글) 위치 정렬  -------------------------------------------------
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: size.height / 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildProfile('string url'),
                              //좋아요버튼 기능 구현 ----------------------------------------------------------------
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.favorite,
                                      size: 40,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    '2,200',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              //댓글버튼 기능 구현 ----------------------------------------------------------------------------
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.comment,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    '2',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              //공유버튼 기능 구현 ---------------------------------------------------------------------------------------
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.reply,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    '2',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              //음악앨범 돌아가는 애니메이션 기능 구현 -----------------------------------------------------------
                              CircleAnimation(
                                child: buildMusicAlbum('profile photo '),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
