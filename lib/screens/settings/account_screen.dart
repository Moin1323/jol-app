import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jol_app/screens/settings/money_screen.dart';

import 'choose_color_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // keep the same colors as your other screen
  static const Color textPink = Color(0xFFF82A87);
  static const Color textGreen = Color(0xFF4CAF50);
  static const Color accentPurple = Color(0xFF9B4BFF);

  final TextEditingController _couponController = TextEditingController();

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  Widget _sectionCard({required Widget child, double vertical = 8}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: vertical),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // subtle shadow
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6)
        ],
      ),
      child: child,
    );
  }

  Widget _headerRow(String title, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 6),
      child: Row(
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Digitalt',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textPink,
              letterSpacing: 1,
            ),
          ),
          const Spacer(),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _myBalanceCard() {
    return _sectionCard(
      child: Column(
        children: [
          _headerRow("My Balance"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Colors.black.withOpacity(0.05), height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                // balance value
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "£1280",
                      style: TextStyle(
                        fontFamily: 'Digitalt',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC42AF8),
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                // buttons
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => _showSnack('Spend tapped'),
                        child: Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                            color: textGreen,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: Colors.white54, width: 1.2),
                          ),
                          child: Center(
                            child: Text(
                              "Spend",
                              style: const TextStyle(
                                fontFamily: 'Digitalt',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () => _showSnack('Deposit tapped'),
                        child: Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                            color: textGreen,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: Colors.white54, width: 1.2),
                          ),
                          child: Center(
                            child: Text(
                              "Deposit",
                              style: const TextStyle(
                                fontFamily: 'Digitalt',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _monetisationCard() {
    return _sectionCard(
      child: Column(
        children: [
          _headerRow(
            "Monetisation Plans",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CURRENT STATUS: ",
                  style: TextStyle(
                    fontFamily: 'Digitalt',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC42AF8),
                  ),
                ),
                Text(
                  "GOLD",
                  style: TextStyle(
                    fontFamily: 'Digitalt',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC42AF8),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MoneyScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC42AF8),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Colors.white54,
                      width: 1.2,
                    ),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Monetise Now",
                  style: TextStyle(
                    fontFamily: 'Digitalt',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _couponsCard() {
    return _sectionCard(
      child: Column(
        children: [
          _headerRow("Coupons"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              children: [
                TextField(
                  controller: _couponController,
                  style: const TextStyle(fontFamily: 'Rubik'),
                  decoration: InputDecoration(
                    hintText: "Enter coupons code",
                    hintStyle: TextStyle(
                      fontFamily: 'Digitalt',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC42AF8),
                    ),
                    prefixIcon: const Icon(Icons.card_giftcard_outlined,
                        color: Color(0xFFC42AF8)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFC42AF8).withOpacity(0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: textPink.withOpacity(0.4)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ENTER COUPON CODE TO GET DISCOUNT",
                    style: TextStyle(
                      fontFamily: 'Digitalt',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textPink,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _profileInfoCard() {
    Widget fieldRow(
        {required IconData icon, required String value, bool masked = false}) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFC42AF8).withOpacity(0.5)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFFC42AF8),),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                masked ? '*' * value.length : value,
                style: const TextStyle(
                  fontFamily: 'Digitalt',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC42AF8),
                ),
              ),
            ),],
        ),
      );
    }

    return _sectionCard(
      child: Column(
        children: [
          _headerRow(
            "Profile Info",
            trailing: InkWell(
              onTap: () => _showSnack('Edit Profile tapped'),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: textPink,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                    child: Icon(Icons.edit, color: Colors.white, size: 18)),
              ),
            ),
          ),
          const SizedBox(height: 6),
          fieldRow(icon: Icons.person_outline, value: "JESSICA JOHNSON"),
          fieldRow(icon: Icons.alternate_email, value: "JESSICAJOJO24"),
          fieldRow(icon: Icons.email_outlined, value: "ABC@GMAIL.COM"),
          fieldRow(icon: Icons.lock_outline, value: "*********", masked: false),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _coloursCard() {
    return _sectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerRow(
            "Colours",
            trailing: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChooseColorScreen())),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: textPink,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                    child: Icon(Icons.edit, color: Colors.white, size: 18)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "CURRENT COLOR: PINK",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Digitalt',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC42AF8),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // same gradient as scoreboard
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(context),
              // Profile big card
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: textPink,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          // avatar with edit icon
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 44,
                                backgroundImage: const AssetImage(
                                    "lib/assets/images/settings_emoji.png"),
                              ),
                              Positioned(
                                right: -2,
                                top: -6,
                                child: InkWell(
                                  onTap: () => _showSnack('Edit avatar tapped'),
                                  child: Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.08),
                                            blurRadius: 6)
                                      ],
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.edit,
                                          size: 18, color: textPink),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          const SizedBox(height: 12),

                          // username
                          Text(
                            "Jessicajojo24",
                            style: const TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 4),

                          // email
                          Text(
                            "abc@gmail.com",
                            style: const TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // MY BALANCE
                      _myBalanceCard(),

                      // MONETISATION PLANS
                      _monetisationCard(),

                      // COUPONS
                      _couponsCard(),

                      // PROFILE INFO
                      _profileInfoCard(),

                      // COLOURS
                      _coloursCard(),

                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: const Text(
                          "CLICK THE EDIT ICON TO CHANGE COLOUR AND YOU'LL BE CHARGED FOR CHANGING COLOUR",
                          style: TextStyle(
                            fontFamily: 'Digitalt',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 6,
        left: 12,
        right: 12,
        bottom: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: textPink,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "Profile",
              style: TextStyle(
                fontFamily: "Rubik",
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
