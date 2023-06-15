import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:card_covid19/data/provineData.dart';
import 'package:card_covid19/data/typeprovine.dart';

class province extends StatefulWidget {
  const province({super.key});

  @override
  State<province> createState() => _provinceState();
}

class _provinceState extends State<province> {

 List<Province>?  _data;
 var provinceName = [];


 void _onItemTapped() {
    setState(() {
   
     
    });
  }

 
 

  void initState() { 
   super.initState();
  //  debugPrint('initState');
   getData();
   
 }


 
   Future<void>  getData() async {
   debugPrint('getData');
   var url = Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces');
   var res = await get(url);

  //  debugPrint(response.body);

  setState(() {
      _data   = provinceFromJson(res.body);
      // _data?.map((e) => provinceName.add(e.province)   );
     
        // for(var p in _data!) {
        //    provinceName.add(p.province);
           
        // }

             
      
  });
 }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text(
          'แยกตามจังหวัด ',
          style: TextStyle(
            fontSize: 26,
            color: Color.fromARGB(255, 65, 162, 23),
            letterSpacing: 3.0,
          
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(210, 238, 245, 111),
      ),
     
    // body: ListView(
    //     children:  [
    //       Card(
    //         color:const Color.fromRGBO(93, 123, 224, 0.66),
    //         child: ListTile(
    //             title: Text('${provinceName}' ,
    //             style: const TextStyle(
    //               color: Color.fromARGB(255, 250, 250, 250),
    //               fontSize: 24,
    //               fontWeight: FontWeight.w600,
    //             ),),
    //         ),
    //       )
    //     ],

    // ) ,




     body: ListView.builder(

        itemCount: _data?.length,
        itemBuilder: (BuildContext context , int index){
         Province? _DATA = _data?[index];
          // province_name  p = provinceName[index];

          return  GestureDetector(
            
            onTap: _onItemTapped,
            child: Card(
              color: const Color.fromRGBO(93, 123, 224, 0.66),
              child: ListTile(
                  title: Text( '${_DATA?.province}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 105, 25, 25),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),),
                  trailing: Text('${_DATA?.totalCase}' , style: const TextStyle(
                    fontSize: 20,
                    color: Colors.amber
                  ),),
              ),
            ),
          );
        },

     )
       

    ) ;


    
  }
}