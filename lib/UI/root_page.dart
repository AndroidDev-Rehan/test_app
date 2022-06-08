import 'package:flutter/material.dart';
import 'package:test_app/UI/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<IconData> iconList = [Icons.ac_unit_sharp,Icons.access_alarm_rounded,Icons.accessibility_new, Icons.account_box_outlined];

  int selectedIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title:  Text("MEAL PLAN", style: TextStyle(color: Colors.grey[600]),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading:  IconButton( onPressed: () {
          scaffoldKey.currentState!.openDrawer();
          }, icon: Icon(Icons.menu_sharp, color: Colors.grey[700],),),
      ),
      drawer: const Drawer(),
      body: (selectedIndex == 0) ?  HomeScreen() : Container(
        child: const Text("Other Page"),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height/12,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Material(
                elevation: 10,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIcon(0, Icons.account_box_outlined),
                    _buildIcon(1, Icons.access_alarm_rounded),
                    Visibility(
                      visible: false,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.add, size: 40,color: Colors.white,)),
                    ),
                    _buildIcon(2, Icons.account_box_outlined),
                    _buildIcon(3, Icons.access_alarm_rounded),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 7,
              left: MediaQuery.of(context).size.width/2.5,
              child: Container(
                padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.add, size: 40,color: Colors.white,)),
              ),
            ),

          ],
        ),
      ),
    );
  }

  _buildIcon(int index, IconData icon,){
    return InkWell(
      onTap: (){
        setState((){
          selectedIndex = index;
        });
      },
      child: Icon(
        icon,
        color: (selectedIndex == index) ? Colors.green : Colors.grey,
        size: 25,
      ),
    );
  }


}
