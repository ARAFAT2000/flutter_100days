import 'package:flutter/material.dart';


///ResContainer == Responsive Container

class ResContainer extends StatefulWidget {
  const ResContainer({super.key});

  @override
  State<ResContainer> createState() => _ResContainerState();
}

class _ResContainerState extends State<ResContainer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' Container'),
      ),

      body: Column(
        children: [

          ///Colors = background colors kre
          ///height
          ///height kkhno infinity  hbe na
          /// Container k choto kre left ,right ,top,bottom
          /// container ar vitoter element gulo k soray nibe,,space banabe
          /// vertical means niche namabe
          /// alainment == direction of widgets
          /// transform use for ratoting the widget
          /// Shapedecoration same as boxdecoration but it is linear decoration
          ///
          Container(
            height: 200,
            width: double.infinity,
            transform: Matrix4.rotationY(0.7),
          //  color: Colors.yellow,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 20,top: 20,right: 20),
           padding: EdgeInsets.symmetric(vertical: 70),
           decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
           border:   BoxBorder.lerp(
               Border.all(color: Colors.black, width:0.0),
               Border.all(color: Colors.blue, width: 6.0),
               0.5, // Interpolation parameter, can be animated
             ),
           ),
            child: Text('This is Container'),
            ///ShapeDecoration(
            //                 shape:Border.all(color: Colors.red),
            //             gradient: LinearGradient(
            //
            //               tileMode: TileMode.repeated,
            //                 begin: Alignment.topLeft,
            //                 end: Alignment.bottomRight,
            //                 colors: [Colors.blue, Colors.green],)
            //             )
          ),

        ],
      ),
    );
  }
}
