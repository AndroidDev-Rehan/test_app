import 'package:flutter/material.dart';

class ProteinTable extends StatelessWidget {
  const ProteinTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: const [
            Icon(Icons.hourglass_bottom, color: Colors.grey,),
            Text("TARGET ", style: TextStyle(color: Colors.grey),),
            Text(" 2500", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
            Text(" CAL", style: TextStyle(color: Colors.grey),),
          ],),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("CARBS", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
            Text("142g", style: TextStyle(fontWeight: FontWeight.bold) )
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text("PROTEINS", style: TextStyle(color: Colors.yellow[700],fontWeight: FontWeight.bold ),),
            const Text("71g", style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("FATS", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),),
            Text("71g", style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ],
    );
  }
}
