import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:khu_library/screens/reservation.dart';
import 'package:khu_library/widgets/mybutton.dart';
import 'package:khu_library/screens/notimpl.dart';
import 'package:khu_library/screens/certification.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:khu_library/screens/myseat.dart';
import 'package:khu_library/screens/report.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 1000,
            height: 300,
            child: Image.asset('assets/images/logo.png'),
          ),
          const Text(
            "경희대학교 도서관 이용증",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "반갑습니다, 이혁승님",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 45,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
              ),
              MyButton(
                buttonText: '열람실 좌석 예약',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Reservation(),
                    ),
                  );
                },
                reverse: true,
              ),
              const SizedBox(
                width: 15,
              ),
              MyButton(
                buttonText: ' 메세지 ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notimplement(),
                    ),
                  );
                },
                reverse: false,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
              ),
              MyButton(
                buttonText: '  내 자리  ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Myseat(),
                    ),
                  );
                },
                reverse: false,
              ),
              const SizedBox(
                width: 15,
              ),
              MyButton(
                buttonText: ' 그룹 스터디실 ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notimplement(),
                    ),
                  );
                },
                reverse: true,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
              ),
              MyButton(
                buttonText: '도서관 홈페이지',
                onPressed: () {
                  launchUrl(Uri.parse('https://library.khu.ac.kr/home/'));
                },
                reverse: true,
              ),
              const SizedBox(
                width: 10,
              ),
              MyButton(
                buttonText: '도서관 톡',
                onPressed: () {
                  launchUrl(Uri.parse('https://pf.kakao.com/_HrJtC'));
                },
                reverse: false,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 25,
              ),
              MainButton(
                buttonText: '도서관 \n모바일 \n이용증',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Certification(),
                    ),
                  );
                },
                reverse: false,
              ),
              const SizedBox(
                width: 15,
              ),
              MainButton(
                buttonText: '공지 사항',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notimplement(),
                    ),
                  );
                },
                reverse: true,
              ),
              const SizedBox(
                width: 15,
              ),
              MainButton(
                buttonText: '관리자 신고',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Report(),
                    ),
                  );
                },
                reverse: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
