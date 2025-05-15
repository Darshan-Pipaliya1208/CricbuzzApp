import 'package:cricbuzz/Recent/RecJson.dart';
import 'package:cricbuzz/Recent/RecentDataIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recentdata extends StatefulWidget {
  Recentdata(this.RectypeMatch);

  final TypeMatches RectypeMatch;

  @override
  State<Recentdata> createState() => _RecentdataState();
}

class _RecentdataState extends State<Recentdata> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Series List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: width * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.tealAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: widget.RectypeMatch.seriesMatches!.length,
          padding: EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final match = widget.RectypeMatch.seriesMatches![index];

            if (match.seriesAdWrapper != null) {
              return Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white.withValues(alpha: 0.95),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    Get.to(
                          () => Recentdatain(match),
                      transition: Transition.zoom,      // 🔄 Slide animation
                      duration: Duration(milliseconds: 600),   // ⏱ Duration of animation
                    );
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  leading:
                      Icon(Icons.emoji_events, size: 30, color: Colors.teal),
                  title: Text(
                    match.seriesAdWrapper!.seriesName ?? "No series name",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "${match.adDetail ?? "No Detail Available"}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
