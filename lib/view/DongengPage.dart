import 'package:cerita_saku/view/DetailPage.dart';
// import 'package:cerita_saku/view/Login.dart';
import 'package:cerita_saku/view/ProfilePage.dart';
import 'package:cerita_saku/view/WelcomePage.dart';
import 'package:cerita_saku/model_view/Fetch_Cerita.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DongengPage extends StatefulWidget {
  const DongengPage({super.key});

  @override
  State<DongengPage> createState() => _DongengPageState();
}

class _DongengPageState extends State<DongengPage> {
  Repository repo = Repository();
  // List<Cerita> ceritaList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // void fetchData() async {
  //   List<Cerita> data = await Cerita.fetchData();
  //   setState(() {
  //     ceritaList = data;
  //   });
  // }
  // FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cerita Saku",
          style: GoogleFonts.inter(color: Colors.white),
        ),
        backgroundColor: Colors.green[600],
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.882),
      body: FutureBuilder(
          future: repo.fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final cerita = snapshot.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(cerita),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        right: 15.0,
                        left: 15.0,
                      ),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  cerita.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cerita.caption,
                                  style: GoogleFonts.inter(fontSize: 18),
                                ),
                                Text(
                                  cerita.penulis,
                                  style: GoogleFonts.inter(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
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
        currentIndex: 1, // Indeks aktif pertama adalah Dongeng
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => WelcomePage()));
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage())
            );
          }
        },
      ),
    );
  }
}
