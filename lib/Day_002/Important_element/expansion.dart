import 'package:flutter/material.dart';


class IExpansion extends StatefulWidget {
  @override
  _IExpansionState createState() => _IExpansionState();
}

class _IExpansionState extends State<IExpansion> {
  bool active = false;
  String exTitle = "Sport Categories";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            active = !active;
            if(exTitle=="Sport Categories")
              exTitle="Contract";
            else
              exTitle="Sport Categories";
            setState(() {

            });
          },
          children: <ExpansionPanel>[
            ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return Container();
                },
                body: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 7,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.red;

                            // Use the component's default.
                            return Colors.black;
                          },
                        ),
                      ),
                      onPressed: () => null,
                      child: Text('Tap '),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text('Tap ')
                    ),
                    ElevatedButton(
                        onPressed: null, child: Text('Tap ')),
                    ElevatedButton(
                        onPressed: null, child: Text('Tap ')),
                    ElevatedButton(
                        onPressed: null, child: Text('Tap ')),
                    ElevatedButton(
                        onPressed: null, child: Text('Tap ')),
                    ElevatedButton(
                        onPressed: null, child: Text('Tap ')),
                    ElevatedButton(
                        onPressed: null, child:Text('Tap ')),
                  ],
                ),
                isExpanded: active,
                canTapOnHeader: true
            )
          ],
        ),

      ],
    );
  }
}
