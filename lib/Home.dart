import 'package:flutter/material.dart';
import 'package:cricbuzz/Live/LivePage.dart';
import 'package:cricbuzz/Recent/RecentPage.dart';
import 'package:cricbuzz/Upcoming/UpcomingPage.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          // backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          // backgroundColor: Colors.grey[100],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,

            // backgroundColor: Colors.teal[400],
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/cricbuzz1.png',
                  height: height * 0.07,
                ),
                SizedBox(width: width * 0.02),
                Center(
                  child: Text(
                    "Cricbuzz",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: width * 0.07,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  mainMenu(
                    title: 'Live Matches',
                    icon: Icons.live_tv,
                    color: Colors.redAccent,
                    width: width,
                    height: height,
                    onTap: () {
                      Get.to(
                        () => Livepage(),
                      );
                    },
                  ),
                  mainMenu(
                    title: 'Recent Matches',
                    icon: Icons.history,
                    color: Colors.blueAccent,
                    width: width,
                    height: height,
                    onTap: () {
                      Get.to(
                        () => Recentpage(),
                      );
                    },
                  ),
                  mainMenu(
                    title: 'Upcoming Matches',
                    icon: Icons.schedule,
                    color: Colors.green,
                    width: width,
                    height: height,
                    onTap: () {
                      Get.to(
                        () => Upcomingpage(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget mainMenu({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required double width,
    required double height,
  }) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: height * 0.015),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          height: height * 0.12,
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withValues(alpha: 0.9),
                color.withValues(alpha: 0.7)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(icon, size: width * 0.08, color: Colors.white),
              SizedBox(width: width * 0.05),
              Text(
                title,
                style: TextStyle(
                  fontSize: width * 0.055,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
