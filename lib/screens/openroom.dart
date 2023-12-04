import 'dart:async';
import 'package:flutter/material.dart';
import 'package:khu_library/screens/report.dart';

class Room extends StatefulWidget {
  final String title;

  const Room({Key? key, required this.title}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> with AutomaticKeepAliveClientMixin {
  int currentReservationIndex = -1;
  late DateTime reservationStartTime;
  late Timer countdownTimer = Timer(
    const Duration(seconds: 0),
    () => {},
  ); // 초기화 추가
  static const int reservationDuration = 4 * 60 * 60;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == '관리자 신고') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Report(),
                  ),
                );
              } else {
                // Do something for other menu items
              }
            },
            icon: const Icon(Icons.menu),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: '관리자 신고',
                child: Text('관리자 신고'),
              ),
            ],
            elevation: 8,
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
        backgroundColor: const Color(0xFF181818),
        shadowColor: const Color(0xFF181818).withOpacity(0),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          bool isReserved = currentReservationIndex == index;
          Color seatColor = isReserved ? Colors.red : Colors.green;

          return GestureDetector(
            onTap: () {
              setState(() {
                if (currentReservationIndex == -1) {
                  currentReservationIndex = index;
                  reservationStartTime = DateTime.now();
                  startCountdownTimer();
                } else if (currentReservationIndex == index) {
                  cancelReservation();
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('이미 좌석 예약 중'),
                        content: const Text('한 번에 하나의 좌석만 예약 가능합니다.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('확인'),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: seatColor,
                borderRadius: BorderRadius.circular(
                    12), // Adjust the radius for round corners
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '좌석 ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (currentReservationIndex == index)
                      Text(
                        '남은 시간: ${formatRemainingTime()}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: const Color(0xFF181818),
    );
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    countdownTimer.cancel();
    super.dispose();
  }

  void startCountdownTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (calculateRemainingTime() <= 0) {
              cancelReservation();
            }
          },
        );
      },
    );
  }

  void cancelReservation() {
    currentReservationIndex = -1;
    countdownTimer.cancel();
  }

  int calculateRemainingTime() {
    final elapsedSeconds =
        DateTime.now().difference(reservationStartTime).inSeconds;
    return reservationDuration - elapsedSeconds;
  }

  String formatRemainingTime() {
    final remainingTime = calculateRemainingTime();
    final hours = remainingTime ~/ 3600;
    final minutes = (remainingTime % 3600) ~/ 60;
    final seconds = remainingTime % 60;
    return '$hours시간 $minutes분 $seconds초';
  }
}
