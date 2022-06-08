import 'package:flutter/material.dart';

import '../../models/Food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({Key? key, required this.food}) : super(key: key);
  
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0,0,16,16),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(food.title, style: const TextStyle(fontWeight: FontWeight.bold),),
              Row(
                children: [
                Text("${food.cals} cal", style: const TextStyle(color: Colors.grey),),
                  const Spacer(),
                  _buildLockIcon(),
                  const SizedBox(width: 10,),
                  const Icon(Icons.cached, color: Colors.green,)
              ],),
              const Divider(),
              Text(food.desc, style: const TextStyle(fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset("assets/images/food1.jpg", width: 60, height: 60,),
                  ),
                  Image.asset("assets/images/food2.jpg", width: 60, height: 60,),

                ],
              )
            ],
          ),

        ),
      ),
    );
  }
  
  _buildLockIcon(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle
          ),
            child: const Icon(Icons.lock, color: Colors.white,)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
            borderRadius: BorderRadius.circular(6)
          ),
            child: const Text("LOCK", style: TextStyle(color: Colors.green),))
      ],
      
    );
  }
}
