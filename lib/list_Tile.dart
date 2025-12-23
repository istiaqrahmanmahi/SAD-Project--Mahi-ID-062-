
import 'package:flutter/material.dart';

class list_Tile extends StatelessWidget {
  const list_Tile({super.key});

  @override
  Widget build(BuildContext context) {

    var arrNames= ['Mahi','Sadia','Kulsuma','Rahi','Sakib','Istiaq','Rahman','Shanriyar','IRM','ISRM','Mahdi','Ehtesam','Flutter','Dart'];

    return Scaffold(

      appBar: AppBar(
        
        backgroundColor: const Color.fromARGB(255, 33, 243, 114),
        foregroundColor: Colors.blueGrey,
        title: Text('LISTs',style: TextStyle(fontFamily: 'FontMain',fontSize: 30,fontWeight:FontWeight.w500 ),),// ami amr customade FOnt use korta farmu ,jmn ami ekta font re fontfamily er vitore set korce "FontMain" nam e

        actions: [
          IconButton(
            onPressed: (){},
           icon: Icon(Icons.pages_outlined)),

          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.favorite)),
        ],

      ),

      body:ListView.builder(itemBuilder:(context, index) {
      
        return ListTile(
      
          leading:CircleAvatar(
            backgroundImage: AssetImage('assets/images/maleAV.png'),
            backgroundColor: Colors.green,
            //child:
             // Text ('${index+1}'),
      
            ),
          title: Text(arrNames[index],style: TextStyle(fontFamily: 'FontMain'),),
          subtitle: Text('Number'),
          trailing: Icon(Icons.add),
        
        );
       },
       itemCount: arrNames.length,
       
      ),
       
   );
  }
}