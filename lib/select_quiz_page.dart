import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_tracker/widgets/select_quiz_container.dart';

class SelectQuizPage extends StatelessWidget {
  const SelectQuizPage({Key? key}) : super(key: key);
  static const String pageName = '/selectQuizPage';

  Stream<Event> getQuestions(String type) {
    final firebaseDatabase = FirebaseDatabase.instance;
    return firebaseDatabase.reference().child('/questions/$type').onValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'SELECT A TEST NOW!',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 150,
              ),
              SelectQuizContainer(
                  'Anxiety Test', getQuestions('Anxiety'), 'Anxiety'),
              SelectQuizContainer(
                  'Depression Test', getQuestions('Depression'), 'Depression'),
              SelectQuizContainer('Sleep Disorder Test',
                  getQuestions('Sleep Disorder'), 'Sleep Disorder'),
              SelectQuizContainer('Social Dysfuntion Test',
                  getQuestions('Social Dysfunction'), 'Social Dysfunction')
            ],
          ),
        ),
      ),
    );
  }
}
