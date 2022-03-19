import 'package:flutter/material.dart';
import 'package:co_you/model/challenges.dart' show Challenge;
import 'package:co_you/ui/common/separator.dart';
import 'package:co_you/screens/challenge_detail.dart';
import 'package:co_you/ui/text_style.dart';

class ChallengeSummary extends StatelessWidget {
  final Challenge challenge;
  final String pageId;
  final bool horizontal;

  ChallengeSummary(this.challenge, this.pageId, {this.horizontal = true});

  ChallengeSummary.vertical(this.challenge, this.pageId) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final challengeThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-$pageId-${challenge.id}",
        child: Container(
          height: 92.0,
          width: 92.0,
          child: CircleAvatar(
            backgroundImage: new AssetImage(challenge.contestant.image),
          ),
        ),
      ),
    );

    var fundingText = challenge.corporate
        ? "You will get ${challenge.fundingGoal} 🌳"
        : '${challenge.raisedAmount.toInt()}/${challenge.fundingGoal} 🌳';
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(challenge.title, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new HorizontalSeparator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(fundingText, style: Style.commonTextStyle),
              new Container(
                width: horizontal ? 8.0 : 32.0,
              ),
              new Text(challenge.contestant.role, style: Style.commonTextStyle),
            ],
          ),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: challenge.corporate
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.primary,
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
            ? () {
                Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new DetailPage(
                      challenge: challenge,
                      pageId: pageId,
                    ),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                );
              }
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
              challengeThumbnail,
            ],
          ),
        ));
  }
}
