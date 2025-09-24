import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jol_app/screens/play/paly_screen.dart';
import 'package:jol_app/screens/play/submit_game_screen.dart';

/// =================== FinishGameDialog ===================
class FinishGameDialog extends StatelessWidget {
  const FinishGameDialog({super.key});

  static const Color textBlue = Color(0xFF0734A5);
  static const Color textPink = Color(0xFFC42AF8);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                const Text(
                  'Finish Game',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    fontFamily: 'Digitalt',
                  ),
                ),
                const SizedBox(height: 12),

                // Subtitle
                const Text(
                  'Do you wish to end your game and check score?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),

                // Buttons Row
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () => Navigator.of(context).pop(false), // Resume
                        child: const Text(
                          'Resume',
                          style: TextStyle(
                          fontFamily: 'Digitalt',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textPink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SubmitGameScreen())),
                        child: const Text(
                          'Check Score',
                          style: TextStyle(
                            fontFamily: 'Digitalt',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Top image
          Positioned(
            top: -40,
            child: Image.asset(
              'lib/assets/images/settings_emoji.png', // your asset
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}

/// =================== GameScreen ===================
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const Color textBlue = Color(0xFF0734A5);
  static const Color textGreen = Color(0xFF43AC45);
  static const Color textPink = Color(0xFFF82A87);

  int gridSize = 6; // default 6x6
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _generateControllers();
  }

  void _generateControllers() {
    _controllers =
        List.generate(gridSize * gridSize, (_) => TextEditingController());
  }

  void _updateGridSize(int size) {
    setState(() {
      gridSize = size;
      _generateControllers();
    });
  }

  Future<void> _onBackPressed() async {
    final result = await showDialog(
      context: context,
      builder: (context) => const FinishGameDialog(),
    );

    if (result == true) {
      // User clicked "Check Score"
      Navigator.pop(context); // exit game screen
      // You could also navigate to a score screen here
    }
    // if false → Resume, do nothing
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    InkWell(
                      onTap: _onBackPressed, // show dialog instead of direct pop
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: textPink,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Game",
                      style: TextStyle(
                        fontFamily: "Rubik",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => showSettingsDialog(context),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: textGreen,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              /// Time & Score
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: textPink,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Time Left: 04:37",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Score: 24/0",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// Level selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LevelSelector(
                  levels: [
                    "4 BOXES",
                    "5 BOXES",
                    "6 BOXES",
                    "7 BOXES",
                    "8 BOXES",
                  ],
                  initialLevel: "6 BOXES",
                  onLevelChanged: (level) {
                    final size = int.parse(level.split(" ")[0]);
                    _updateGridSize(size);
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// Grid of boxes
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    itemCount: gridSize * gridSize,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridSize,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1, // ✅ ensures perfect squares
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          decoration: BoxDecoration(
                            color: textPink,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }

                      return TextField(
                        controller: _controllers[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                              color: textPink,
                              width: 2,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),


              /// Submit button
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SubmitGameScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: textBlue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Check & Submit Score",
                      style: TextStyle(
                        fontFamily: "Rubik",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
}

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  double volume = 0.5;
  double music = 0.5;
  bool hapticEnabled = true;

  // Colors from your palette
  static const Color textPink = Color(0xFFC42AF8);
  static const Color textGreen = Color(0xFF43AC45);
  static const Color textBlue = Color(0xFF0734A5);
  static const Color settingsOrange = Color(0xFFF47A62);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: settingsOrange,
                  ),
                ),
                const SizedBox(height: 20),

                // Volume Slider
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center, // center horizontally
                  children: [
                    const Icon(Icons.volume_up, color: textPink),
                    const SizedBox(width: 12), // spacing between icon & slider
                    SizedBox(
                      width: 200,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 16,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                          overlayShape: SliderComponentShape.noOverlay,
                        ),
                        child: Slider(
                          value: volume,
                          onChanged: (value) => setState(() => volume = value),
                          activeColor: textPink,
                          inactiveColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

// Music Slider
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center, // center horizontally
                  children: [
                    const Icon(Icons.music_note_outlined, color: textGreen),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 200,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 16,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                          overlayShape: SliderComponentShape.noOverlay,
                        ),
                        child: Slider(
                          value: music,
                          onChanged: (value) => setState(() => music = value),
                          activeColor: textGreen,
                          inactiveColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Haptic Feedback toggle with ON/OFF text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'HAPTIC FEEDBACK',
                      style: const TextStyle(
                        fontFamily: 'Digitalt',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: textBlue,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          hapticEnabled ? 'ON' : 'OFF',
                          style: const TextStyle(
                            fontFamily: 'Digitalt',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: textBlue,
                          ),
                        ),
                        Switch(
                          value: hapticEnabled,
                          onChanged: (value) =>
                              setState(() => hapticEnabled = value),
                          activeColor: Colors.white,
                          activeTrackColor: textBlue,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Close button
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: textPink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'CLOSE',
                      style: TextStyle(
                        fontFamily: 'Digitalt',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Top image
          Positioned(
            top: -40,
            child: Image.asset(
              'lib/assets/images/settings_emoji.png',
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}

void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const SettingsDialog(),
  );
}