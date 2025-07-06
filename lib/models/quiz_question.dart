class QuizQuestion {
  const QuizQuestion(this.text,this.answers);
final String text;
final List<String> answers;

List <String> getShuffledAnswers()
{
  final shuffledList = List.of(answers);
  shuffledList.shuffle();          // it will return the shuffled list wihtout touching the orignal list
  return shuffledList;
}
}