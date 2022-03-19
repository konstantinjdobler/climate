import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:co_you/mainModel.dart' show ApplicationModel;
import 'package:co_you/widgets/challenge_card.dart' show ChallengeCard;
import 'package:co_you/model/challenges.dart' show Challenge;

class MySupportedChallenges extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ApplicationModel>(
      builder: (context, child, appModel) {
        List<Widget> myOpenChallengeWidgets = appModel
            .myActiveSupportedChallenges
            .map((Challenge challenge) => ChallengeCard(challenge, 'others'))
            .toList();

        List<Widget> myCompletedChallengeWidgets = appModel
            .myCompletedSupportedChallenges
            .map((Challenge challenge) => ChallengeCard(challenge, 'others'))
            .toList();

        return ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  ...myOpenChallengeWidgets,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  ...myCompletedChallengeWidgets,
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
