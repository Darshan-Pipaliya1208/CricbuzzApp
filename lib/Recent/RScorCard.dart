import 'dart:convert';

import 'package:cricbuzz/Recent/RScorCarJson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Scorcard extends StatefulWidget {
  const Scorcard(this.matchId, {super.key});

  final int matchId;

  @override
  State<Scorcard> createState() => _ScorcardState();
}

class _ScorcardState extends State<Scorcard> {
  @override
  void initState() {
    RecScorCardApi(widget.matchId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // Ye curve banayega neeche
          ),
        ),
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width*0.125,),
            Text(
              "Recent ScoreCard",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),

      body: rcs != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "${rcs!.status}",
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
                            "${rcs!.scoreCard[0].batTeamDetails!.batTeamShortName ?? 'Team Name'}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "${rcs!.scoreCard[0].scoreDetails!.runs ?? '-'}"
                            " - ${rcs!.scoreCard[0].scoreDetails!.wickets ?? '-'}"
                            " (${rcs!.scoreCard[0].scoreDetails!.overs ?? '-'})",
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
                        itemCount: rcs!
                            .scoreCard[0].batTeamDetails!.batsmenData.length,
                        itemBuilder: (context, index) {
                          if (rcs!.scoreCard[0].batTeamDetails!
                                  .batsmenData["bat_${index + 1}"] !=
                              null) {
                            if (rcs!.scoreCard[0].batTeamDetails!
                                    .batsmenData["bat_${index + 1}"]!.outDesc !=
                                "") {
                              return ListTile(
                                subtitle: Text(
                                    "${rcs!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.outDesc}"),
                                title: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.398,
                                      child: Text(
                                        "${rcs!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.batName}",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.1,
                                      child: Text(
                                          "${rcs!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.runs}"),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.1,
                                      child: Text(
                                          "${rcs!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.balls}"),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.1,
                                      child: Text(
                                          "${rcs!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.fours}"),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.08,
                                      child: Text(
                                          "${rcs!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.sixes}"),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.12,
                                      child: Text(
                                          "${rcs!.scoreCard[0].batTeamDetails!.batsmenData["bat_${index + 1}"]!.strikeRate}"),
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
                            "${rcs!.scoreCard[0].extrasData!.total} ",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          Row(
                            children: [
                              Text(
                                "b ${rcs!.scoreCard[0].extrasData!.byes}, lb ${rcs!.scoreCard[0].extrasData!.legByes}, w ${rcs!.scoreCard[0].extrasData!.wides}, nb ${rcs!.scoreCard[0].extrasData!.noBalls}, p ${rcs!.scoreCard[0].extrasData!.penalty}",
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
                            "${rcs!.scoreCard[0].scoreDetails!.runs ?? '-'}"
                            " - ${rcs!.scoreCard[0].scoreDetails!.wickets ?? '-'}"
                            " (${rcs!.scoreCard[0].scoreDetails!.overs ?? '-'})",
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
                      rcs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl1 !=
                              null
                          ? ballData(rcs!.scoreCard[0].bowlTeamDetails!
                              .bowlersData!.bowl1!)
                          : SizedBox(),
                      rcs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl2 !=
                              null
                          ? ballData(rcs!.scoreCard[0].bowlTeamDetails!
                              .bowlersData!.bowl2!)
                          : SizedBox(),
                      rcs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl3 !=
                              null
                          ? ballData(rcs!.scoreCard[0].bowlTeamDetails!
                              .bowlersData!.bowl3!)
                          : SizedBox(),
                      rcs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl4 !=
                              null
                          ? ballData(rcs!.scoreCard[0].bowlTeamDetails!
                              .bowlersData!.bowl4!)
                          : SizedBox(),
                      rcs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl5 !=
                              null
                          ? ballData(rcs!.scoreCard[0].bowlTeamDetails!
                              .bowlersData!.bowl5!)
                          : SizedBox(),
                      rcs!.scoreCard[0].bowlTeamDetails!.bowlersData!.bowl6 !=
                              null
                          ? ballData(rcs!.scoreCard[0].bowlTeamDetails!
                              .bowlersData!.bowl6!)
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
                            "${rcs!.scoreCard[1].batTeamDetails!.batTeamShortName ?? 'Team Name'}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "${rcs!.scoreCard[1].scoreDetails!.runs ?? '-'}"
                            " - ${rcs!.scoreCard[1].scoreDetails!.wickets ?? '-'}"
                            " (${rcs!.scoreCard[1].scoreDetails!.overs ?? '-'})",
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
                        itemCount: rcs!
                            .scoreCard[1].batTeamDetails!.batsmenData.length,
                        itemBuilder: (context, index) {
                          if (rcs!.scoreCard[1].batTeamDetails!
                                  .batsmenData["bat_${index + 1}"] !=
                              null) {
                            if (rcs!.scoreCard[1].batTeamDetails!
                                    .batsmenData["bat_${index + 1}"]!.outDesc !=
                                "") {
                              return ListTile(
                                subtitle: Text(
                                    "${rcs!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.outDesc}"),
                                title: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.398,
                                      child: Text(
                                        "${rcs!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.batName}",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.1,
                                      child: Text(
                                          "${rcs!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.runs}"),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.1,
                                      child: Text(
                                          "${rcs!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.balls}"),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.1,
                                      child: Text(
                                          "${rcs!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.fours}"),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.08,
                                      child: Text(
                                          "${rcs!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.sixes}"),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.12,
                                      child: Text(
                                          "${rcs!.scoreCard[1].batTeamDetails!.batsmenData["bat_${index + 1}"]!.strikeRate}"),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                          return null;
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
                            "${rcs!.scoreCard[1].extrasData!.total} ",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          Row(
                            children: [
                              Text(
                                "b ${rcs!.scoreCard[1].extrasData!.byes}, lb ${rcs!.scoreCard[1].extrasData!.legByes}, w ${rcs!.scoreCard[1].extrasData!.wides}, nb ${rcs!.scoreCard[1].extrasData!.noBalls}, p ${rcs!.scoreCard[1].extrasData!.penalty}",
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
                            "${rcs!.scoreCard[0].scoreDetails!.runs ?? '-'}"
                            " - ${rcs!.scoreCard[0].scoreDetails!.wickets ?? '-'}"
                            " (${rcs!.scoreCard[0].scoreDetails!.overs ?? '-'})",
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
                      rcs!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl1 !=
                              null
                          ? ballData(rcs!.scoreCard[1].bowlTeamDetails!
                              .bowlersData!.bowl1!)
                          : SizedBox(),
                      rcs!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl2 !=
                              null
                          ? ballData(rcs!.scoreCard[1].bowlTeamDetails!
                              .bowlersData!.bowl2!)
                          : SizedBox(),
                      rcs!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl3 !=
                              null
                          ? ballData(rcs!.scoreCard[1].bowlTeamDetails!
                              .bowlersData!.bowl3!)
                          : SizedBox(),
                      rcs!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl4 !=
                              null
                          ? ballData(rcs!.scoreCard[1].bowlTeamDetails!
                              .bowlersData!.bowl4!)
                          : SizedBox(),
                      rcs!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl5 !=
                              null
                          ? ballData(rcs!.scoreCard[1].bowlTeamDetails!
                              .bowlersData!.bowl5!)
                          : SizedBox(),
                      rcs!.scoreCard[1].bowlTeamDetails!.bowlersData!.bowl6 !=
                              null
                          ? ballData(rcs!.scoreCard[1].bowlTeamDetails!
                              .bowlersData!.bowl6!)
                          : SizedBox(),
                    ],
                  ),
                ],
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

  Future<void> RecScorCardApi(int matchId) async {
    var url = Uri.parse(
        'https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/${matchId}/hscard');
    var response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '7c22887c11mshf29ee9788ebf220p1c76e4jsn7d1c59cef2a2',
        'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
      },
    );

    print('Response body: ${response.body}');
    print('Response status: ${response.statusCode}');
    var map = jsonDecode(response.body);
    rcs = RecentScoreCardJson.fromJson(map);

    setState(() {});
  }

  RecentScoreCardJson? rcs;
}
