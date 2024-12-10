import 'package:cerita_saku/model/Cerita.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final Cerita cerita;

  DetailPage(this.cerita);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cerita.caption,
          style: GoogleFonts.inter(color: Colors.white),
        ),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                cerita.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Gambar dari ${cerita.caption}",
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ),
              // SizedBox(height: 8),
              Center(
                child: Text(
                  "Ditulis Oleh ${cerita.penulis}",
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                color: Colors.black,
                height: 3, width: double.infinity,
              ),
              const SizedBox(height: 16),
              Text(
                cerita.deskripsi,
                style: GoogleFonts.inter(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
