import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget
{
  const QuestionsScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer ;

  @override
  State<QuestionsScreen> createState ()
  {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen>
{
  var currentQuestionIndex = 0;    //managing the questions after button click
  void answeredQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex ++;
    });
  }


  @override
  Widget build(context) {
  
    final currentQuestion = questions[currentQuestionIndex];
    return  Center(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lora(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 139, 189, 255),
              ),
              textAlign: TextAlign.center,
            ),
           const SizedBox(height: 30),
        
           ...currentQuestion.getShuffledAnswers().map((item) 
           {
              return AnswerButton(
                answerText: item, 
                onTap: () {
                  answeredQuestion(item);
                }
              );
           }
        
           ),
          ],
        ),
      ),
    );
  }
}