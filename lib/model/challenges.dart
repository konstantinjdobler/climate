import 'users.dart';

class Supporter {
  final User user;
  final double amount;

  const Supporter(
    this.user,
    this.amount,
  );
}

class Challenge {
  final String id;
  final String title;
  final String distance;
  final String description;
  final List<String> tags;
  final User contestant;
  List<Supporter> supporters;
  String proof;
  final int fundingGoal;
  final bool corporate;
  double get raisedAmount {
    if (supporters.isEmpty) {
      return 0.0;
    }
    var supporterAmount = supporters.map((s) => s.amount);

    return supporterAmount.reduce((sum, amount) => sum + amount);
  }

  final DateTime createdAt;
  DateTime finishedAt;

  Challenge({
    this.id,
    this.title,
    this.tags,
    this.contestant,
    this.supporters,
    this.distance,
    this.fundingGoal,
    this.description,
    this.createdAt,
    this.finishedAt,
    this.proof,
    this.corporate = false,
  });
}

List<Challenge> challengeMocks = [
  Challenge(
      id: '123',
      title: 'Calculate your Carbon Footprint',
      distance: 'Corporate Challenge',
      description:
          'SAP challenges YOU!\n\nCalculate your Carbon Footprint for one week. You can use our Product Footprint Management APIs to calculate the footprint of consumer products. Post a photo of your result as proof!',
      fundingGoal: 10,
      supporters: [
        Supporter(userMocks[4], 4),
        Supporter(userMocks[3], 1),
      ],
      contestant: userMocks[7],
      tags: ['SAP challenges YOU!'],
      corporate: true),
  Challenge(
      id: '100',
      title: 'I will go vegan for 10 days',
      distance: 'Potsdam, 10km from you ',
      description:
          'I love meat, but I also would do anything for mother nature ... almost everything, 10 days are max for me. I hope I wan\'t starve!',
      fundingGoal: 40,
      contestant: userMocks[4],
      finishedAt: DateTime.now(),
      supporters: [
        Supporter(userMocks[4], 10),
        Supporter(userMocks[0], 15),
        Supporter(userMocks[2], 15),
      ],
      proof: 'assets/proof-pascal-vegan.jpg',
      tags: ['food', 'environment', 'climate']),
  Challenge(
      id: '123askdfph',
      title: 'Inform my team about environmental sustainibility',
      description:
          'I will hold a public presentation to elaborate how people can become more sustainable in the day-to-day work life.',
      fundingGoal: 2,
      supporters: [
        Supporter(userMocks[1], 2),
      ],
      contestant: userMocks[0],
      tags: ['work', 'awareness']),
  Challenge(
      id: '101',
      title: 'I will fix your bug!',
      distance: 'Berlin, 20 km from you',
      description:
          'You are to embarassed asking your colleagues for help and have spend already hours finding a bug you produced. No problem, I\'m your guy!',
      fundingGoal: 10,
      contestant: userMocks[1],
      supporters: [],
      tags: ['work']),
  Challenge(
      id: '102',
      title: 'I will bike to work for a whole month!',
      distance: 'Berlin, 12 km from you ',
      description: 'Sun or rain ... I will bike to work.',
      fundingGoal: 12,
      contestant: userMocks[4],
      supporters: [
        Supporter(userMocks[1], 2),
        Supporter(userMocks[2], 3),
      ],
      tags: [
        'sport',
        'climate'
      ]),
  Challenge(
      id: '124',
      title: 'I will offset my next year flights',
      description:
          'I fly a lot for my job, so I will personally offset my flying related carbon footprint for a whole year.',
      fundingGoal: 100,
      supporters: [
        Supporter(userMocks[3], 10),
        Supporter(userMocks[7], 50),
      ],
      contestant: userMocks[0],
      finishedAt: DateTime.now(),
      proof: 'assets/proof-celery.jpg',
      tags: ['food', 'funny', 'crazy']),
  Challenge(
      id: 'amkaud',
      title: 'Cold shower',
      distance: 'Berlin, 15km from you',
      description:
          'What is better than a freezing cold shower in the morning to wake up ... and of course for the climate',
      fundingGoal: 10,
      contestant: userMocks[3],
      supporters: [Supporter(userMocks[0], 10)],
      finishedAt: DateTime.now(),
      proof: 'assets/proof-soup.jpg',
      tags: ['voluntary', 'food', 'helping']),
  Challenge(
      id: 'aaaa',
      title: 'I will give out Free Hugs',
      distance: 'Nearby',
      description: 'Becasue everyone needs a hug',
      fundingGoal: 15,
      contestant: userMocks[4],
      supporters: [
        Supporter(userMocks[2], 1),
        Supporter(userMocks[1], 3),
        Supporter(userMocks[3], 11)
      ],
      finishedAt: DateTime.now(),
      tags: ['friendship']),
  Challenge(
      id: '12bbbb4',
      title: 'I will embarass myself in public',
      distance: 'Nearby',
      description: 'this is awesome',
      fundingGoal: 20,
      contestant: userMocks[3],
      supporters: [
        Supporter(userMocks[4], 2),
        Supporter(userMocks[0], 5),
        Supporter(userMocks[1], 10),
      ],
      tags: [
        'funny',
        'crazy'
      ]),
  Challenge(
      id: '123',
      title: 'I WILL JUMP into Griebnitzsee',
      distance: 'Nearby',
      description:
          'I\'ve been hacking all day at the HPI Hackathon and need some refreshment. For 10 bucks I\'ll jump into the Griebnitzsee!!!',
      fundingGoal: 10,
      supporters: [
        Supporter(userMocks[0], 9),
        Supporter(userMocks[4], 1),
      ],
      finishedAt: DateTime.now(),
      proof: 'assets/proof-griebnitz.jpg',
      contestant: userMocks[1],
      tags: ['society']),
];
