import 'package:flutter/material.dart';
import 'package:mega_hack_app/presentation/screens/home_screen.dart';
import 'package:mega_hack_app/presentation/theme/app_fonts.dart';

class CustomDialogAlert extends StatelessWidget {
  const CustomDialogAlert({super.key, this.isLight = false});

  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 327,
      child: AlertDialog(
        backgroundColor: const Color(0xff1A1A1A),
        contentPadding: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: const SizedBox(
          width: 320,
          child: Text(
            'Заявка отправлена',
            style: AppFonts.s14w500,
          ),
        ),
        actions: [
          SizedBox(
            height: 42,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  backgroundColor: const Color(0xFFAA2920),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text(
                'Ок',
                style: AppFonts.s14w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
