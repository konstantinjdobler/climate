import 'package:flutter/material.dart';
import 'package:co_you/model/challenges.dart';
import 'package:co_you/screens/challenge_detail.dart';
import 'package:co_you/ui/text_style.dart';
import 'package:flutter_tags/flutter_tags.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;
  final String pageId;
  final bool horizontal;

  ChallengeCard(this.challenge, this.pageId, {this.horizontal = true});

  ChallengeCard.vertical(this.challenge, this.pageId) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 31.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-$pageId-${challenge.id}",
        child: Container(
          height: 60.0,
          width: 60.0,
          child: CircleAvatar(
            backgroundImage: new AssetImage(challenge.contestant.image),
          ),
        ),
      ),
    );

    Color getColor() {
      var challengeColor = challenge.corporate
          ? Theme.of(context).colorScheme.tertiary
          : Theme.of(context).colorScheme.primary;
      return challenge.finishedAt == null
          ? challengeColor
          : Theme.of(context).colorScheme.secondary;
    }

    var fundingText = challenge.corporate
        ? "You will get ${challenge.fundingGoal} saplings"
        : '${challenge.raisedAmount.toInt()} / ${challenge.fundingGoal} saplings raised';
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 46.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Text(fundingText, style: Style.commonTextStyle),
          new Container(height: 4.0),
          new Text(challenge.title, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(challenge.contestant.role, style: Style.commonTextStyle),
          new Padding(padding: EdgeInsets.all(5)),
          new Tags(
            itemCount: challenge.tags.length,
            itemBuilder: (int idx) {
              return ItemTags(
                index: idx,
                title: challenge.tags[idx],
                active: false,
                pressEnabled: false,
              );
            },
            columns: challenge.tags.length,
            symmetry: false,
          ),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: horizontal ? 170.0 : 210.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 25.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: getColor(),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new DetailPage(
                      challenge: challenge,
                      pageId: pageId,
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            new FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          ),
        ));
  }
}
