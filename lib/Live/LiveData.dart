import 'package:cricbuzz/Live/LiveDataIn.dart';
import 'package:cricbuzz/Live/LiveJson.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Livedata extends StatefulWidget {
  TypeMatches LivetypeMatch;

  Livedata(this.LivetypeMatch);

  @override
  State<Livedata> createState() => _LivedataState();
}

class _LivedataState extends State<Livedata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Series Matches",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: widget.LivetypeMatch.seriesMatches!.length,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          itemBuilder: (context, index) {
            final match = widget.LivetypeMatch.seriesMatches![index];

            if (match.seriesAdWrapper != null) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 6,
                color: Colors.white.withValues(alpha: 0.9),
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.011),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015,
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                  ),
                  onTap: () {
                    Get.to(
                          () => Livedatain(match),
                      transition: Transition.zoom,      // 🔄 Slide animation
                      duration: Duration(milliseconds: 600),   // ⏱ Duration of animation
                    );
                  },
                  leading: Icon(Icons.sports_cricket,
                      color: Colors.deepPurple, size: 32),
                  title: Text(
                    match.seriesAdWrapper!.seriesName ?? "Unnamed Series",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    "${match.adDetail ?? 'No Details Available'}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
