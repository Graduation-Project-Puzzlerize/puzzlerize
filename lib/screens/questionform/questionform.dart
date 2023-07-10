import 'package:flutter/material.dart';
import 'package:puzzlerize/services/database.dart';
import 'package:puzzlerize/screens/generate/generate.dart';

class QuestionForm extends StatefulWidget {
  final String mentor_id;
  QuestionForm({required this.mentor_id});
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
                    value: '1',
                    child: Text('Choice 1'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Choice 2'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('Choice 3'),
                  ),
                  DropdownMenuItem(
                    value: '4',
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    DatabaseMethods().addQuestion(
                        _questionController.text,
                        _choice1Controller.text,
                        _choice2Controller.text,
                        _choice3Controller.text,
                        _choice4Controller.text,
                        _correctAnswer,
                        widget.mentor_id);
                  }
                  _formKey.currentState!.reset();
                  _gameNameController.clear();
                  _questionController.clear();
                  _choice1Controller.clear();
                  _choice2Controller.clear();
                  _choice3Controller.clear();
                  _choice4Controller.clear();
                  _correctAnswer = null;
                },
                child: Text('Submit'),
              ),
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

  void finishAddingQuestions() async {
    // Perform actions when the monitor finishes adding questions
    if (await DatabaseMethods().isThereAnyQuesions(widget.mentor_id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Finished adding questions'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Generate(mentor_id: widget.mentor_id)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('There is no questions added, please add at least one'),
        ),
      );
    }
  }
}
