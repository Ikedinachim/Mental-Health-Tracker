import 'package:mental_health_tracker/models/result_model.dart';

class ResultText {
  static ResultModel minimalDepression = ResultModel('Minimal depression',
      'Your results indicate that you have none, or very few symptoms of depression. If you notice that your symptoms aren’t improving, you may want to bring them up with someone you trust. If you feel like your feelings, thoughts, or behaviors get worse, screen again.');
  static ResultModel moderateDepression = ResultModel('Moderate depression',
      'Your results indicate that you may be experiencing symptoms of moderate depression. Based on your answers, living with these symptoms could be causing difficulty managing relationships and even the tasks of everyday life. These results do not mean that you have depression, but it may be time to start a conversation with someone you trust. ');
  static ResultModel moderateSevereDepression = ResultModel(
      'Moderately Severe Depression',
      'Your responses indicate that you may be at risk of harming yourself or someone else. If you are in need of immediate assistance, Nigerian Suicide Prevention Initiative Counselling Centre +234 806 210 6493 to talk to a trained counselor from the Counselling Centre. Your results indicate that you may be experiencing symptoms of moderately severe depression. Based on your answers, living with these symptoms is causing difficulty managing relationships and even the tasks of everyday life. These results do not mean that you have depression, but it may be time to start a conversation with someone you trust.');
  static ResultModel severeDepression = ResultModel('Severe Depression',
      '''Your responses indicate that you may be at risk of harming yourself or someone else. If you are in need of immediate assistance, Nigerian Suicide Prevention Initiative Counselling Centre +234 806 210 6493 to talk to a trained counselor from the Counselling Centre.
Your results indicate that you may be experiencing symptoms of severe depression. Based on your answers, these symptoms seem to be greatly interfering with your relationships and the tasks of everyday life.
These results do not mean that you have depression, but it may be time to start a conversation with someone you trust. 
This screen is not meant to be a diagnosis. Diagnosis and care of mental health conditions can be difficult. Having symptoms of depression is different than having depression. In addition, symptoms of depression can be caused by other mental health conditions, such as bipolar disorder, or other health problems, like a thyroid disorder. A trained professional, such as a doctor or a mental health provider, can make this determination and finding the right support can help you feel more like you again.
''');
  static ResultModel minimalAnxiety = ResultModel('Minimal Anxiety',
      '''Your results indicate that you have none or very few symptoms of anxiety.
If you notice that your symptoms aren’t improving or get worse, you may want to bring them up with someone you trust or rescreen.
This screen is not meant to be a diagnosis, or the elimination of a diagnosis.  A trained medical professional can diagnose anxiety.
If you feel like your feelings, thoughts, or behaviors get worse, screen again.
''');
  static ResultModel moderateAnxiety = ResultModel('Moderate Anxiety',
      '''Your results indicate that you may be experiencing symptoms of moderate anxiety. Based on your answers, living with these symptoms could be causing difficulty managing relationships and even the tasks of everyday life.
These results do not mean that you have anxiety disorder, but it may be time to start a conversation with someone you trust to explore what is going on and how things can get better. 
This screen is not meant to be a formal diagnosis but is a good way to identify if anxiety is possible problem. Having symptoms of anxiety is different than having an anxiety disorder. In addition, symptoms of anxiety can be caused by other mental health conditions, or other health problems. A trained professional, such as a doctor or a mental health provider, can make this determination.
Anxiety symptoms are often accompanied by symptoms of depression. We recommend you also take the screen for depression.
''');
  static ResultModel severeAnxiety = ResultModel('Severe Anxiety',
      '''Your results indicate that you may be experiencing symptoms of severe anxiety. Based on your answers, these symptoms seem to be greatly interfering with your relationships and the tasks of everyday life.
These results do not mean that you have anxiety disorder, but it may be time to start a conversation with someone you trust to explore what is going on and how things can get better. 
This screen is not meant to be a formal diagnosis but is a good way to identify if anxiety is possible problem. Having symptoms of anxiety is different than having an anxiety disorder. In addition, symptoms of anxiety can be caused by other mental health conditions, or other health problems. A trained professional, such as a doctor or a mental health provider, can make this determination.
Anxiety symptoms are often accompanied by symptoms of depression. We recommend you also take the screen for depression.
''');
  static ResultModel minimalSleepDisorder = ResultModel(
      'Minimal Sleep Disorder',
      'Your results indicate that you may be experiencing Minimal Sleep disorder');
  static ResultModel mildSleepDisorder = ResultModel('Minimal Sleep Disorder',
      'Your results indicate that you may be experiencing Mild Sleep disorder');
  static ResultModel moderateSleepDisorder = ResultModel(
      'Moderate Sleep Disorder',
      'Your results indicate that you may be experiencing Moderate Sleep disorder');
  static ResultModel severeSleepDisorder = ResultModel('Severe Sleep Disorder',
      'Your results indicate that you may be experiencing Severe Sleep disorder');
  static ResultModel noSocialDysfunction = ResultModel('No Social Dysfunction',
      'Your results shows that you have No social Dysfunction Your results indicate that you have none or very few symptoms of Social Dysfunction.');
  static ResultModel mildSocialDysfunction = ResultModel(
      'Mild Social Dysfunction',
      '''	Your results shows that you have Mild social Dysfunction: Your results indicate that you have none or very few symptoms of anxiety.
 If you notice that your symptoms aren’t improving or get worse, you may want to bring them up with someone you trust or rescreen.
This screen is not meant to be a diagnosis, or the elimination of a diagnosis.  A trained medical professional can diagnose anxiety.
If you feel like your feelings, thoughts, or behaviors get worse, screen again.
''');
  static ResultModel moderateSocialDysfunction = ResultModel(
      'Moderate Social Dysfunction',
      '''	Your results indicate that you may be experiencing symptoms of moderate social anxiety. Based on your answers, living with these symptoms could be causing difficulty managing relationships, social life and even the tasks of everyday life.
These results do not mean that you have anxiety disorder, but it may be time to start a conversation with someone you trust to explore what is going on and how things can get better. 
This screen is not meant to be a formal diagnosis but is a good way to identify if social anxiety is possible problem. 
Social Dysfunction symptoms are often accompanied by symptoms of depression. We recommend you also take the screen for depression.

''');
  static ResultModel severeSocialDysfunction = ResultModel(
      'Severe Social Dysfunction',
      '''	Your results indicate that you may be experiencing symptoms of severe Social Dysfunction. Based on your answers, these symptoms seem to be greatly interfering with your social life, relationships and the tasks of everyday life.
These results do not mean that you have anxiety disorder, but it may be time to start a conversation with someone you trust to explore what is going on and how things can get better. 
Social Dysfunction symptoms are often accompanied by symptoms of depression. We recommend you also take the screen for depression.


''');
  static ResultModel verysevereSocialDysfunction = ResultModel(
      ' Very Severe Social Dysfunction',
      '''	Your results indicate that you may be experiencing symptoms of very severe Social Dysfunction. Based on your answers, these symptoms seem to be greatly interfering with your social life, relationships and the tasks of everyday life.
These results do not mean that you have anxiety disorder, but it may be time to start a conversation with someone you trust to explore what is going on and how things can get better. 
Social Dysfunction symptoms are often accompanied by symptoms of depression. We recommend you also take the screen for depression.


''');
}
