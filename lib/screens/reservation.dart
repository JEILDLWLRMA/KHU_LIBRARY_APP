import 'package:flutter/material.dart';
import 'package:khu_library/widgets/roombutton.dart';
import 'package:khu_library/screens/openroom.dart';

class Reservation extends StatelessWidget {
  // Create a global key for the Room widget
  final GlobalKey<NavigatorState> roomNavigatorKey =
      GlobalKey<NavigatorState>();

  Reservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF181818),
        shadowColor: const Color(0xFF181818).withOpacity(0),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 48,
            ),
            Text(
              "경희대학교 도서관 이용증",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF181818),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
          CurrencyCard(
            name: '제 1열람실',
            code: '1F',
            amount: '65/410',
            icon: Icons.account_balance_outlined,
            isInverted: false,
            onTapCallback: () {
              // Check if the Room instance already exists
              if (roomNavigatorKey.currentState != null &&
                  roomNavigatorKey.currentState!.canPop()) {
                // If it exists, pop to the existing instance
                roomNavigatorKey.currentState!.pop();
              } else {
                // If it doesn't exist, create a new instance
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Room(
                      title: '제 1 열람실',
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CurrencyCard(
            name: '제 2열람실',
            code: '1F',
            amount: '14/144',
            icon: Icons.account_balance_outlined,
            isInverted: true,
            onTapCallback: () {
              // Check if the Room instance already exists
              if (roomNavigatorKey.currentState != null &&
                  roomNavigatorKey.currentState!.canPop()) {
                // If it exists, pop to the existing instance
                roomNavigatorKey.currentState!.pop();
              } else {
                // If it doesn't exist, create a new instance
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Room(title: '제 2 열람실'),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CurrencyCard(
            name: '제 3열람실',
            code: '2F',
            amount: '36/326',
            icon: Icons.account_balance_outlined,
            isInverted: false,
            onTapCallback: () {
              // Check if the Room instance already exists
              if (roomNavigatorKey.currentState != null &&
                  roomNavigatorKey.currentState!.canPop()) {
                // If it exists, pop to the existing instance
                roomNavigatorKey.currentState!.pop();
              } else {
                // If it doesn't exist, create a new instance
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Room(title: '제 3 열람실'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
