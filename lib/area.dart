import 'package:flutter/material.dart';

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

            
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButtonFormField<String>(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Department',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: 'IT',
                    child: Text('IT'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'CS',
                    child: Text('CS'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'EC',
                    child: Text('EC'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'EEE',
                    child: Text('EEE'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'MECH',
                    child: Text('MECH'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'CIVIL',
                    child: Text('CIVIL'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'SF',
                    child: Text('SF'),
                  ),
                ],
                onChanged: (value) {

                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButtonFormField<String>(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Semester',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: 'Semester 1',
                    child: Text('Semester 1'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Semester 2',
                    child: Text('Semester 2'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Semester 3',
                    child: Text('Semester 3'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Semester 4',
                    child: Text('Semester 4'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Semester 5',
                    child: Text('Semester 5'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Semester 6',
                    child: Text('Semester 6'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Semester 7',
                    child: Text('Semester 7'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Semester 8',
                    child: Text('Semester 8'),
                  ),
                ],
                onChanged: (value) {
                },
              ),
            ),
          
            SizedBox(
              height: 30,
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
