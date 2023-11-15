import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.reverse,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final bool reverse;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        decoration: BoxDecoration(
          // ... your existing code
          color: widget.reverse
              ? const Color.fromRGBO(173, 29, 25, 1)
              : const Color(0xFF1F2123),
          borderRadius: BorderRadius.circular(45),
        ),
        child: TextButton(
          onPressed: () => widget.onPressed(),
          style: TextButton.styleFrom(
              foregroundColor: Colors.black.withOpacity(0.5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatefulWidget {
  const MainButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.reverse,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final bool reverse;

  @override
  _MainButton createState() => _MainButton();
}

class _MainButton extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        decoration: BoxDecoration(
          // ... your existing code
          color: widget.reverse
              ? const Color(0xFF1F2123)
              : const Color.fromRGBO(13, 50, 111, 1),
          borderRadius: BorderRadius.circular(
              15), // You can adjust this for slight rounding
        ),
        child: TextButton(
          onPressed: () => widget.onPressed(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black.withOpacity(0.5),
          ),
          child: SizedBox(
            width: 105,
            height: 105,
            child: Center(
              child: Text(
                widget.buttonText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
