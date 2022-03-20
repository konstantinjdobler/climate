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
    this.distance = "",
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
      description:
          'SAP challenges YOU!\n\nCalculate your Carbon Footprint for one week. You can use our Product Footprint Management APIs to calculate the footprint of consumer products. Post a photo of your result as proof!',
      fundingGoal: 10,
      supporters: [
        Supporter(userCollection[4], 4),
        Supporter(userCollection[3], 1),
      ],
      contestant: userCollection[7],
      tags: ['SAP challenges YOU!'],
      corporate: true),
  Challenge(
      id: '100',
      title: 'I will go vegan for 10 days',
      description:
          'I love meat, but I also would do anything for mother nature ... almost everything, 10 days are max for me. I hope I wan\'t starve!',
      fundingGoal: 40,
      contestant: userCollection[4],
      finishedAt: DateTime.now(),
      supporters: [
        Supporter(userCollection[4], 10),
        Supporter(userCollection[0], 15),
        Supporter(userCollection[2], 15),
      ],
      proof: 'assets/proof-pascal-vegan.jpg',
      tags: ['food', 'environment', 'climate']),
  Challenge(
      id: '101',
      title: 'I will fix your bug!',
      description:
          'You are to embarassed asking your colleagues for help and have spend already hours finding a bug you produced. No problem, I\'m your guy!',
      fundingGoal: 10,
      contestant: userCollection[1],
      supporters: [],
      tags: ['work']),
  Challenge(
      id: '102',
      title: 'I will bike to work for a whole month!',
      description: 'Sun or rain ... I will bike to work.',
      fundingGoal: 12,
      contestant: userCollection[4],
      supporters: [
        Supporter(userCollection[1], 2),
        Supporter(userCollection[2], 3),
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
        Supporter(userCollection[3], 10),
        Supporter(userCollection[7], 50),
      ],
      contestant: userCollection[0],
      // finishedAt: DateTime.now(),
      // proof: 'assets/proof-celery.jpg',
      tags: ['climate', 'environment']),
  Challenge(
      id: 'amkaud',
      title: 'Cold shower in the morning',
      description:
          'What is better than a freezing cold shower in the morning to wake up ... and of course for the climate',
      fundingGoal: 10,
      contestant: userCollection[3],
      supporters: [Supporter(userCollection[0], 10)],
      finishedAt: DateTime.now(),
      tags: ['climate']),
  Challenge(
      id: 'aaaa',
      title: 'I will give out Free Hugs',
      description: 'Because everyone needs a hug',
      fundingGoal: 15,
      contestant: userCollection[4],
      supporters: [
        Supporter(userCollection[2], 1),
        Supporter(userCollection[1], 3),
        Supporter(userCollection[3], 11)
      ],
      finishedAt: DateTime.now(),
      tags: ['friendship']),
  Challenge(
      id: '12bbbb4',
      title: 'I will run a marathon',
      description: 'This is awesome. Why not?',
      fundingGoal: 20,
      contestant: userCollection[6],
      supporters: [
        Supporter(userCollection[4], 2),
        Supporter(userCollection[0], 5),
        Supporter(userCollection[1], 10),
      ],
      tags: [
        'sports',
        'personal goals'
      ]),
  Challenge(
      id: '123',
      title: 'I WILL JUMP into Griebnitzsee',
      description:
          'I\'ve been hacking all day at the HPI Hackathon and need some refreshment. For 10 bucks I\'ll jump into the Griebnitzsee!!!',
      fundingGoal: 10,
      supporters: [
        Supporter(userCollection[0], 9),
        Supporter(userCollection[4], 1),
      ],
      finishedAt: DateTime.now(),
      proof: 'assets/proof-griebnitz.jpg',
      contestant: userCollection[1],
      tags: ['society']),
  Challenge(
      id: 'aasssaa',
      title: 'Name a product, I\'ll give you a climate-friendly alternative',
      description:
          'I strongly believe we can be sustainable if we just have the will to do so',
      fundingGoal: 15,
      contestant: userCollection[6],
      supporters: [
        Supporter(userCollection[1], 3),
        Supporter(userCollection[3], 11)
      ],
      tags: [
        'climate',
        'awareness'
      ]),
  Challenge(
      id: 'aasssaa',
      title: 'Zero food waste for a week',
      description: 'We need to be conscious of our resource usage',
      fundingGoal: 12,
      contestant: userCollection[5],
      supporters: [
        Supporter(userCollection[1], 3),
        Supporter(userCollection[3], 4)
      ],
      tags: [
        'food',
        'awareness'
      ]),
  Challenge(
      id: '123askdfph',
      title: 'Hold a presentation for climate awareness',
      description:
          'I challenge you hold a presentation in public to elaborate how people can become more sustainable in the day-to-day work life. Let\'s change the minds of people to enable a greener future!',
      fundingGoal: 4,
      supporters: [],
      contestant: userCollection[4],
      corporate: true,
      tags: ['Challenge for YOU', 'awareness']),
];
