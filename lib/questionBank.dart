import 'package:quizzler/question.dart';

class Quiz {
  int _questionNumber = 0;

  // List of questions
  List<Question> _questionBank = [
    Question(
        questionText: 'Some cats are actually allergic to humans', ans: true),
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        ans: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        ans: true),
    Question(questionText: 'A slug\'s blood is green.', ans: true),
    Question(
        questionText: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        ans: true),
    Question(
        questionText: 'It is illegal to pee in the Ocean in Portugal.',
        ans: true),
    Question(
        questionText:
            'No piece of square dry paper can be folded in half more than 7 times.',
        ans: false),
    Question(
        questionText:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        ans: true),
    Question(
        questionText:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        ans: false),
    Question(
        questionText:
            'The total surface area of two human lungs is approximately 70 square metres.',
        ans: true),
    Question(
        questionText: 'Google was originally called \"Backrub\".', ans: true),
    Question(
        questionText:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        ans: true),
    Question(
        questionText:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        ans: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  int getQuestionCurrentNumber() {
    return _questionNumber+1;
  }

  int getTotalQuestionNumber() {
    return _questionBank.length;
  }

  String getQuestionText() {
    return _questionBank[this._questionNumber].questionText;
  }

  bool getQuestionAns() {
    return _questionBank[this._questionNumber].ans;
  }
}
