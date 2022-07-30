import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok_tutorial/constants.dart';
import 'package:tictok_tutorial/views/screens/auth/signup_screen.dart';
import 'package:tictok_tutorial/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tictok Clone 글씨 디자인 -----------------------------
            Text(
              'Tictok Clone',
              style: TextStyle(
                color: buttonColor,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            //간격 주기 ------------------------------------------
            const SizedBox(
              height: 25,
            ),
            //email design----------------------------------------
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                laberText: 'Email',
                icon: Icons.email,
              ),
            ),
            //간격주기 -----------------------------------------------
            const SizedBox(
              height: 25,
            ),
            //password design-------------------------------------------
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
            // 간격 주기 ----------------------------------------------------
            const SizedBox(
              height: 30,
            ),
            // 로그인 버튼 디자인 ---------------------------------------------
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              //login 버튼 클릭시 print --------------------------------------
              child: InkWell(
                onTap: () => authController.loginUser(
                  _emailController.text,
                  _passwordController.text,
                ),
                child: const Center(
                  //Login 글씨 design------------------------------------------
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            //건격주기 -------------------------------------------------
            const SizedBox(
              height: 15,
            ),
            //패스워드 잃어버렷을때 문구. --------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  //Register 버튼 클릭스 출력 기능.-------------------------------
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  ),
                  child: Text(
                    //Resgiser 스타일-----------------------------------
                    'Register',
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
