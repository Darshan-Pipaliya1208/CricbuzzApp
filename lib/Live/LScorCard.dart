import 'dart:convert';

import 'package:cricbuzz/Live/LScoreCardJson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// Provider , Bloc , Google ads , Firebase , Deploy ,Google map api,

// ads  -  Income , Google , Facebook , unity, IronSource , Applovin

// CPM $5 ==  1000 Impression Of ADs

// Game, cricket ,guide , Fitness ,  = high

//


class Lscorcard extends StatefulWidget {
  const Lscorcard(this.matchId, {super.key});

  final int matchId;

  @override
  State<Lscorcard> createState() => _LscorcardState();
}

class _LscorcardState extends State<Lscorcard> {
  @override
  void initState() {
    super.initState();
    LiveScorCardApi(widget.matchId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // Ye curve banayega neeche
          ),
        ),
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width*0.125,),
            Text(
              "ScoreCard",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      body: lsc != null
          ? RefreshIndicator(
        onRefresh: () async {
          await LiveScorCardApi(widget.matchId); // Ensure matchId is available
        },
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "${lsc!.status}",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                    ExpansionTile(
                      showTrailingIcon: true,
                      title: Container(
                        color: Colors.greenAccent,
                        child: Row(
                          children: [
                            Text(
                              "${lsc!.scoreCard[0].batTeamDetails!.batTeamShortName ?? 'Team Name'}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "${lsc!.scoreCard[0].scoreDetails!.runs ?? '-'}"
                              " - ${lsc!.scoreCard[0].scoreDetails!.wickets ?? '-'}"
                              " (${lsc!.scoreCard[0].scoreDetails!.overs ?? '-'})",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            // SizedBox(height: 20),
                          ],
                        ),
                      ),
                      children: [
                        Container(
                          color: Colors.grey.shade200,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.41,
                                child: Text("Batter"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.1,
                                child: Text("R"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.1,
                                child: Text("B"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.1,
                                child: Text("4s"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.08,
                                child: Text("6s"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.12,
                                child: Center(child: Text("SR")),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: lsc!
                              .scoreCard[0].batTeamDetails!.batsmenData.length,
                          itemBuilder: (context, index) {
                            if (lsc!.scoreCard[0].batTeamDetails!
                                    .batsmenData["bat_${index + 1}"] !=
                                null) {
                              if (lsc!.scoreCard[0].batTeamDetails!
                                      .batsmenData["bat_${index + 1}"]!.outDesc !=
                                  "") {
                                return ListTile(
                                  subtitle: Text(
                                      "${lsc!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.outDesc}"),
                                  title: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.398,
                                        child: Text(
                                          "${lsc!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.batName}",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.1,
                                        child: Text(
                                            "${lsc!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.runs}"),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.1,
                                        child: Text(
                                            "${lsc!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.balls}"),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.1,
                                        child: Text(
                                            "${lsc!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.fours}"),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.08,
                                        child: Text(
                                            "${lsc!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.sixes}"),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.12,
                                        child: Text(
                                            "${lsc!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.strikeRate}"),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        Divider(),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Extras",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Spacer(),
                            Text(
                              "${lsc!.scoreCard[0].extrasData!.total} ",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Row(
                              children: [
                                Text(
                                  "b ${lsc!.scoreCard[0].extrasData!.byes}, lb ${lsc!.scoreCard[0].extrasData!.legByes}, w ${lsc!.scoreCard[0].extrasData!.wides}, nb ${lsc!.scoreCard[0].extrasData!.noBalls}, p ${lsc!.scoreCard[0].extrasData!.penalty}",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Total",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "${lsc!.scoreCard[0].scoreDetails!.runs ?? '-'}"
                              " - ${lsc!.scoreCard[0].scoreDetails!.wickets ?? '-'}"
                              " (${lsc!.scoreCard[0].scoreDetails!.overs ?? '-'})",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Did not bat",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Jacob Duffy, William ORourke",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          color: Colors.grey.shade200,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.3,
                                child: Text("Bowler"),
                              ),
                              Spacer(),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("O"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("M"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("R"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("W"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("NB"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("WD"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.12,
                                child: Center(child: Text("ECO")),
                              ),
                            ],
                          ),
                        ),
                        lsc!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl1 !=
                                null
                            ? ballData(lsc!.scoreCard[0].bowlTeamDetails!
                                .bowlersData!.bowl1!)
                            : SizedBox(),
                        lsc!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl2 !=
                                null
                            ? ballData(lsc!.scoreCard[0].bowlTeamDetails!
                                .bowlersData!.bowl2!)
                            : SizedBox(),
                        lsc!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl3 !=
                                null
                            ? ballData(lsc!.scoreCard[0].bowlTeamDetails!
                                .bowlersData!.bowl3!)
                            : SizedBox(),
                        lsc!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl4 !=
                                null
                            ? ballData(lsc!.scoreCard[0].bowlTeamDetails!
                                .bowlersData!.bowl4!)
                            : SizedBox(),
                        lsc!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl5 !=
                                null
                            ? ballData(lsc!.scoreCard[0].bowlTeamDetails!
                                .bowlersData!.bowl5!)
                            : SizedBox(),
                      ],
                    ),
                    ExpansionTile(
                      showTrailingIcon: true,
                      title: Container(
                        color: Colors.greenAccent,
                        child: Row(
                          children: [
                            Text(
                              "${lsc!.scoreCard[1].batTeamDetails!.batTeamShortName ?? 'Team Name'}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "${lsc!.scoreCard[1].scoreDetails!.runs ?? '-'}"
                              " - ${lsc!.scoreCard[1].scoreDetails!.wickets ?? '-'}"
                              " (${lsc!.scoreCard[1].scoreDetails!.overs ?? '-'})",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            // SizedBox(height: 20),
                          ],
                        ),
                      ),
                      children: [
                        Container(
                          color: Colors.grey.shade200,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.41,
                                child: Text("Batter"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.1,
                                child: Text("R"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.1,
                                child: Text("B"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.1,
                                child: Text("4s"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.08,
                                child: Text("6s"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.12,
                                child: Center(child: Text("SR")),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: lsc!
                              .scoreCard[1].batTeamDetails!.batsmenData.length,
                          itemBuilder: (context, index) {
                            if (lsc!.scoreCard[1].batTeamDetails!
                                    .batsmenData["bat_${index + 1}"] !=
                                null) {
                              if (lsc!.scoreCard[1].batTeamDetails!
                                      .batsmenData["bat_${index + 1}"]!.outDesc !=
                                  "") {
                                return ListTile(
                                  subtitle: Text(
                                      "${lsc!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.outDesc}"),
                                  title: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.398,
                                        child: Text(
                                          "${lsc!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.batName}",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.1,
                                        child: Text(
                                            "${lsc!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.runs}"),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.1,
                                        child: Text(
                                            "${lsc!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.balls}"),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.1,
                                        child: Text(
                                            "${lsc!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.fours}"),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.08,
                                        child: Text(
                                            "${lsc!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.sixes}"),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width) *
                                                0.12,
                                        child: Text(
                                            "${lsc!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.strikeRate}"),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        Divider(),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Extras",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Spacer(),
                            Text(
                              "${lsc!.scoreCard[1].extrasData!.total} ",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Row(
                              children: [
                                Text(
                                  "b ${lsc!.scoreCard[1].extrasData!.byes}, lb ${lsc!.scoreCard[1].extrasData!.legByes}, w ${lsc!.scoreCard[1].extrasData!.wides}, nb ${lsc!.scoreCard[1].extrasData!.noBalls}, p ${lsc!.scoreCard[1].extrasData!.penalty}",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Total",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "${lsc!.scoreCard[0].scoreDetails!.runs ?? '-'}"
                              " - ${lsc!.scoreCard[0].scoreDetails!.wickets ?? '-'}"
                              " (${lsc!.scoreCard[0].scoreDetails!.overs ?? '-'})",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Did not bat",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Jacob Duffy, William ORourke",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          color: Colors.grey.shade200,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.3,
                                child: Text("Bowler"),
                              ),
                              Spacer(),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("O"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("M"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("R"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("W"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("NB"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.07,
                                child: Text("WD"),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width) * 0.12,
                                child: Center(child: Text("ECO")),
                              ),
                            ],
                          ),
                        ),
                        lsc!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl1 !=
                                null
                            ? ballData(lsc!.scoreCard[1].bowlTeamDetails!
                                .bowlersData!.bowl1!)
                            : SizedBox(),
                        lsc!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl2 !=
                                null
                            ? ballData(lsc!.scoreCard[1].bowlTeamDetails!
                                .bowlersData!.bowl2!)
                            : SizedBox(),
                        lsc!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl3 !=
                                null
                            ? ballData(lsc!.scoreCard[1].bowlTeamDetails!
                                .bowlersData!.bowl3!)
                            : SizedBox(),
                        lsc!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl4 !=
                                null
                            ? ballData(lsc!.scoreCard[1].bowlTeamDetails!
                                .bowlersData!.bowl4!)
                            : SizedBox(),
                        lsc!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl5 !=
                                null
                            ? ballData(lsc!.scoreCard[1].bowlTeamDetails!
                                .bowlersData!.bowl5!)
                            : SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
          )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget ballData(Bowl bowl) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.3,
            child: Text(
              "${bowl.bowlName}",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Spacer(),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.1,
            child: Text("${bowl.overs}"),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.06,
            child: Text("${bowl.maidens}"),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.084,
            child: Text("${bowl.runs}"),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.07,
            child: Text("${bowl.wickets}"),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.07,
            child: Text("${bowl.noBalls}"),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.06,
            child: Text("${bowl.wides}"),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.12,
            child: Center(child: Text("${bowl.economy}")),
          ),
        ],
      ),
    );
  }

  Future<void> LiveScorCardApi(int matchId) async {
    var url = Uri.parse(
        "https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/${matchId}/hscard");
    var response = await http.get(url, headers: {
      'x-rapidapi-key': '7c22887c11mshf29ee9788ebf220p1c76e4jsn7d1c59cef2a2',
      'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var map = jsonDecode(response.body);
    lsc = LiveScoreCardJson.fromJson(map);
    setState(() {});
  }

  LiveScoreCardJson? lsc;
}
