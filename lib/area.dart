import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class SelectArea extends StatefulWidget {
  const SelectArea({super.key});

  @override
  State<SelectArea> createState() => _SelectAreaState();
}

class _SelectAreaState extends State<SelectArea> {
  List<dynamic> area = [];
  List<dynamic> locate = [];
  List<dynamic> spot = [];
  List<dynamic> department= [];
  String? spotId;
  String? departmentId;
  String? areaId;
  @override
  void initState() {
    super.initState();
    this.department.add({"Id": 1, "Department": "IT"});
    this.department.add({"Id": 2, "Department": "CS"});
    this.department.add({"Id": 3, "Department": "EEE"});
    this.department.add({"Id": 4, "Department": "EC"});
    this.department.add({"Id": 5, "Department": "MECH"});
    this.department.add({"Id": 6, "Department": "CIVIL"});
    this.department.add({"Id": 7, "Department": "SF"});

    this.area.add({"id": 1, "Area": "CLASSROOM"});
    this.area.add({"id": 2, "Area": "BATHROOM"});
    this.area.add({"id": 3, "Area": "LAB"});
    this.area.add({"id": 4, "Area": "OTHERS"});
    this.locate = [
      {"ID": 1, "Spot": "C1", "ParentId": 1},
      {"ID": 2, "Spot": "C2", "ParentId": 1},
      {"ID": 3, "Spot": "C3", "ParentId": 1},
      {"ID": 4, "Spot": "C4", "ParentId": 1},
      {"ID": 5, "Spot": "C5", "ParentId": 1},
      {"ID": 6, "Spot": "C6", "ParentId": 1},
      {"ID": 7, "Spot": "C7", "ParentId": 1},
      {"ID": 8, "Spot": "C8", "ParentId": 1},
      {"ID": 9, "Spot": "C9", "ParentId": 1},
      {"ID": 10, "Spot": "C10 Park", "ParentId": 1},
      {"ID": 1, "Spot": "G1", "ParentId": 2},
      {"ID": 2, "Spot": "G2", "ParentId": 2},
      {"ID": 3, "Spot": "B1", "ParentId": 2},
      {"ID": 4, "Spot": "B2", "ParentId": 2},
      {"ID": 1, "Spot": "L1", "ParentId": 3},
      {"ID": 2, "Spot": "L2", "ParentId": 3},
      {"ID": 3, "Spot": "L3", "ParentId": 3},
      {"ID": 4, "Spot": "L4", "ParentId": 3},
      {"ID": 5, "Spot": "L5", "ParentId": 3},
      {"ID": 6, "Spot": "L6", "ParentId": 3},
      {"ID": 1, "Spot": "library", "ParentId": 4},
      {"ID": 2, "Spot": "varanda", "ParentId": 4},
      
    ];
  }

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
                  fontStyle: FontStyle.italic,
                  fontSize: 40,
                  color: Colors.indigoAccent.withOpacity(.9),
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
                          "Select Department",
                          "Department ",
                          this.departmentId,
                          this.department,
                          (onChangedVal) {
                            this.departmentId = onChangedVal;
                            print("Selected department : $onChangedVal");
                            setState(() {});
                          },
                          (onValidateVal) {
                            if (onValidateVal == null) {
                              return "Please Select a Department";
                            }
                            return null;
                          },
                          borderColor: Colors.black,
                          borderFocusColor: Colors.indigo,
                          borderRadius: 10,
                          optionValue: "Id",
                          optionLabel: "Department",
                          textColor: Colors.black,
                          hintColor: Colors.black,
                        ),
                        FormHelper.dropDownWidgetWithLabel(
                          context,
                          "Select Area",
                          "Area",
                          this.areaId,
                          this.area,
                          (onChangedVal) {
                            this.areaId = onChangedVal;
                            print("Selected area : $onChangedVal");
                            this.spot = this
                                .locate
                                .where((stateItem) =>
                                    stateItem["ParentId"].toString() ==
                                    onChangedVal.toString())
                                .toList();
                            this.spotId = null;
                            setState(() {});
                          },
                          (onValidateVal) {
                            if (onValidateVal == null) {
                              return "Please Select an area";
                            }
                            return null;
                          },
                          borderColor: Colors.black,
                          borderFocusColor: Colors.indigoAccent,
                          borderRadius: 10,
                          optionValue: "id",
                          optionLabel: "Area",
                          textColor: Colors.black,
                          hintColor: Colors.black,
                        ),
                        FormHelper.dropDownWidgetWithLabel(
                            context,
                            "Select Spot",
                            "Spot",
                            this.spotId,
                            this.spot, (onChangedVal) {
                          this.spotId = onChangedVal;
                          print("Selected spot : $onChangedVal");
                        }, (onValidate) {
                          return null;
                        },
                            borderColor: Colors.black,
                            borderFocusColor: Colors.indigoAccent,
                            borderRadius: 10,
                            optionValue: "ID",
                            optionLabel: "Spot",
                            textColor: Colors.black,
                            hintColor: Colors.black),
                        
                      ],
                    ),
            ),
            
            SizedBox(
              height: 10,
            ),
            
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.indigoAccent, // Set background color to white
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
