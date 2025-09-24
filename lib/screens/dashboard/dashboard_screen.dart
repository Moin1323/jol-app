import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jol_app/screens/dashboard/notification_screen.dart';

import '../onboarding/onboarding_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  static const Color textBlue = Color(0xFF0734A5);
  static const Color textGreen = Color(0xFF43AC45);
  static const Color textPink = Color(0xFFF82A87);

  @override
  Widget build(BuildContext context) {
    // Transparent status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Container(
        // Gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFC0CB),
              Color(0xFFADD8E6),
              Color(0xFFE6E6FA),
            ],
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // 📌 Straight App Bar
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 6,
                  left: 12,
                  right: 12,
                  bottom: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 🔠 JOL Logo
                    _buildJolLogo(),

                    Row(
                      children: [
                        // ✅ HOW TO PLAY (pill button)
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => const HelpDialog(),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                              color: textGreen,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.9),
                                  width: 2.5),
                            ),
                            child: const Text(
                              "HOW TO PLAY",
                              style: TextStyle(
                                fontFamily: 'Digitalt',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        // 🔔 Notification Bell
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const NotificationScreen(),),
                            );
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.notifications,
                              size: 20,
                              color: textPink,
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        // 💰 Coins
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: textPink,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              // Circle with "J"
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Text(
                                    "J",
                                    style: TextStyle(
                                      fontFamily: 'Digitalt',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: textPink,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "5M",
                                  style: TextStyle(
                                    fontFamily: 'Digitalt',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        // 👤 Profile Avatar
                        const CircleAvatar(
                          radius: 18,
                          backgroundImage:
                          AssetImage("lib/assets/images/settings_emoji.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 📋 Body List of Match Result Cards
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: textPink.withOpacity(0.5),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                    ),
                    padding: EdgeInsets.symmetric( vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          "Completed",
                          style: TextStyle(
                            fontFamily: 'Digitalt',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
                            letterSpacing: 1.5,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 5, // 🔥 number of cards
                            itemBuilder: (context, index) {
                              return _buildMatchResultCard();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔠 JOL logo builder
  Widget _buildJolLogo() {
    const letters = ["J", "O", "L"];
    const colors = [Color(0xFFf8bc64), textPink, Color(0xFFfc6839)];

    return Row(
      children: List.generate(
        letters.length,
            (index) => Text(
          letters[index],
          style: const TextStyle(
            fontFamily: 'Digitalt',
            fontWeight: FontWeight.w500,
            fontSize: 35,
            height: 0.82,
          ).copyWith(
            color: colors[index],
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  // 🎯 Match Result Card
  Widget _buildMatchResultCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔝 Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 26,
                    backgroundImage:
                    AssetImage("lib/assets/images/settings_emoji.png"),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "24",
                        style: TextStyle(
                          fontFamily: 'Digitalt',
                          fontSize: 11, // ⬆️ was 10
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "YOU WON",
                    style: TextStyle(
                      fontFamily: 'Digitalt',
                      fontSize: 19, // ⬆️ was 18
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: textPink,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        "VS ",
                        style: TextStyle(
                          fontFamily: 'Digitalt',
                          fontSize: 14, // ⬆️ was 14
                          letterSpacing: 1.1,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Sarajb20 ",
                        style: TextStyle(
                          fontSize: 15, // ⬆️ was 14
                          letterSpacing: 1.1,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔸 Divider info row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "TIME: 3 DAYS AGO",
                style: TextStyle(
                  fontFamily: 'Digitalt',
                  fontSize: 13, // ⬆️ was 12
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                  color: textPink,
                ),
              ),
              Text(
                "ENTRY FEE: \$8",
                style: TextStyle(
                  fontFamily: 'Digitalt',
                  fontSize: 13, // ⬆️ was 12
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                  color: Color(0xFFfc6839),
                ),
              ),
            ],
          ),

          const Divider(thickness: 1, height: 16),

          // 📊 Stats
          _buildStatRow("POINTS:", "86"),
          _buildStatRow("TOTAL SCORE:", "1240"),
          _buildStatRow("GRADE:", "TOP 20"),
          _buildStatRow("RANK:", "56%/100%"),
          _buildStatRow("TIME TAKEN:", "02M : 45S"),

          const SizedBox(height: 8),

          // 🏅 Badge earned
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "BADGE EARNED:",
                style: TextStyle(
                  fontFamily: 'Digitalt',
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // ⬆️ was 13
                  letterSpacing: 1.1,
                  color: textGreen,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: textGreen,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.greenAccent.withOpacity(0.5), width: 1.5),
                ),
                child: const Text(
                  "BRONZE",
                  style: TextStyle(
                    fontFamily: 'Digitalt',
                    fontSize: 14, // ⬆️ was 13
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

// helper row builder
  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Digitalt',
              fontSize: 14, // ⬆️ was 13
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Digitalt',
              fontSize: 14, // ⬆️ was 13
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }

}
