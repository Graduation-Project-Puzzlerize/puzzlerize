import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:puzzlerize/screens/my_games/my_games.dart';

class QuestionForm extends StatefulWidget {
  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _gameNameController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _choice1Controller = TextEditingController();
  final TextEditingController _choice2Controller = TextEditingController();
  final TextEditingController _choice3Controller = TextEditingController();
  final TextEditingController _choice4Controller = TextEditingController();
  String? _correctAnswer;
  String? _gameName;

  @override
  void dispose() {
    _gameNameController.dispose();
    _questionController.dispose();
    _choice1Controller.dispose();
    _choice2Controller.dispose();
    _choice3Controller.dispose();
    _choice4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Question'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _gameNameController,
                decoration: InputDecoration(labelText: 'Game Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a game name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _questionController,
                decoration: InputDecoration(labelText: 'Question'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a question';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _choice1Controller,
                decoration: InputDecoration(labelText: 'Choice 1'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter choice 1';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _choice2Controller,
                decoration: InputDecoration(labelText: 'Choice 2'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter choice 2';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _choice3Controller,
                decoration: InputDecoration(labelText: 'Choice 3'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter choice 3';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _choice4Controller,
                decoration: InputDecoration(labelText: 'Choice 4'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter choice 4';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _correctAnswer,
                decoration: InputDecoration(labelText: 'Correct Answer'),
                items: [
                  DropdownMenuItem(
                    value: 'choice1',
                    child: Text('Choice 1'),
                  ),
                  DropdownMenuItem(
                    value: 'choice2',
                    child: Text('Choice 2'),
                  ),
                  DropdownMenuItem(
                    value: 'choice3',
                    child: Text('Choice 3'),
                  ),
                  DropdownMenuItem(
                    value: 'choice4',
                    child: Text('Choice 4'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _correctAnswer = value;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please select the correct answer';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addQuestion();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  finishAddingQuestions();
                },
                child: Text('Finish'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addQuestion() {
    final CollectionReference questionsCollection =
        FirebaseFirestore.instance.collection('questions');
    questionsCollection.add({
      'gameName': _gameNameController.text,
      'question': _questionController.text,
      'choices': [
        _choice1Controller.text,
        _choice2Controller.text,
        _choice3Controller.text,
        _choice4Controller.text,
      ],
      'correctAnswer': _correctAnswer,
    }).then((value) {
      // Success, clear the form
      _formKey.currentState!.reset();
      _gameNameController.clear();
      _questionController.clear();
      _choice1Controller.clear();
      _choice2Controller.clear();
      _choice3Controller.clear();
      _choice4Controller.clear();
      _correctAnswer = null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Question added successfully'),
        ),
      );
    }).catchError((error) {
      // Error, display error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add question: $error'),
        ),
      );
    });
  }

  void finishAddingQuestions() {
    // Perform actions when the monitor finishes adding questions
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Finished adding questions'),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => myGames()),
    );
  }
}
