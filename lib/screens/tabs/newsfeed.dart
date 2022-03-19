import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:co_you/mainModel.dart' show ApplicationModel;
import 'package:co_you/model/challenges.dart' show Challenge;
import 'package:co_you/widgets/challenge_card.dart' show ChallengeCard;

class Feed extends StatefulWidget {
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ApplicationModel>(
      builder: (context, child, appModel) {
        List<Widget> challengeCards = appModel.myFeedChallenges.map(
          (Challenge challenge) {
            return ChallengeCard(challenge, 'feed');
          },
        ).toList();

        return ListView(
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: challengeCards,
              ),
            )
          ],
        );
      },
    );
  }
}
