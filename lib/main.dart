import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Golf Cup Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const GolfCupScreen(),
    );
  }
}

class GolfCupScreen extends StatefulWidget {
  const GolfCupScreen({super.key});

  @override
  _GolfCupScreenState createState() => _GolfCupScreenState();
}

class _GolfCupScreenState extends State<GolfCupScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _participantNo = "-";
  String _participantName = "-";
  String _holeNo = "-";

  late final AudioPlayer _audioPlayer;

  final List<Map<String, String>> participants = [
    // HOLE 1
    {"partno": "1", "name": "RENE CUERPO", "hole": "HOLE 1 - GROUP A"},
    {"partno": "2", "name": "SONNY HERNANDEZ", "hole": "HOLE 1 - GROUP A"},
    {"partno": "3", "name": "POGI MARIANO", "hole": "HOLE 1 - GROUP A"},
    {"partno": "4", "name": "ERIC ILLESCAS", "hole": "HOLE 1 - GROUP A"},
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playBackgroundMusic();
  }

  Future<void> _playBackgroundMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop); // Keep looping the music
    await _audioPlayer.play(AssetSource('background.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _searchParticipant() {
    String searchName = _searchController.text.toUpperCase();
    var result = participants.firstWhere(
          (participant) => participant["name"] == searchName,
      orElse: () => {"partno": "-", "name": "Not Found", "hole": "-"},
    );

    setState(() {
      _participantNo = result["partno"]!;
      _participantName = result["name"]!;
      _holeNo = result["hole"]!;
    });

    if (result["name"] == "Not Found") {
      _showNotFoundDialog();
    }
  }

  void _showNotFoundDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Participant Not Found"),
          content: const Text(
              "The name you entered is not in the list. Please type your full name correctly."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _participantNo = "-";
      _participantName = "-";
      _holeNo = "-";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // WHITE CONTAINER FOR BANNER
                  Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/banner.png',
                            height: screenHeight * 0.25),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015), // Closer spacing

                  // GREEN CONTAINER FOR SEARCH & RESULTS
                  Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    decoration: BoxDecoration(
                      color: const Color(0xFFafc85c),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSearchField(),
                        SizedBox(height: screenHeight * 0.02),
                        _buildButtonRow(),
                        SizedBox(height: screenHeight * 0.03),

                        SizedBox(height: screenHeight * 0.02),
                        _buildResultField("Participant No.", _participantNo),
                        SizedBox(height: screenHeight * 0.02),
                        _buildResultField("Participant Name", _participantName),
                        SizedBox(height: screenHeight * 0.02),
                        _buildResultField("Hole Number & Group", _holeNo),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Match result fields
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Full Name (e.g. Juan Dela Cruz)",
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Match result fields
            borderSide: BorderSide.none, // Remove border
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: _searchParticipant, child: const Text("Search")),
        const SizedBox(width: 10),
        ElevatedButton(onPressed: _clearSearch, child: const Text("Clear")),
      ],
    );
  }

  Widget _buildResultField(String label, String result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(result, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
