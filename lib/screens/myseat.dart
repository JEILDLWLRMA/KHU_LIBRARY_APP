import 'package:flutter/material.dart';

class Myseat extends StatelessWidget {
  const Myseat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '경희대학교 도서관 이용증',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF181818),
        shadowColor: Colors.black.withOpacity(0.0),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 380,
              height: 700,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                color: const Color.fromRGBO(173, 29, 25, 1),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      '내 자리',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    SizedBox(
                      width: 350,
                      height: 180,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(23.2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '좌석 예약 / 발권 정보',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '이용일자 | ',
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '좌석 | ',
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '사용시간 | ',
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '연장횟수 | ',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(23.2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.account_balance_outlined,
                                    size: 60,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      height: 180,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(23.2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '그룹스터디실 예약 / 발권 정보',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '이용일자 | ',
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '좌석 | ',
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '사용시간 | ',
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '연장횟수 | ',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(23.2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.auto_stories_outlined,
                                    size: 60,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF181818),
    );
  }
}
