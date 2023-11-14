import 'package:flutter/material.dart';
import 'details_modal.dart'; // Import the details modal
import 'details_page.dart';

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
  var arrNames = ['Raman', 'Ramanujan', 'Rajesh', 'James', 'John', 'Jacob', 'Kiwi', 'Ally', 'Ritik', 'Ronak'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
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
                builder: (BuildContext context) => DetailsModal(name: arrNames[index]),
              );
            },
            child: Ink(
              color: Colors.transparent, // Set the background color
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  arrNames[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.teal),
                ),
                subtitle: Text('Number'),
                trailing: Icon(Icons.add, color: Colors.teal, size: 30),
              ),
            ),
          );
        },
        itemCount: arrNames.length,
        separatorBuilder: (context, index) {
          return Divider(
            height: 100,
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