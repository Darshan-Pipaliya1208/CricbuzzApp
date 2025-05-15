import 'package:cricbuzz/Recent/RScorCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'RecJson.dart';

class Recentdatain extends StatefulWidget {
  Recentdatain(this.RecseriesMatches);

  final SeriesMatches RecseriesMatches;

  @override
  State<Recentdatain> createState() => _RecentdatainState();
}

class _RecentdatainState extends State<Recentdatain> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Match Details",
          style: TextStyle(fontWeight: FontWeight.bold),
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
          itemCount:
              widget.RecseriesMatches.seriesAdWrapper?.matches?.length ?? 0,
          padding: EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final match =
                widget.RecseriesMatches.seriesAdWrapper!.matches![index];
            final matchInfo = match.matchInfo;
            final matchScore = match.matchScore;

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
                        () => Scorcard(widget.RecseriesMatches.seriesAdWrapper!.matches![index].matchInfo!.matchId!),
                    transition: Transition.zoom,
                    duration: Duration(milliseconds: 600),
                  );
                },
                contentPadding: EdgeInsets.all(16),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${matchInfo?.matchDesc ?? 'Match'} • ${matchInfo?.venueInfo?.city ?? ''}",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: width * 0.038,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${matchInfo?.team1?.teamSName ?? '-'}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${matchScore?.team1Score?.inngs1?.runs ?? '-'}"
                          " - ${matchScore?.team1Score?.inngs1?.wickets ?? '-'}"
                          " (${matchScore?.team1Score?.inngs1?.overs ?? '-'})",
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${matchInfo?.team2?.teamSName ?? '-'}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${matchScore?.team2Score?.inngs1?.runs ?? '-'}"
                          " - ${matchScore?.team2Score?.inngs1?.wickets ?? '-'}"
                          " (${matchScore?.team2Score?.inngs1?.overs ?? '-'})",
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${matchInfo?.status ?? ''}",
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
