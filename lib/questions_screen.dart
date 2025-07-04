import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget
{
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState ()
  {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen>
{
  @override
  Widget build(context) {
    return Text('Quiz Questions');
  }
}