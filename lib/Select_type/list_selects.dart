import 'package:flutter/material.dart';


class ListSelect extends StatefulWidget {
  const ListSelect({super.key});

  @override
  State<ListSelect> createState() => _ListSelectState();
}

class _ListSelectState extends State<ListSelect> {

  List<String> monthlist =['January','February','March','Aprill','May','June',];

  List<String> select=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' List Selcets'),
      ),
      body: ListView.builder(

        itemCount: monthlist.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                setState(() {
                  if(select.contains(monthlist[index].toString())){
                    select.remove(monthlist[index].toString());
                  }else{
                    select.add(monthlist[index].toString());
                  }
                  print(select.toString());
                });
              },
              child: Card(
                child:ListTile(
                  title:Text( monthlist[index].toString()),
                  trailing: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: select.contains(monthlist[index].toString())?Colors.red : Colors.lightGreen,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(select.contains(monthlist[index].toString()) ? 'Remove' : 'Add')),
                  ),
                )
              ),
            );
          })
    );
  }
}
