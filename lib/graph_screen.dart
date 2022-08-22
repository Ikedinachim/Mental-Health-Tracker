import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  final List<String> genderItems = [
    'Anxiety',
    'Depression',
    'Sleep Disorder',
    'Social Dysfunction',
  ];
  late Map<dynamic, dynamic> result;
  late int yValue = 1;

  List<ChartData> chartData = [
    ChartData('Monday', 0),
    ChartData('Tuesday', 0),
    ChartData('Wednesday', 0),
    ChartData('Thurday', 0),
    ChartData('Friday', 0),
    ChartData('Saturday', 0),
    ChartData('Sunday', 0)
  ];
  List<ChartData> onlineData = [];
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  final firebaseDatabase = FirebaseDatabase.instance;
  late int questionLength;

  void getNoOfQuestions(value) async {
    final firebase = FirebaseDatabase.instance;
    final data =
        await firebase.reference().child('/questions/$value').onValue.length;
    questionLength = data;
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Please select a condition',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a condition';
                    }
                  },
                  onChanged: (value) async {
                    final firebase = FirebaseDatabase.instance;
                    final data = await firebase
                        .reference()
                        .child('/questions/$value')
                        .once()
                        .then((value) => yValue = value.value.length);

                    setState(() {
                      selectedValue = value.toString();
                    });

                    //Do something when changing the item if you want.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
              ),
              SizedBox(
                height: 100,
              ),
              StreamBuilder<Event>(
                  stream: firebaseDatabase
                      .reference()
                      .child('Days of the Week')
                      .onValue,
                  builder: (context, snapshot) {
                    // print(selectedValue);
                    if (selectedValue == null) {
                      return Center(
                        child: Text(
                          'Select a Condition from the dropdown menu!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      );
                    } else if (!snapshot.hasData && selectedValue != null) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else {
                      chartData = [
                        ChartData('Monday', 0),
                        ChartData('Tuesday', 0),
                        ChartData('Wednesday', 0),
                        ChartData('Thursday', 0),
                        ChartData('Friday', 0),
                        ChartData('Saturday', 0),
                        ChartData('Sunday', 0)
                      ];

                      // print(snapshot.data!.snapshot.value);
                      result = snapshot.data!.snapshot.value;
                      result.forEach((key, value) {
                        chartData.forEach((data) {
                          if (data.daysOfTheWeek == key) {
                            data.levelOfCondition =
                                (value[selectedValue]).toDouble();
                          }
                        });
                        // print(key);
                        // print('dsd' + value[selectedValue]);

                        // if (selectedValue != null) {
                        //   onlineData.add(
                        //       ChartData(key, value[selectedValue].toDouble()));
                        // }
                      });
                      //  print('re' + result.toString());
                      // setState(() {});
                      return Center(
                          child: Container(
                              //color: Colors.amber,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  primaryYAxis:
                                      CategoryAxis(maximum: yValue * 3),
                                  series: <ChartSeries>[
                                    LineSeries<ChartData, String>(
                                        dataSource: chartData,
                                        // Bind the color for all the data points from the data source

                                        xValueMapper: (ChartData data, _) =>
                                            data.daysOfTheWeek.substring(0, 3),
                                        yValueMapper: (ChartData data, _) =>
                                            data.levelOfCondition)
                                  ])));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.daysOfTheWeek, this.levelOfCondition);
  String daysOfTheWeek;
  double levelOfCondition;
}
