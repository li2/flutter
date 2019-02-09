// Beautiful, animated charts for Flutter
// https://medium.com/flutter-io/beautiful-animated-charts-for-flutter-164940780b8c
// Source Codes from https://gist.github.com/mit-mit/08168a773a56bb58c7abfd9b8e82f467
// 2019-02-09

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartDemo extends StatelessWidget {
  const ChartDemo({Key key}) : super(key: key);

  static const String routeName = '/charts';

  @override
  Widget build(BuildContext context) => const ChartDemoHomePage();
}

class ChartDemoHomePage extends StatefulWidget {
  const ChartDemoHomePage({Key key}) : super(key: key);

  @override
  _ChartDemoHomePageState createState() => new _ChartDemoHomePageState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
    : this.color = new charts.Color(
    r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _ChartDemoHomePageState extends State<ChartDemoHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ClicksPerYear> data = [
      ClicksPerYear('2016', 12, Colors.red),
      ClicksPerYear('2017', 42, Colors.yellow),
      ClicksPerYear('2018', _counter, Colors.green),
    ];

    final List<charts.Series<ClicksPerYear, String>> series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    final chart = charts.BarChart(
      series,
      animate: true,
    );
    final chartWidget = Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('charts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:',),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            chartWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
