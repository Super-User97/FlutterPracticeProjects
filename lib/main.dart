import 'package:flutter/material.dart';
import 'details_modal.dart'; // Import the details modal
import 'details_page.dart';
import 'dart:math';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlutterApp",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  var arrNames = [
    'Raman',
    'Ramanujan',
    'Rajesh',
    'James',
    'John',
    'Jacob',
    'Kiwi',
    'Ally',
    'Ritik',
    'Ronak'
  ];
  // Function to generate a random gender
  String getRandomGender() {
    Random random = Random();
    return random.nextBool() ? 'Male' : 'Female';
  }

  // Function to get the appropriate avatar icon based on gender
  IconData getAvatarIcon(String gender) {
    return gender == 'Male' ? Icons.face : Icons.pregnant_woman;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Colors.blue
              ], // Customize your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          Random random = Random();
          int timeDifference = random.nextInt(51) + 10;
          // Get a random gender (Male/Female)
          String gender = getRandomGender();
          return InkWell(
            onTap: () {
              // Navigate to the details page when a name is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(name: arrNames[index]),
                ),
              );
            },
            onLongPress: () {
              // Show the details modal when a name is long-pressed
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) =>
                    DetailsModal(name: arrNames[index]),
              );
            },
            child: Ink(
              color: Colors.transparent, // Set the background color
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    getAvatarIcon(gender),
                    size: 30,
                    color: Colors.white,
                  ),
                  backgroundColor: gender == 'Male' ? Colors.blue : Colors.pink,
                ),
                title: Text(
                  arrNames[index],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.teal),
                ),
                subtitle: Row(
                  children: <Widget>[
                    // Incoming/Outgoing icon based on your condition
                    Icon(
                      Icons
                          .call_received, // Replace with your icon for incoming/outgoing
                      color: Colors.green, // Customize the color
                    ),
                    SizedBox(width: 5), // Add some spacing

                    // Mobile icon
                    Text('Mobile', style: TextStyle(color: Colors.teal)),
                    SizedBox(width: 5),

                    // Dot separator
                    Text('·', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 5),

                    // Time (increasing dynamically)
                    Text('$timeDifference min ago'),
                  ],
                ),
                trailing: Icon(Icons.call, color: Colors.teal, size: 30),
              ),
            ),
          );
        },
        itemCount: arrNames.length,
        separatorBuilder: (context, index) {
          return Divider(
            height: 50,
            thickness: 3,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action for the "add call" button here
        },
        child: Icon(Icons.dialpad_rounded),
        backgroundColor: Colors.teal,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
