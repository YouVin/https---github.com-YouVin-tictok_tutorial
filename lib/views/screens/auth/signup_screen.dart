import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok_tutorial/constants.dart';
import 'package:tictok_tutorial/views/screens/auth/login_screen.dart';
import '../../widgets/text_input_field.dart';

//계정 등록 화면
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //틱톡 클론 글씨 디자인 ------------------------
            Text(
              'Tictok Clone',
              style: TextStyle(
                color: buttonColor,
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
            //Register 글씨 디자인 ------------------------
            const Text(
              'Rester',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            //간격 만들기 --------------------------------
            const SizedBox(
              //email design
              height: 25,
            ),
            //사용자 프로필 화면 제작------------------------------
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/'),
                  backgroundColor: Colors.black,
                ),
                //프로필 변경 아이콘 제작------------------
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    //선택된 이미지 건네주기 ----------------
                    onPressed: () => authController.pickImage(),
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
              ],
            ),
            // 프로필과 Username 박스 간격 만들기---------------------------
            const SizedBox(
              height: 15,
            ),
            //Username 박스--------------------------------------------
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _usernameController,
                laberText: 'Username',
                icon: Icons.person,
              ),
            ),
            //간격 띄우기 ---------------------------------------------
            const SizedBox(
              height: 15,
            ),
            // email 박스 디자인 ---------------------------------------
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                laberText: 'Email',
                icon: Icons.email,
              ),
            ),
            // 박스 간격 띄우기 ------------------------------------------
            const SizedBox(
              //password design
              height: 15,
            ),
            // password 박스 디자인 ---------------------------------------
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                laberText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            //박스 간격 띄우기 ------------------------------------------
            const SizedBox(
              height: 30,
            ),
            //빨간색 Resigter 디자인 -----------------------------------------
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              //login 버튼 클릭시 print---------------------------------------
              // -> 클릭이벤트 클릭시 잉크버지는 효과
              child: InkWell(
                //데이터 전달 코드
                onTap: () => authController.registerUser(
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                  authController.profilePhoto,
                ),
                child: const Center(
                  //Resigter 글씨 design----------------------------------------
                  child: Text(
                    'Resigter',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            // 간격 띄우기 -----------------------------------------------------
            const SizedBox(
              height: 15,
            ),
            //이미 계정이 존재 했을때 문구. -----------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                //Login 버튼 클릭스 출력 기능. ---------------------------------
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ),

                  // login 글씨 디자인 -----------------------------------------
                  child: Text(
                    //Resgiser 스타일
                    'Login',
                    style: TextStyle(fontSize: 20, color: buttonColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
