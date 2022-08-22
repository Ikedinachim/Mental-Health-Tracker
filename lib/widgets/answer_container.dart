import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_tracker/test_page.dart';

class AnswerContainer extends StatelessWidget {
  final String content;
  final Function function;

  const AnswerContainer(this.content, this.function, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.lightBlue),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.70,
        child: Center(
          child: Text(
            content,
            style: GoogleFonts.nunitoSans(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
