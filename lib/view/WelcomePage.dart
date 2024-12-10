import 'package:cerita_saku/view/DetailPage.dart';
import 'package:cerita_saku/view/DongengPage.dart';
import 'package:cerita_saku/model_view/Fetch_Cerita.dart';
import 'package:cerita_saku/view/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Repository repo = Repository();

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
      body: Container(
        color: Colors.green[600],
        child: FutureBuilder<List<dynamic>>(
            future: repo.fetchData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Cerita Saku",
                            style: GoogleFonts.inter(
                                fontSize: 24, color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Text(
                              "Temukan dan nikmati cerita yang anda sukai disini",
                              style: GoogleFonts.inter(
                                  fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent, // Latar belakang transparan
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        child: Container(
                          color: Color.fromARGB(
                              255, 241, 241, 241), // Latar belakang putih
                          height: MediaQuery.of(context).size.height -
                              kToolbarHeight -
                              40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "   Cerita Pilihan Hari ini",
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height -
                                    kToolbarHeight -
                                    590.0,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3, // Hanya menampilkan 3 item
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // Buat list indeks acak
                                    List<int> randomIndices =
                                        List<int>.generate(
                                            snapshot.data.length, (i) => i);
                                    randomIndices.shuffle();

                                    if (randomIndices.isNotEmpty) {
                                      final ceritaIndex = randomIndices
                                          .removeLast(); //biar index tidak duplikat
                                      final cerita = snapshot.data[ceritaIndex];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(cerita),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 200,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      cerita.image,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  cerita.caption,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      // Jika tidak ada item yang tersedia, Anda dapat menampilkan widget lain atau pesan kesalahan
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: 300,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ); // Contoh: Tampilkan widget kosong jika tidak ada item
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "   Paling Banyak dibaca",
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                ),
                              ),
                              Container(
                                height: 400,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 1, // Hanya menampilkan 1 item
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // Buat list indeks acak
                                    List<int> randomIndices =
                                        List<int>.generate(
                                            snapshot.data.length, (i) => i);
                                    randomIndices.shuffle();

                                    if (randomIndices.isNotEmpty) {
                                      final cerita = snapshot.data[1];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(cerita),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 10),
                                          child: Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 260,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      cerita.image,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  cerita.caption,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Text(
                                                    "Seekor kura-kura sombong merasa dirinya lebih pantas terbang dibanding berenang dan jengkel karena tempurungnya yang berat.........................",
                                                    style: GoogleFonts.inter(
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      // Jika tidak ada item yang tersedia, Anda dapat menampilkan widget lain atau pesan kesalahan
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        child: Container(
                                          width: 300,
                                          height: 260,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
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
        currentIndex: 0, // Indeks aktif pertama adalah Beranda
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DongengPage()));
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
