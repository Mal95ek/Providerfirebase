import 'package:flutter/material.dart';
import 'package:providerfirebase/screens/Profile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cars',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 10,
            ),
            ListTile(
              title: Text('profile'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            Divider(
              color: Colors.grey,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
