import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok_tutorial/controllers/search_controller.dart';
import 'package:tictok_tutorial/models/user.dart';
import 'package:tictok_tutorial/views/screens/auth/profile_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  //search스크린 컨트롤러 구현 --------------------------------------------------
  final SearchController searchController = Get.put(SearchController());

  //obx로 실시간 업데이트 ---------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          //검색창 필드 ------------------------------------------------------
          title: TextFormField(
            decoration: const InputDecoration(
              filled: false,
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            //엔터 누를시 검색한 상대 볼륨값 불러오기 -------------------------------------
            onFieldSubmitted: (value) => searchController.searchUser(value),
          ),
        ),
        //바디 텍스트창 구현  ----------------------------------------------
        body: searchController.searchedUsers.isEmpty
            ? const Center(
                child: Text(
                  'Search for users!',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            //리스트 뷰로 검색한 상대 프로필 생성 ----------------------------------
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = searchController.searchedUsers[index];
                  return InkWell(
                    // 클릭시 프로필로 이동 ------------------------------------------
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid),
                      ),
                    ),
                    //네트워크 이미지, (유저 이미지) 구현 -------------------------------
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          user.profilPhoto,
                        ),
                      ),
                      // 이름 텍스트창 구현 -------------------------------------------------
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
