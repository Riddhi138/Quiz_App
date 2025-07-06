import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget
{
  const AnswerButton({super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function () onTap;
  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton
            (
               style: ElevatedButton.styleFrom(
               backgroundColor: const Color.fromARGB(255, 158, 212, 255), // Background color
               padding:EdgeInsets.all(15.0),
               side: BorderSide(color: const Color.fromARGB(255, 9, 56, 158), width: 2.0),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
               minimumSize: Size(300, 40),
               ),
              onPressed: onTap,
              child: Text(
                answerText, 
                style: 
                GoogleFonts.workSans(
                fontSize: 18,
                color: const Color.fromARGB(255, 0, 0, 0),   
                ),

                textAlign: TextAlign.center,
                ),
                 
            ),
    );
        
  }
}