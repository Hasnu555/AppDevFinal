import 'package:flutter/material.dart';
import 'package:practice/pages/productpage.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_image.png'), // Add your profile image here
            ),
            SizedBox(height: 20),
            Text(
              'Your Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your Email',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5, // Update the itemCount to 5
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.brown, // Change the color to brown
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.settings), // Add leading icon here
                        title: Center(
                          child: Text(
                            'Settings',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Handle Settings onTap
                        },
                      ),
                    ),
                  );
                } else if (index == 1) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color : Colors.brown, // Change the color to brown
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.privacy_tip), // Add leading icon here
                        title: Center(
                          child: Text(
                            'Privacy',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Handle Privacy onTap
                        },
                      ),
                    ),
                  );
                } else if (index == 2) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color : Colors.brown, // Change the color to brown
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.logout), // Add leading icon here
                        title: Center(
                          child: Text(
                            'Logout',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Handle Logout onTap
                        },
                      ),
                    ),
                  );
                } else if (index == 3) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color : Colors.brown, // Change the color to brown
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.help), // Add leading icon here
                        title: Center(
                          child: Text(
                            'Help & Support',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Handle Help & Support onTap
                        },
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color : Colors.brown, // Change the color to brown
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person_add), // Add leading icon here
                        title: Center(
                          child: Text(
                            'Invite a Friend',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        
                        onTap: () {
                          // Handle Invite a Friend onTap
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductView()),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
