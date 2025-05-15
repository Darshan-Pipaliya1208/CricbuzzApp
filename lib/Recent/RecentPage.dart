import 'dart:convert';
import 'package:cricbuzz/Recent/RecJson.dart';
import 'package:cricbuzz/Recent/RecentData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Recentpage extends StatefulWidget {
  const Recentpage({super.key});

  @override
  State<Recentpage> createState() => _RecentpageState();
}

class _RecentpageState extends State<Recentpage> {
  RecJson? rc;

  @override
  void initState() {
    super.initState();
    RecentApiCall();
  }

  Future<void> RecentApiCall() async {
    var url =
        Uri.parse('https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent');
    var response = await http.get(url, headers: {
      'x-rapidapi-key': '7c22887c11mshf29ee9788ebf220p1c76e4jsn7d1c59cef2a2',
      'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
    });

    var map = jsonDecode(response.body);
    rc = RecJson.fromJson(map);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recent Matches",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: width * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: rc != null
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.tealAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ListView.builder(
                itemCount: rc!.typeMatches!.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final matchType = rc!.typeMatches![index];

                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.white.withValues(alpha: 0.95),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      onTap: () {
                        Get.to(
                          () => Recentdata(matchType),
                          transition: Transition.zoom, // 🔄 Slide animation
                          duration: Duration(
                              milliseconds: 600), // ⏱ Duration of animation
                        );
                      },
                      leading: Icon(Icons.sports_cricket,
                          color: Colors.teal, size: 30),
                      title: Text(
                        "${matchType.matchType} Matches",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.teal),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: SizedBox(
                height: height * 0.5,
                width: width * 0.5,
                child: Lottie.asset("Animation/CriLoding.json"),
              ),
            ),
    );
  }
}
