import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget
{
  //this.startQuiz is a fun that will store the argument or value pass to StartScreen (like setState etc.)
  //we did this as positional argument so we can access it inside the button widget
  const StartScreen(this.startQuiz,{super.key});  

final void Function() startQuiz;
    @override
  Widget build(context)
   {

      return Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              Image.asset('lib/assets/images/quiz-logo.png', 
              width: 300,
              color: const Color.fromARGB(166, 255, 255, 255),
              ),

             const SizedBox(height: 80 ),

             const  Text(
              'Quiz it like you mean it!',
             style: TextStyle(
             color: Colors.white,
             fontSize: 24,
             fontFamily: 'Roboto',
             ),
             ),

             const SizedBox(height: 30 ),
            
            OutlinedButton.icon(
              onPressed: startQuiz,
            
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: const Color.fromARGB(255, 252, 252, 252),
                  width: 2,
                  ),
              ),

              icon: Icon(Icons.arrow_right_alt),
              label: Text('Start Quiz'),

              ),
          ],
        ),
        );
   }
}