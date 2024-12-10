import 'package:cerita_saku/view/DongengPage.dart';
import 'package:cerita_saku/view/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cerita_saku/view/WelcomePage.dart'; // Import WelcomePage.dart untuk navigasi kembali

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser;
  }

  String getName(String email) {
    return email.split('@')[0];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Saya",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[600],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   radius: 60,
            //   // backgroundImage: Icon(Icons.person_2),
            // ),
            SizedBox(height: 20),
            Text(
              "Username: ${getName(_currentUser?.email ?? '')}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Email Anda: ${_currentUser?.email ?? ''}", // Ganti dengan alamat email pengguna
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false,
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Anda telah logout'),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.red,
                  ));
              },
              child: Text("Keluar"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            label: 'Dongeng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 2, // Indeks aktif ketiga adalah Profil
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
          } else if (index == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DongengPage()));
          }
        },
      ),
    );
  }
}
