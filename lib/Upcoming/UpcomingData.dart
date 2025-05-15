import 'package:cricbuzz/Upcoming/UpcJson.dart';
import 'package:cricbuzz/Upcoming/UpcomingDataIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Upcomingdata extends StatefulWidget {
  Upcomingdata(this.UpctypeMatch);

  TypeMatch UpctypeMatch;

  @override
  State<Upcomingdata> createState() => _UpcomingdataState();
}

class _UpcomingdataState extends State<Upcomingdata> {
  @override
  Widget build(BuildContext context) {
    final seriesList = widget.UpctypeMatch.seriesMatches;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Series Matches",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView.builder(
            itemCount: seriesList.length,
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final seriesMatch = seriesList[index];
              final wrapper = seriesMatch.seriesAdWrapper;

              if (wrapper != null) {
                return Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Colors.white.withValues(alpha: 0.95),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    onTap: () {
                      Get.to(
                            () => Upcomingdatain(seriesMatch),
                        transition: Transition.zoom,      // 🔄 Slide animation
                        duration: Duration(milliseconds: 600),   // ⏱ Duration of animation
                      );
                    },
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.deepPurple.shade100,
                      child: Icon(Icons.sports_cricket,
                          color: Colors.deepPurple, size: 28),
                    ),
                    title: Text(
                      "${wrapper.seriesName}",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 20, color: Colors.deepPurple),
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Text(
                    "${seriesMatch.adDetail ?? "Advertisement"}",
                    style: TextStyle(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
