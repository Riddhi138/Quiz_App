import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  
  final List<Map<String, Object>> summaryData;
  
  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
        //.map is used to convert the list to widget as children of Coloumn widget req. to return Widget compulsory
        children: summaryData.map((data) {
          //we generate list of row that generate various pieces of info
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // we defined type casted the value of question_index as int and for Text Widget whole value to String
            Container(
             width: 30,
             height: 30,
             margin: EdgeInsets.only(left: 5), 
             decoration: BoxDecoration(
             color: Colors.blue, // or any color you want
             shape: BoxShape.circle,
            ),

            child: Center(
            child: Text(
            ((data['question_index'] as int) + 1).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            ),
            ),

              const SizedBox(width: 12),
              //add coloumn() to display choosen answer and correct answer
              //Expanded Widget allowschild widget to take place available along the main axis in short a flex widget
              //Means The child in expanded widget can,t take space or width more than a Row here (return Row)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['question'] as String,
                    style: TextStyle(color: const Color.fromARGB(244, 224, 221, 69)),
                    
                    ),
                    const SizedBox(height: 12),
                    Text(
                      data['user_answer'] as String,
                      style: TextStyle(color: const Color.fromARGB(207, 159, 212, 255)),
                    ), //for selected answers
                    Text(
                      data['correct_answer'] as String,
                      style: TextStyle(color: const Color.fromARGB(213, 255, 255, 255)),
                      ), //for correct answer
                     const SizedBox(height: 12),
                  ],
                ),
              )
            ],
          );
        }).toList(),
        //.toList because Map return itterable object so using this we convert it to list
      )),
    );
  }
}