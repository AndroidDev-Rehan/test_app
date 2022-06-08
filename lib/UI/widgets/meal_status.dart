import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'dropdown_button.dart';

class MealStatus extends StatefulWidget {
  const MealStatus({Key? key}) : super(key: key);

  @override
  State<MealStatus> createState() => _MealStatusState();
}

class _MealStatusState extends State<MealStatus> {

  final Map<String, double> dataMap = {
    "React": 1,
    "Flutter": 1,
    "Xamarin": 1,
  };


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text('THIS WEEK MEALS ', style: TextStyle(color: Colors.white),),
                        ),
                        MyDropDownButton(dropdownValue: "May 2-7", items: const ["May 2-7","May 8-9"],iconColor: Colors.white, textColor: Colors.white,backgroundColor: Colors.green,)
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.arrow_back_ios_sharp, color: Colors.white,size: 15),
                        Text("TODAY", style: TextStyle(color: Colors.white),),
                        Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 15,)
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,4,16,0),
                child: Row(
                  children: [
                    PieChart(
                      dataMap: dataMap,
                      chartLegendSpacing: 22,
                      chartRadius: MediaQuery.of(context).size.width / 6,
                      colorList: [Colors.blue,Colors.purple, Colors.yellow[700]!, ],
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 15,
                      centerText: "2350",
                      centerTextStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      legendOptions: const LegendOptions(
                        showLegends: false,
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: false,
                        showChartValues: false,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text("CARBS", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                  Text("142g", style: TextStyle(fontWeight: FontWeight.bold) )
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("PROTEINS", style: TextStyle(color: Colors.yellow[700],fontWeight: FontWeight.bold ),),
                                  const Text("71g", style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text("FATS", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),),
                                  Text("71g", style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),


                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
