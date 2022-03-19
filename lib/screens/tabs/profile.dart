import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:co_you/mainModel.dart' show ApplicationModel;
import 'package:co_you/model/projects.dart' show projectMocks, Project;
import 'package:co_you/utils/url.dart' show openMap;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    ApplicationModel model = ScopedModel.of<ApplicationModel>(context);
    List<ListTile> supportedProjectTiles =
        model.currentUser.supportedProjects.map((Project p) {
      return ListTile(
        title: Text(p.name),
        leading: Container(
            width: 40.0,
            height: 40.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(p.image)))),
      );
    }).toList();

    List<ListTile> leaderboardTiles = [
      ListTile(
          title: Text("Rebecca"),
          leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/first_place.jpg')))),
          trailing: Text("108 🌳")),
      ListTile(
          title: Text("Konstantin",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/second_place.jpg')))),
          trailing: Text("91 🌳")),
      ListTile(
          title: Text("Henrik"),
          leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/third_place.jpg')))),
          trailing: Text("87 🌳"))
    ];

    List<ListTile> teamLeaderboardTiles = [
      ListTile(
          title: Text("Spotlight",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/first_place.jpg')))),
          trailing: Text("312 🌳")),
      ListTile(
          title: Text("Strategic Projects Team"),
          leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/second_place.jpg')))),
          trailing: Text("266 🌳")),
      ListTile(
          title: Text("Corona-Warn App"),
          leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/third_place.jpg')))),
          trailing: Text("241 🌳"))
    ];

    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                model.currentUser.image,
                height: 280,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  child: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 50.0,
                width: 1000.0,
                color: Colors.white70,
                margin: EdgeInsets.only(top: 230.0),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 230.0, left: 18),
                  child: Text(model.currentUser.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3f6184),
                          fontSize: 40))),
            ],
          ),
          SizedBox(height: 10),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.tree),
            title: Text("12 🌳"),
            subtitle: Text('Balance'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              '${model.currentUser.country}, ${model.currentUser.city}',
            ),
            subtitle: Text(model.currentUser.address),
            onTap: () {
              openMap(model.currentUser.address, model.currentUser.city,
                  model.currentUser.country);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.format_list_numbered),
            title: Text('14 (3 Supports, 18 🌳)'),
            subtitle: Text('Supporter Rank'),
          ),
          ListTile(
            leading: Icon(Icons.format_list_numbered),
            title: Text('2 (7 Challenges, 73 🌳)'),
            subtitle: Text('Challenger Rank'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.store),
            title: Text(
              'Your supported Projects',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: supportedProjectTiles,
            ),
          ),
          Divider(),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.trophy),
            title: Text(
              'Individual Leaderboard',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: leaderboardTiles,
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.trophy),
            title: Text(
              'Team Leaderboard',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: teamLeaderboardTiles,
            ),
          ),
        ],
      ),
    );
  }
}
