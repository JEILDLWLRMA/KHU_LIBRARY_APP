import 'package:flutter/material.dart';
import 'package:khu_library/screens/report.dart';

class Room extends StatefulWidget {
  final String title;

  const Room({Key? key, required this.title}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  // Index of the currently reserved seat, -1 means no reservation
  int currentReservationIndex = -1;

  @override
  Widget build(BuildContext context) {
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
              // Handle menu item selection here
              if (value == '관리자 신고') {
                // Do something for item1
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Report(),
                  ),
                );
              } else {
                // Do something for item2
              }
            },
            icon: const Icon(Icons.menu),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: '관리자 신고',
                child: Text('관리자 신고'),
              ),
              for (int i = 1; i <= 6; i++)
                PopupMenuItem<String>(
                  value: 'item$i',
                  child: Text('좌석 $i'),
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
      body: Center(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            // Check if seat is reserved
            bool isReserved = currentReservationIndex == index;

            // Determine color based on reservation status
            Color seatColor = isReserved ? Colors.red : Colors.green;

            return GestureDetector(
              onTap: () {
                // Handle seat tap
                setState(() {
                  if (currentReservationIndex == -1) {
                    // Reserve the seat
                    currentReservationIndex = index;
                  } else if (currentReservationIndex == index) {
                    // Cancel the reservation if tapping the same seat again
                    currentReservationIndex = -1;
                  } else {
                    // Show a popup indicating that a seat is already reserved
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
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                color: seatColor,
                child: Text(
                  '좌석 ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: const Color(0xFF181818),
    );
  }
}
