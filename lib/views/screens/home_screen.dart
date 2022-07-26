import 'package:flutter/material.dart';
import 'package:tictok_tutorial/constants.dart';
import 'package:tictok_tutorial/views/widgets/custom_icon.dart';

//하단 표시바 -------------------------------------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //바텀바로 하단바 생성,  순서대로 홈화면, 검색화면, +(custom) ,메세지, 유저
      bottomNavigationBar: BottomNavigationBar(
        //클릭시 선택인덱스로 변경 -------------------------
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        //하단바 고정 컬러 검정색---------------------------------
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        //선택된 아이콘 빨간색------------------------------------
        selectedItemColor: Colors.red,
        //선택안된 아이콘 화이트
        unselectedItemColor: Colors.white,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            //customIcon.dart에다가 커스텀아이콘생성
            icon: CustomIcon(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 30),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[pageIdx],
    );
  }
}
