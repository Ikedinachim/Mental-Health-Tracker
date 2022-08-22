import 'package:flutter/material.dart';
import 'package:mental_health_tracker/result_text.dart';

class ResultTextContainer extends StatelessWidget {
  final int score;
  final String questionKey;
  const ResultTextContainer(this.score, this.questionKey, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (score < 10 && questionKey == 'Depression')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.minimalDepression.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.minimalDepression.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 15 && questionKey == 'Depression')
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: '${ResultText.moderateDepression.title}\n',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: ResultText.moderateDepression.content,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ]))
        else if (score < 20 && questionKey == 'Depression')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.moderateSevereDepression.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.moderateSevereDepression.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 34 && questionKey == 'Depression')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.severeDepression.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.severeDepression.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 7 && questionKey == 'Anxiety')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.minimalAnxiety.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.minimalAnxiety.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 15 && questionKey == 'Anxiety')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.moderateAnxiety.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.moderateAnxiety.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 34 && questionKey == 'Anxiety')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.severeAnxiety.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.severeAnxiety.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 10 && questionKey == 'Sleep Disorder')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.minimalSleepDisorder.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.minimalSleepDisorder.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 15 && questionKey == 'Sleep Disorder')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.mildSleepDisorder.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.mildSleepDisorder.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 20 && questionKey == 'Sleep Disorder')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.moderateSleepDisorder.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.moderateSleepDisorder.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 34 && questionKey == 'Sleep Disorder')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.severeSleepDisorder.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.severeSleepDisorder.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 10 && questionKey == 'Social Dysfunction')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.noSocialDysfunction.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.noSocialDysfunction.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 16 && questionKey == 'Social Dysfunction')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.mildSocialDysfunction.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.mildSocialDysfunction.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 21 && questionKey == 'Social Dysfunction')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.severeSocialDysfunction.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.severeSocialDysfunction.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
        else if (score < 37 && questionKey == 'Social Dysfunction')
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${ResultText.verysevereSocialDysfunction.title}\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ResultText.verysevereSocialDysfunction.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          )
      ],
    );
  }
}
