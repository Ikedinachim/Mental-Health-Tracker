import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_tracker/graph_screen.dart';
import 'package:mental_health_tracker/result_text.dart';
import 'package:mental_health_tracker/widgets/result_text_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultPage extends StatefulWidget {
  final Stream<Event> stream;
  final String questionKey;
  final int score;
  final int sumTotal;
  ResultPage(this.stream, this.questionKey, this.score, this.sumTotal,
      {Key? key})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<ChartData> data;

  //TooltipBehavior _tooltip = TooltipBehavior();
  late int questionLength;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.score);
    data = [
      //  _ChartData(widget.questionKey, widget.score),
      ChartData(widget.score == 0 ? '' : widget.questionKey, widget.score),
      ChartData('Normal', widget.sumTotal - widget.score),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfCircularChart(annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                  widget: Container(
                      child: PhysicalModel(
                          child: Container(),
                          shape: BoxShape.circle,
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: const Color.fromRGBO(230, 230, 230, 1)))),
              CircularChartAnnotation(
                  widget: Container(
                      child: Text(
                          '${((widget.score / widget.sumTotal) * 100).toStringAsFixed(1)}%',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 25))))
            ], series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                  dataSource: data,
                  enableSmartLabels: true,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                  dataLabelMapper: (ChartData data, _) => data.text,
                  xValueMapper: (ChartData data, _) => data.text,
                  yValueMapper: (ChartData data, _) => data.data,
                  // Radius of doughnut
                  radius: '90%')
            ]),
            ResultTextContainer(widget.score, widget.questionKey),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GraphScreen();
                }));
              },
              child: Text('BACK TO DASHBOARD'),
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String text;
  final int data;
  ChartData(this.text, this.data);
}
