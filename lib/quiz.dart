import 'package:flutter/material.dart';
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

  @override
  Widget build(context) {

    //using if-else approach : rendering widget
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen')
    {
      screenWidget = const QuestionsScreen();
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