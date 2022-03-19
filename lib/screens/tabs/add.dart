import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:co_you/model/challenges.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:co_you/mainModel.dart' show ApplicationModel;

class Add extends StatefulWidget {
  AddState createState() => AddState();
}

class AddState extends State<Add> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _untilController = TextEditingController();

  FocusNode _titleFocusNode = FocusNode();
  FocusNode _descriptionFocusNode = FocusNode();
  FocusNode _amountFocusNode = FocusNode();
  FocusNode _untilFocusNode = FocusNode();

  List<ItemTags> _tags = [
    ItemTags(index: 0, title: 'climate', active: false),
    ItemTags(index: 1, title: 'environment', active: false),
    ItemTags(index: 2, title: 'funny', active: false),
    ItemTags(index: 3, title: 'food', active: false),
    ItemTags(index: 4, title: 'work', active: false),
    ItemTags(index: 5, title: 'sports', active: false),
    ItemTags(index: 6, title: 'discomfort', active: false),
    ItemTags(index: 7, title: 'personal goals', active: false),
    ItemTags(index: 8, title: 'society', active: false),
    ItemTags(index: 9, title: 'family', active: false),
    ItemTags(index: 10, title: 'friends', active: false),
    ItemTags(index: 11, title: 'awareness', active: false),
  ];

  double _marginBetweenWidgets = 12;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Challenge'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              focusNode: _titleFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) {
                _fieldFocusChange(
                    context, _titleFocusNode, _descriptionFocusNode);
              },
              decoration: InputDecoration(labelText: 'Challenge Title'),
            ),
            SizedBox(height: _marginBetweenWidgets),
            TextFormField(
              controller: _descriptionController,
              focusNode: _descriptionFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (term) {
                _fieldFocusChange(
                    context, _descriptionFocusNode, _untilFocusNode);
              },
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: _marginBetweenWidgets),
            TextFormField(
              // TODO: this should become a Datepicker instead of a normal textfield
              controller: _untilController,
              focusNode: _untilFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _untilFocusNode, _amountFocusNode);
              },
              decoration: InputDecoration(labelText: 'Until'),
            ),
            SizedBox(height: _marginBetweenWidgets),
            TextFormField(
              controller: _amountController,
              focusNode: _amountFocusNode,
              textInputAction: TextInputAction.done,
              decoration:
                  InputDecoration(labelText: 'Amount', suffixText: ' 🌳'),
            ),
            SizedBox(height: _marginBetweenWidgets * 1.5),
            Text('Tags'),
            SizedBox(height: _marginBetweenWidgets),
            Tags(
              itemCount: _tags.length,
              itemBuilder: (int idx) {
                return _tags[idx];
              },
              // tags: _tags,
              // backgroundContainer: Color(0xfffafafa),
              columns: 5, // default 4
              symmetry: false, // default false
            ),
            SizedBox(height: _marginBetweenWidgets * 1.5),
            ElevatedButton(
              child: Text('Do It!'),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                  textStyle: TextStyle(color: Colors.white)),
              onPressed: () => _submitChallenge(context),
            ),
            SizedBox(height: _marginBetweenWidgets * 1.5),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
              size: 50.0,
            ),
            Text('Scroll down for some inspiration',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets * 5),
            Text('Plant a tree',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets),
            Text('Become a vegan for a weeek',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets),
            Text('Leave your car at home and bike',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets),
            Text('Read a book about climate change',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets),
            Text('Do something crazy and leave your comfort zone',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  void _submitChallenge(BuildContext context) {
    ApplicationModel model = ScopedModel.of<ApplicationModel>(context);
    model.addChallenge(Challenge(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        distance: 'Nearby',
        description: _descriptionController.text,
        fundingGoal: int.parse(_amountController.text),
        contestant: model.currentUser,
        supporters: [],
        tags:
            _tags.where((tag) => tag.active).map((tag) => tag.title).toList()));
    Navigator.pop(context);
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
