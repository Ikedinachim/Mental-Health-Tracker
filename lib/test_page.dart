import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_tracker/result_page.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_tracker/widgets/answer_container.dart';
import 'package:mental_health_tracker/widgets/select_quiz_container.dart';

class TestPage extends StatefulWidget {
  final Stream<Event> stream;
  final String questionKey;

  const TestPage(this.stream, this.questionKey, {Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int pIndex = 0;
  late Map<dynamic, dynamic> questions;
  int totalScore = 0;

  PageController _pageController = new PageController();

  void _selectAnswer(int score) {
    print(widget.questionKey);
    print(score);
    print(pIndex);
    print(questions.length);

    if (pIndex >= questions.length - 1) {
      var day = DateFormat('EEEE').format(DateTime.now());
      final database = FirebaseDatabase.instance;
      database
          .reference()
          .child('/Days of the Week/$day/${widget.questionKey}')
          .set(questions.values.reduce((a, b) => a + b));

      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return ResultPage(
          widget.stream,
          widget.questionKey,
          questions.values.reduce((a, b) => a + b),
          questions.length * 3,
        );
      }));
    }
    questions.keys.toList()[pIndex].toString();
    final firebase = FirebaseDatabase.instance;
    firebase
        .reference()
        .child(
            '/questions/${widget.questionKey}/${questions.keys.toList()[pIndex].toString()}')
        .set(score);

    print('total:' + totalScore.toString());

    _pageController.nextPage(
        duration: Duration(milliseconds: 1), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SafeArea(
        child: StreamBuilder<Event>(
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else {
              print(snapshot.data!.snapshot.value.toString());
              questions = snapshot.data!.snapshot.value;

              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'CHOOSE AN ANSWER!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.26,
                    //width: MediaQuery.of(context).size.height * 0.75,
                    child: PageView.builder(
                        onPageChanged: (value) {
                          pIndex = value;
                        },
                        itemCount: questions.length,
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        allowImplicitScrolling: false,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            //height: MediaQuery.of(context).size.height * 0.25,
                            //width: MediaQuery.of(context).size.width * 0.5,
                            //   decoration: BoxDecoration(
                            // border: Border.all(
                            //     width: 1.5, color: Colors.lightBlue),
                            // borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                questions.keys.toList()[index] + '?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AnswerContainer('Not at All', () {
                    _selectAnswer(0);
                  }),
                  AnswerContainer('Some Days', () => _selectAnswer(1)),
                  AnswerContainer(
                      'More Than Half the Days', () => _selectAnswer(2)),
                  AnswerContainer('Nearly Every Day', () => _selectAnswer(3))
                ],
              );
            }
          },
          stream: widget.stream,
        ),
      ),
    );
  }
}
