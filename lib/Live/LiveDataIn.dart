import 'package:cricbuzz/Live/LScorCard.dart';
import 'package:cricbuzz/Live/LiveJson.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Livedatain extends StatefulWidget {
  final SeriesMatches LiveseriesMatches;

  Livedatain(this.LiveseriesMatches);

  @override
  State<Livedatain> createState() => _LivedatainState();
}

class _LivedatainState extends State<Livedatain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Match Details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
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
          itemCount:
              widget.LiveseriesMatches.seriesAdWrapper?.matches?.length ?? 0,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.014),
          itemBuilder: (context, index) {
            final match =
                widget.LiveseriesMatches.seriesAdWrapper!.matches![index];
            final matchInfo = match.matchInfo!;
            final score = match.matchScore;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              color: Colors.white.withValues(alpha: 0.9),
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.012),
              child: ListTile(
                // widget.LiveseriesMatches.seriesAdWrapper!.matches![index].matchInfo!.matchId!
                onTap: () {
                  Get.to(
                        () => Lscorcard(widget.LiveseriesMatches.seriesAdWrapper!.matches![index].matchInfo!.matchId!),
                    transition: Transition.zoom,      // 🔄 Slide animation
                    duration: Duration(milliseconds: 600),   // ⏱ Duration of animation
                  );
                },
                contentPadding: EdgeInsets.all(16),
                title:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${matchInfo.matchDesc ?? 'Unknown Date'} • ${matchInfo.venueInfo?.city ?? 'Unknown City'}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          matchInfo.team1?.teamSName ?? 'Team 1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          score?.team1Score?.inngs1 != null
                              ? "${score!.team1Score!.inngs1!.runs}-${score.team1Score!.inngs1!.wickets} (${score.team1Score!.inngs1!.overs})"
                              : "No Score",
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          matchInfo.team2?.teamSName ?? 'Team 2',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          score?.team2Score?.inngs1 != null
                              ? "${score!.team2Score!.inngs1!.runs} (${score.team2Score!.inngs1!.overs})"
                              : "No Score",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Text(
                      matchInfo.status ?? '',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
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
