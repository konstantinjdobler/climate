import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:io';

import 'package:co_you/mainModel.dart' show ApplicationModel;
import 'package:co_you/model/challenges.dart' show Challenge, Supporter;
import 'package:co_you/model/projects.dart' show Project;
import 'package:co_you/widgets/challenge_summary.dart' show ChallengeSummary;
import 'package:co_you/ui/common/separator.dart';
import 'package:co_you/ui/text_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatefulWidget {
  final Challenge challenge;
  final String pageId;
  DetailPage({Key key, this.challenge, this.pageId}) : super(key: key);
  DetailPageState createState() => DetailPageState(challenge, pageId);
}

class DetailPageState extends State<DetailPage> {
  final Challenge challenge;
  final String pageId;
  TextEditingController _amountController = TextEditingController();
  String _selectedProjectId;

  DetailPageState(this.challenge, this.pageId);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ApplicationModel>(
        builder: (context, child, appModel) {
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                _showShareDialog(context);
              },
            ),
          ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          color: Theme.of(context).colorScheme.background,
          child: Stack(
            children: <Widget>[
              _getBackground(),
              _getGradient(context),
              _getContent(),
            ],
          ),
        ),
        persistentFooterButtons: [
          _getPersistentFooterButton(appModel),
        ],
      );
    });
  }

  void _showCompleteDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return CompleteDialog(
            challenge: challenge,
          );
        },
        fullscreenDialog: true,
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
                'Choose a Platform to share ${challenge.contestant.name}\'s challenge'),
            content: Container(
              child: Row(
                children: <Widget>[
                  Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  new AssetImage("assets/shareLogos/fb.png")))),
                  Spacer(),
                  Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage(
                                  "assets/shareLogos/insta.png")))),
                  Spacer(),
                  Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage(
                                  "assets/shareLogos/twitter.png")))),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Share'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _showAlertDialog(BuildContext context) {
    ApplicationModel model = ScopedModel.of<ApplicationModel>(context);
    List<Project> projects = model.currentUser.supportedProjects;
    _amountController = TextEditingController();
    _selectedProjectId = projects[0].id;
    List<Widget> projectWidgets = projects.map((Project project) {
      return RadioListTile(
        groupValue: _selectedProjectId,
        title: Text(project.name),
        value: project.id,
        onChanged: (val) {
          setState(() {
            _selectedProjectId = val;
          });
        },
      );
    }).toList();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Support ${challenge.contestant.name}\'s challenge'),
            content: Column(
              children: <Widget>[
                Text('1. Select a project to which you want to donate.'),
                ...projectWidgets,
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                    '2. Select the amount to support ${challenge.contestant.name}\'s challenge with.'),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(
                      hintText: 'Number of saplings', suffixText: ' 🌳'),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Support'),
                onPressed: () {
                  model.supportChallenge(
                    challenge.id,
                    double.parse(_amountController.text),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget _getPersistentFooterButton(ApplicationModel appModel) {
    IconData icon = Icons.play_arrow;
    FaIcon fa_icon;
    String buttonText = '';
    var buttonFunction;
    RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    );

    if (challenge.contestant == appModel.currentUser || challenge.corporate) {
      if (challenge.finishedAt != null) {
        buttonText = 'Finished';
        icon = Icons.check;
      } else {
        buttonText = 'Finish this Challenge';
        buttonFunction = () => _showCompleteDialog(context);
      }
    } else {
      if (challenge.supporters
          .map((Supporter supporter) => supporter.user)
          .contains(appModel.currentUser)) {
        buttonText = 'You are a Supporter';
        icon = Icons.check;
      } else {
        buttonText = 'Support now  ';
        fa_icon = FaIcon(FontAwesomeIcons.tree, color: Colors.green[800]);
        buttonFunction = () => _showAlertDialog(context);
      }
    }
    return FlatButton(
      child: Row(
        children: <Widget>[
          Text(buttonText),
          (fa_icon != null ? fa_icon : Icon(icon)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      onPressed: buttonFunction,
    );
  }

  Container _getBackground() {
    return Container(
      color: Theme.of(context).colorScheme.background,
      height: 300.0,
      constraints: BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }

  List<Widget> _getProofSection() {
    if (challenge.finishedAt == null) {
      return [
        Text(
          'After I am done you will see my proof here!',
          style: Style.commonTextStyle,
        ),
      ];
    }
    return [
      Text(
        'A big thanks to all my supporters!',
        style: Style.commonTextStyle,
      ),
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Image.asset(
          challenge.proof,
        ),
      ),
    ];
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          ChallengeSummary(
            challenge,
            pageId,
            horizontal: false,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                HorizontalSeparator(),
                Text(
                  challenge.description,
                  style: Style.commonTextStyle,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                Text(
                  'Proof',
                  style: Style.headerTextStyle,
                ),
                HorizontalSeparator(),
                ..._getProofSection()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompleteDialog extends StatefulWidget {
  final Challenge challenge;
  CompleteDialog({Key key, this.challenge}) : super(key: key);

  CompleteDialogState createState() => CompleteDialogState(challenge);
}

class CompleteDialogState extends State<CompleteDialog> {
  final Challenge challenge;
  XFile cameraFile;

  CompleteDialogState(this.challenge);

  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('Complete your Challenge'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: ScopedModelDescendant<ApplicationModel>(
                builder: (context, child, appModel) {
                  return Column(
                    children: <Widget>[
                      Text(
                        'Title',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${challenge.title}',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${challenge.description}',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      Text(
                        'Awesome ${challenge.contestant.name}! Good job for finishing the Challenge. To make your supporters laugh upload of picture of yourself while doing the challenge!',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      _imageButton(context),
                      cameraFile != null
                          ? RaisedButton(
                              child: Text('Complete now!'),
                              color: Theme.of(context).colorScheme.primary,
                              textColor: Colors.white,
                              onPressed: () {
                                appModel.finishChallenge(
                                    challenge.id, cameraFile.path);
                                Navigator.of(context).pop();
                              },
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: 0),
                            ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _imageButton(BuildContext context) {
    if (cameraFile == null) {
      return RaisedButton(
        child: Text('Add image'),
        color: Theme.of(context).colorScheme.primary,
        textColor: Colors.white,
        onPressed: () => _showImageAddSheet(),
      );
    }
    return Image.asset(
      cameraFile.path,
    );
  }

  void _addPictureCamera() async {
    var picker = ImagePicker();
    cameraFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {});
  }

  void _addPictureGallery() async {
    var picker = ImagePicker();
    cameraFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {});
  }

  Widget _showImageAddSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: new Text('Kamera'),
                    onTap: () {
                      Navigator.of(context).pop();
                      return _addPictureCamera();
                    }),
                new ListTile(
                  leading: Icon(Icons.photo_library),
                  title: new Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    return _addPictureGallery();
                  },
                ),
                new ListTile(
                  leading: Icon(Icons.close),
                  title: new Text('Abbrechen'),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        });
  }
}
