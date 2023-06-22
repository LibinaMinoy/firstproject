import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class SelectArea extends StatefulWidget {
  const SelectArea({super.key});

  @override
  State<SelectArea> createState() => _SelectAreaState();
}

class _SelectAreaState extends State<SelectArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height*0.25,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text('SELECT THE AREA',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue.withOpacity(.9),
                    fontWeight: FontWeight.w600
                ),),
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(
            //         'images/bell.png'
            //       )
            //     )
            //   ),
            // ),
            Container(
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FormHelper.dropDownWidgetWithLabel(
                          context,
                          "Route",
                          "Select Your Route",
                          this.routeId,
                          this.routes,
                          (onChangedVal) {
                            this.routeId = onChangedVal;
                            print("Selected Country : $onChangedVal");
                            this.stops = this
                                .stopMaster
                                .where((stateItem) =>
                                    stateItem["ParentId"].toString() ==
                                    onChangedVal.toString())
                                .toList();
                            this.stopId = null;
                            setState(() {});
                          },
                          (onValidateVal) {
                            if (onValidateVal == null) {
                              return "Please Select a route";
                            }
                            return null;
                          },
                          borderColor: Colors.blue,
                          borderFocusColor: Colors.redAccent,
                          borderRadius: 10,
                          optionValue: "id",
                          optionLabel: "label",
                          textColor: Colors.black,
                          hintColor: Colors.black,
                        ),
                        FormHelper.dropDownWidgetWithLabel(
                            context,
                            "Stop",
                            "Select Your Stop",
                            this.stopId,
                            this.stops, (onChangedVal) {
                          this.stopId = onChangedVal;
                          print("Selected Stop : $onChangedVal");
                        }, (onValidate) {
                          return null;
                        },
                            borderColor: Colors.blueAccent,
                            borderFocusColor: Colors.redAccent,
                            borderRadius: 10,
                            optionValue: "ID",
                            optionLabel: "Name",
                            textColor: Colors.black,
                            hintColor: Colors.black),
                        FormHelper.dropDownWidgetWithLabel(
                          context,
                          "Ticket Type",
                          "Select Ticket ",
                          this.typeId,
                          this.ticketType,
                          (onChangedVal) {
                            this.typeId = onChangedVal;
                            print("Selected Ticket : $onChangedVal");
                            setState(() {});
                          },
                          (onValidateVal) {
                            if (onValidateVal == null) {
                              return "Please Select a Ticket";
                            }
                            return null;
                          },
                          borderColor: Colors.blue,
                          borderFocusColor: Colors.redAccent,
                          borderRadius: 10,
                          optionValue: "Id",
                          optionLabel: "Ticket",
                          textColor: Colors.black,
                          hintColor: Colors.black,
                        ),
                      ],
                    ),
            )
            
            SizedBox(
              height: 10,
            ),
            
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Set background color to white
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.05,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    'CONFIRM',
                    style: TextStyle(
                      color: Colors.white, // Set text color to blue
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.25,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            
            SizedBox(
              height: 10,
            ),


          ],
        ),
      ),
    );
  }
}
