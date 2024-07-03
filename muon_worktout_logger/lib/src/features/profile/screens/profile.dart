import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: const Column(
          children: [
            Center(
              child: CircleAvatar(minRadius: 50, child: Icon(Icons.person)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'John Doe',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              leading: Text(
                'Height',
                style: TextStyle(fontSize: 14),
              ),
              trailing: Text('160 cm', style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              leading: Text('Weight', style: TextStyle(fontSize: 14)),
              trailing: Text('60', style: TextStyle(fontSize: 14)),
            )
          ],
        ));
  }
}
