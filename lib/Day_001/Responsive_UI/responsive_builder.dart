import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Responsive builder packege use kre screen k different size dewya jay


class RBuilder extends StatelessWidget {
  const RBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationLayoutBuilder(

        portrait: (context) => Container(color: Colors.green),
      landscape: (context) => Container(color: Colors.pink),
    );
  }
}

/// ResponsiveBuilder(
//         builder: (context,SizingInformation){
//           if(SizingInformation.deviceScreenType==DeviceScreenType.desktop ){
//             return Container(color:Colors.red);
//           }else if(SizingInformation.deviceScreenType==DeviceScreenType.mobile ){
//             return Container(color:Colors.yellow);
//           }
//           return Container(color:Colors.green);
//         })