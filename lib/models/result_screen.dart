import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/questions_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.choosenAnswer,required this.onRestart,});

  //pass the list as arg
  final List<String> choosenAnswer;
  final VoidCallback onRestart; 

  //list of answer choosen by user
  //list down the summary using map as key pair value
  //here in map the key is of string type while values are of object type 
  List<Map<String, Object>> getSummaryData()
  {
    final  List<Map<String, Object>> summary = [];

    for(var i = 0; i< choosenAnswer.length; i++)
    {
      //loop body : to add items in the summary[] list.
      //{} in .add() is the way in dart for Map<>
      summary.add({
        // add key value pair only if of key as string and value as object
        'question_index': i,
        //take question from list of questions in question.dart i for itteration and .text to store the text of question
        'question':questions[i].text,

        'correct_answer':questions[i].answers[0],
        'user_answer': choosenAnswer[i],
       });
     }
    return summary;
  }

  //override build method of statelesswidget
  @override
  Widget build( context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      //choose from the map return only if values match
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
       width: double.infinity,
       height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
    
           child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Container(
                padding: const EdgeInsets.only(top: 45),
                child: Text(
                  'You Answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 25,),
             Expanded(
               child: QuestionsSummary(summaryData: summaryData),
             ),
              const SizedBox(height:25,),

             TextButton(
              onPressed: onRestart,
              style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 211, 48, 102), 
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
              ),
              child: Text(
              'Restart Quiz!',
              style: TextStyle(
              color: Colors.white, // text color
              fontSize: 16, // adjust size as needed
              ),
            ),
          ) 
        ],
      ),
    ),
    );
   
  }
}