// ignore: file_names
import 'package:flutter/material.dart';
import 'package:card_covid19/data/dataFromApi.dart';
import 'package:http/http.dart';
import 'package:card_covid19/bottomMenu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Covid>?  _data;


  @override

 
 void initState() { 
   super.initState();
  //  debugPrint('initState');
   getData();
   
 }

   Future<void>  getData() async {
   debugPrint('getData');
   var url = Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
   var response = await get(url);

  //  debugPrint(response.body);

  setState(() {
      _data   = covidFromJson(response.body);
  });
 }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(246, 244, 241, 211),
      appBar: AppBar(
        title: const Text(
          'รายงานผู้ติดเชื้อ ',
          style: TextStyle(
            fontSize: 26,
            color: Color.fromARGB(255, 65, 162, 23),
            letterSpacing: 3.0,
          
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(210, 238, 245, 111),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:65),
        child: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12 , left: 12),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(225, 219, 219, 41),
                          borderRadius: BorderRadius.circular(20)),
                      child:  Padding(
                        padding: EdgeInsets.only(top: 23),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Stack(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color.fromARGB(255, 252, 251, 249),
                                  child: Icon(
                                    Icons.accessible,
                                    size: 25,
                                    color: Colors.redAccent,
                                  ),
                                )
                              ],
                            ),
                           const Text('ผู้ติดเชื้อทั้งหมด',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(24, 165, 19, 1),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                '${_data?[0].totalCase}',
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 111, 0, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      
      
      
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(225, 219, 219, 41),
                          borderRadius: BorderRadius.circular(20)),
                      child:  Padding(
                        padding: EdgeInsets.only(top: 23),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           const Stack(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color.fromRGBO(254, 252, 251, 0.952),
                                  child: Icon(
                                    Icons.airline_seat_individual_suite,
                                    size: 25,
                                    color: Color.fromARGB(255, 213, 116, 41),
                                  ),
                                )
                              ],
                            ),
                           const Text('ผู้ติดเชื้อรายใหม่',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(24, 165, 19, 1),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                '${_data?[0].newCase}',
                                style:const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 111, 0, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
           
            ),
      
      
      
      
      
            Padding(
              padding: const EdgeInsets.only(top: 12 , left: 12),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(225, 219, 219, 41),
                          borderRadius: BorderRadius.circular(20)),
                      child:  Padding(
                        padding: EdgeInsets.only(top: 23),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           const  Stack(
                             children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color.fromRGBO(255, 213, 79, 1),
                                  child: Icon(
                                    Icons.not_accessible,
                                    size: 25,
                                    color: Colors.blueAccent,
                                  ),
                                )
                              ],
                            ),
                           const Text('ผู้ติดเชื้อรายสัปดาห์',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(24, 165, 19, 1),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                '${_data?[0].weeknum} ',
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 111, 0, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      
      
      
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          color:const Color.fromARGB(225, 219, 219, 41),
                          borderRadius: BorderRadius.circular(20)),
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           const Stack(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color.fromRGBO(255, 213, 79, 1),
                                  child: Icon(
                                    Icons.local_fire_department,
                                    size: 25,
                                    color: Colors.pinkAccent,
                                  ),
                                )
                              ],
                            ),
                           const Text('ผู้เสียชีวิต',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(24, 165, 19, 1),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                '${_data?[0].totalDeath}',
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 111, 0, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
           
            ),
      
      
      
          
            
          ],
        ),
      ),

      bottomNavigationBar: const bottomMenu(),
      
      //        bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'School',
      //     ),
      //   ],
      //   currentIndex: 0,
      //   selectedItemColor: Colors.amber[800],
        
      // )









    );
  }
}
