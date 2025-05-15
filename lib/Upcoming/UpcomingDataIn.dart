import 'package:cricbuzz/Upcoming/UpcJson.dart';
import 'package:flutter/material.dart';

class Upcomingdatain extends StatefulWidget {
  Upcomingdatain(this.Upcsearies);

  final SeriesMatch Upcsearies;

  @override
  State<Upcomingdatain> createState() => _UpcomingdatainState();
}

class _UpcomingdatainState extends State<Upcomingdatain> {
  @override
  Widget build(BuildContext context) {
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
              "Match Schedule",
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
          body: widget.Upcsearies.seriesAdWrapper != null
              ? ListView.builder(
                  itemCount: widget.Upcsearies.seriesAdWrapper!.matches.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final match =
                        widget.Upcsearies.seriesAdWrapper!.matches[index];
                    final matchInfo = match.matchInfo;
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      color: Colors.white.withValues(alpha: 0.95),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${matchInfo?.matchDesc ?? ""} • ${matchInfo?.venueInfo?.city ?? ""}",
                              style: TextStyle(
                                fontSize: width * 0.045,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            Row(
                              children: [
                                Icon(Icons.sports_cricket,
                                    color: Colors.deepPurple),
                                SizedBox(width: 8),
                                Text(
                                  matchInfo?.team1?.teamName ?? "Team 1",
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.sports_cricket,
                                    color: Colors.deepPurple),
                                SizedBox(width: 8),
                                Text(
                                  matchInfo?.team2?.teamName ?? "Team 2",
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "${widget.Upcsearies.adDetail ?? "No Match Details Available"}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
        ),
      ],
    );
  }
}
