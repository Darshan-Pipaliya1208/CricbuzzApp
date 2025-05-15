import 'dart:convert';

import 'package:cricbuzz/Live/LiveData.dart';
import 'package:cricbuzz/Live/LiveJson.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Livepage extends StatefulWidget {
  const Livepage({super.key});

  @override
  State<Livepage> createState() => _LivepageState();
}

class _LivepageState extends State<Livepage> {
  @override
  void initState() {
    LiveApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("==========${lv}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Matches',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: lv != null
            ? ListView.builder(
                itemCount: lv!.typeMatches!.length,
                padding: EdgeInsets.all(width * 0.03),
                itemBuilder: (context, index) {
                  final matchType = lv!.typeMatches![index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.white.withValues(alpha: 0.9),
                    elevation: 6,
                    margin: EdgeInsets.symmetric(vertical: height * 0.011),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.012, horizontal: width * 0.04),
                      onTap: () {
                        Get.to(
                              () => Livedata(matchType ),
                          transition: Transition.zoom, // 🔄 Slide animation
                          duration: Duration(
                              milliseconds: 600), // ⏱ Duration of animation
                        );
                      },
                      leading: Icon(Icons.sports_cricket,
                          color: Colors.deepPurple, size: 32),
                      title: Text(
                        matchType.matchType ?? 'Unknown Match Type',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Colors.deepPurple),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "Animation/LiveCriLoding.json",
                      height: height * 0.36,
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      "Fetching Live Matches...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> LiveApiCall() async {
    var url =
        Uri.parse('https://cricbuzz-cricket.p.rapidapi.com/matches/v1/live');
    var response = await http.get(url, headers: {
      'x-rapidapi-key': '7c22887c11mshf29ee9788ebf220p1c76e4jsn7d1c59cef2a2',
      'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var map = jsonDecode(response.body);
    lv = LiveJson.fromJson(map);
    setState(() {});
  }

  LiveJson? lv;
}
