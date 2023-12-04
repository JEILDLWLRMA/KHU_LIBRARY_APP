import 'package:flutter/material.dart';

class CertificationCard extends StatelessWidget {
  const CertificationCard({super.key});

  // Function to show the check-in/out popup
  void _showCheckInOutPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: const Color(0xFF1F2123).withOpacity(0.98),
          title: const Text(
            '외출 또는 퇴실 선택',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              const Text(
                "외출을 누르시면 누른 시점을 기준으로 \n두시간 이내로 자리로 복귀하셔야 합니다. \n퇴실 버튼을 누르는 경우 좌석이 반납됨에 \n유의하시기 바랍니다.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle 외출 logic here
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(173, 29, 25, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(90, 45),
                    ),
                    child: const Text(
                      '외출',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Handle 퇴실 logic here
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(173, 29, 25, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(90, 45),
                    ),
                    child: const Text(
                      '퇴실',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showCheckInOutPopup(
            context); // Show check-in/out popup when the card is tapped
      },
      child: SizedBox(
        width: 380,
        height: 650,
        child: Card(
          shadowColor: Colors.black,
          color: const Color.fromRGBO(173, 29, 25, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '도서관 모바일 이용증',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '도서관 모바일 이용증은 \n신분증, 건물 출입증이 아닙니다.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 400,
                  height: 100,
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(
                  width: 290,
                  height: 380,
                  child: Card(
                    shadowColor: Colors.black.withOpacity(0.3),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 270,
                          width: 300,
                          child: Image.asset("assets/images/qr.png"),
                        ),
                        const Text(
                            "이름 | 이혁승\n학번 | 2022105793\n학과 | 컴퓨터공학부\n신분 | 재학생(학부)")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
