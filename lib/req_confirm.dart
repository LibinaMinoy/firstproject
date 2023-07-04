import 'package:firstproject/home.dart';
import 'package:flutter/material.dart';


class RequestConfirmPage extends StatefulWidget {
  const RequestConfirmPage({super.key});

  @override
  State<RequestConfirmPage> createState() => _RequestConfirmPageState();
}

class _RequestConfirmPageState extends State<RequestConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'THANK YOU FOR INFORMING,\nYOUR REQUEST IS NOTED',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Return to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}