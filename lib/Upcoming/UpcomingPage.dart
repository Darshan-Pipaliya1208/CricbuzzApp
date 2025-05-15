import 'dart:convert';
import 'package:cricbuzz/Upcoming/UpcomingData.dart';
import 'package:cricbuzz/Upcoming/UpcJson.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Upcomingpage extends StatefulWidget {
  const Upcomingpage({super.key});

  @override
  State<Upcomingpage> createState() => _UpcomingpageState();
}

class _UpcomingpageState extends State<Upcomingpage> {
  UpcomingJson? up;

  @override
  void initState() {
    super.initState();
    UpcomingApiCall();
  }

  Future<void> UpcomingApiCall() async {
    var url = Uri.parse(
        "https://cricbuzz-cricket.p.rapidapi.com/matches/v1/upcoming");
    var response = await http.get(url, headers: {
      'x-rapidapi-key': '7c22887c11mshf29ee9788ebf220p1c76e4jsn7d1c59cef2a2',
      'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com'
    });
    var map = jsonDecode(response.body);
    up = UpcomingJson.fromJson(map);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purple,
                Colors.lightBlue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Upcoming Matches",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: up != null
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.02),
                  itemCount: up!.typeMatches.length,
                  itemBuilder: (context, index) {
                    final matchType = up!.typeMatches[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: height * 0.02),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 8,
                        color: Colors.white.withValues(alpha: 0.95),
                        shadowColor: Colors.black54,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.05),
                          onTap: () {
                            Get.to(
                                  () => Upcomingdata(matchType),
                              transition: Transition.zoom,      // 🔄 Slide animation
                              duration: Duration(milliseconds: 600),   // ⏱ Duration of animation
                            );
                          },
                          leading: Icon(Icons.schedule,
                              color: Colors.deepPurpleAccent,
                              size: width * 0.07),
                          title: Text(
                            "${matchType.matchType} Matches",
                            style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: width * 0.05,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: SizedBox(
                    height: height * 0.4,
                    width: width * 0.6,
                    child: Lottie.asset("Animation/UpcLoding.json"),
                  ),
                ),
        ),
      ],
    );
  }
}
