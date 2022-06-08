import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../models/Food.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/food_tile.dart';
import 'widgets/meal_status.dart';
import 'widgets/protien_table.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Food> foodsList = [];

  final Map<String, double> dataMap = {
    "React": 2,
    "Flutter": 1,
    "Xamarin": 1,
  };

  @override
  Widget build(BuildContext context) {

    for (int i=0; i<4; i++){
      foodsList.add(Food(title: "Breakfast", cals: 234, desc: "Oatmeal and Chicken burrito bowl", imagePaths: []));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            Row(
              children:  [
                 Text("Current Profile", style: TextStyle(color: Colors.grey[700],)),
                const Spacer(),
                MyDropDownButton(dropdownValue: "MY PLAN", items:const ["MY PLAN", "OTHER PLAN"])
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: PieChart(
                    colorList: [Colors.blue,Colors.purple, Colors.yellow[700]!, ],
                    dataMap: dataMap,
                    legendOptions: const LegendOptions(
                      showLegends: false,
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      // showChartValuesOutside: false,
                      // decimalPlaces: 1,
                      chartValueStyle: TextStyle(color: Colors.white)
                    ),

                  ),
                ),
                const SizedBox(width: 15,),
                 const Expanded(
                    flex: 6,
                    child: ProteinTable()

                )
              ],
            ),
            const SizedBox(height: 20,),
            const MealStatus(),
            const SizedBox(height: 20,),
            ListView.builder(

                shrinkWrap: true,

                itemCount: foodsList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context,int index){
                return FoodTile(
                    food: foodsList[index]);
              }
            ),
            _buildRegenerateButton()
          ],
        ),
      ),
    );
  }

  _buildRegenerateButton(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {  },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.cached),
            SizedBox(width: 10,),
            Text("Regenerate Meat Plan")
          ],
        ),
      ),

    );
  }
}

