import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/result_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget
{
  const Quiz({super.key});
    @override

    State <Quiz> createState()
    {
      return _QuizState();
    } 
  
}

class _QuizState extends State<Quiz>
{
   List<String> selectedAnswers = [];   //list for choosen answers

  //using ternary operators
  var activeScreen = 'start-screen';

  // using initState 
  /*
  Widget ? activeScreen ;      //activeScreen can be null so we added ? ; we are adding many differ. widget in activeScreen

//initState method is created because the var activeScreen and the fun. setState() were created on same time

@override
  void initState() {          //executed first before MarterialApp() widget
    super.initState();  
    activeScreen = StartScreen(switchScreen);
  }
  */


  void switchScreen()
  {
      setState(() {
         activeScreen = 'question-screen';   //using ternary operators or if-else
        //activeScreen = const QuestionsScreen();  //using initState
      }
      );
  }

  void choosenAnswers (String answer){    //add to the list of selectedAnswer when user choose option
    selectedAnswers.add(answer);
    
     //when the list of question is over & switch to next screen
    if(selectedAnswers.length == questions.length)             
    {
        setState(() {
          activeScreen = 'result-screen';
        });
    }
    
  }

  void restartQuiz() {
  setState(() {
    selectedAnswers = []; // clear the answers
    activeScreen = 'question-screen'; // go back to questions
  });
}

  @override
  Widget build(context) {

    //using if-else approach : rendering widget
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen')
    {
      screenWidget = QuestionsScreen(onSelectedAnswer: choosenAnswers,);
    }

    if(activeScreen == 'result-screen')       //displaying the answer choosen by user
    {
      screenWidget = ResultScreen(choosenAnswer: selectedAnswers, onRestart: restartQuiz, );   //we already have list of answer choosen pass it as value
      
    }

    return 
    MaterialApp(
    home: Scaffold(
      body:  Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:
             [
                   Color.fromARGB(255, 11, 38, 85),
                   Color.fromARGB(255, 36, 105, 161),
             ] ,
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
            )
        ),

        //using if-else approach
        child: screenWidget,

/*        //using ternary operator
            child: activeScreen =='start-screen' 
            ? StartScreen(switchScreen)
           : const QuestionsScreen(),

           //child: activeScreen,   //using initState
*/
          
        ),
    ),
    );

  }

}