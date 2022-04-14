class Quiz {
  final int id, answer;
  final String quiz, ask;
  final List<String> optional;

  Quiz({this.id, this.quiz, this.ask, this.optional, this.answer});
}

const List quiz_exam = [
  {
    'id': 1,
    'quiz': 'assets/fullshoes.png',
    'ask': 'Which shoes are not local Indonesian brands?',
    'optional': [
      'assets/shoes.png',
      'assets/shoes2.png',
      'assets/shoes3.png',
      'assets/shoes5.png',
    ],
    'answer': 0,
  },
  {
    'id': 2,
    'quiz': 'assets/fulltshirt.png',
    'ask': 'Which T-shirt are not local Indonesian brands?',
    'optional': [
      'assets/tshirt.png',
      'assets/tshirt2.png',
      'assets/tshirt3.png',
      'assets/tshirt4.png',
    ],
    'answer': 1,
  },
  {
    'id': 3,
    'quiz': 'assets/fullball.png',
    'ask': 'Which ball is not included in football?',
    'optional': [
      'assets/ball.png',
      'assets/ball2.png',
      'assets/ball3.png',
      'assets/ball4.png',
    ],
    'answer': 2,
  },
  {
    'id': 4,
    'quiz': 'assets/fullhp.png',
    'ask': 'Choose a handphone that is not an apple brand?',
    'optional': [
      'assets/hp.png',
      'assets/hp2.png',
      'assets/hp3.png',
      'assets/hp4.png',
    ],
    'answer': 0,
  },
  {
    'id': 5,
    'quiz': 'assets/fullmedia.png',
    'ask': 'Which does not include social media logos?',
    'optional': [
      'assets/media.png',
      'assets/media2.png',
      'assets/media3.png',
      'assets/media4.png',
    ],
    'answer': 0,
  },
];
