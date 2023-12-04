import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: Report(),
  ));
}

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final TextEditingController seatNumberController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('Report');

  Future<void> _sendReport() async {
    final String seatNumber = seatNumberController.text;
    final String reason = reasonController.text;

    print('Seat Number: $seatNumber');
    print('Reason: $reason');

    if (seatNumber.isNotEmpty && reason.isNotEmpty) {
      // Store data in Firebase Realtime Database
      await _database.push().set({
        'SeatNum': seatNumber,
        'Reason': reason,
      });

      // Show success alert
      _showAlert('신고가 성공적으로 전송되었습니다.');
    } else {
      // Show error alert for empty fields
      _showAlert('좌석 번호와 신고 사유를 모두 입력해주세요.');
    }
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('알림'),
          content: Text(message),
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
        shadowColor: const Color(0xFF181818).withOpacity(0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: seatNumberController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: '열람실 / 좌석 번호',
                  hintText: '신고할 열람실 및 좌석 번호를 입력하세요',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: reasonController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: '신고 사유',
                  hintText: '신고 사유를 적어주세요',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendReport,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(173, 29, 25, 1)),
              child: const Text('신고'),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF181818),
    );
  }
}
