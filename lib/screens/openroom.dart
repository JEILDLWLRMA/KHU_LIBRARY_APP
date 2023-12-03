import 'package:flutter/material.dart';
import 'package:khu_library/screens/report.dart';

class Room extends StatelessWidget {
  final String title;

  const Room({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
              const PopupMenuItem<String>(
                value: 'item',
                child: Text('좌석 1번'),
              ),
              const PopupMenuItem<String>(
                value: 'item',
                child: Text('좌석 2번'),
              ),
              const PopupMenuItem<String>(
                value: 'item',
                child: Text('좌석 3번'),
              ),
              const PopupMenuItem<String>(
                value: 'item',
                child: Text('좌석 4번'),
              ),
              const PopupMenuItem<String>(
                value: 'item',
                child: Text('좌석 5번'),
              ),
              const PopupMenuItem<String>(
                value: 'item',
                child: Text('좌석 6번'),
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
      body: const Center(
        child: Column(),
      ),
      backgroundColor: const Color(0xFF181818),
    );
  }
}
