import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class _SalesData{
  final String year;
  final int sales;
  _SalesData(this.year,  this.sales);
}

class Profile extends StatelessWidget{
  Profile({super.key});
  final List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:  [
            const Padding(padding: EdgeInsets.only(top: 100)),
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage('https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_91_1_1528x800/public/field_blog_entry_images/201'
                  '8-09/shutterstock_648907024.jpg?itok=7lrLYx-B'),
            ),
            const Padding(
              padding: EdgeInsets.all(35),
              child: Text('Sarah Simpson', style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              //Initialize the spark charts widget
              child:SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Number of Package received monthly'),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      // Enable data label
                      dataLabelSettings: const DataLabelSettings(isVisible: true))
                ]),
            )
          ],
        ),
      ),
    );
  }

}