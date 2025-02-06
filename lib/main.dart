import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  final List<Map<String, String>> participants = [
    //HOLE 1
    {"partno": "1", "name": "RENE CUERPO", "hole": "HOLE 1-A"},
    {"partno": "2", "name": "SONNY HERNANDEZ", "hole": "HOLE 1-A"},
    {"partno": "3", "name": "POGI MARIANO", "hole": "HOLE 1-A"},
    {"partno": "4", "name": "ERIC ILLESCAS", "hole": "HOLE 1-A"},
    {"partno": "1", "name": "HARRY PALTONGAN", "hole": "HOLE 1-B"},
    {"partno": "2", "name": "PENG ISTANISLAO", "hole": "HOLE 1-B"},
    {"partno": "3", "name": "VER BUCAT", "hole": "HOLE 1-B"},
    {"partno": "4", "name": "JOJO ALVAREZ", "hole": "HOLE 1-B"},

    //HOLE 2
    {"partno": "1", "name": "REY GARCIA", "hole": "HOLE 2-A"},
    {"partno": "2", "name": "ALBERT LAI", "hole": "HOLE 2-A"},
    {"partno": "3", "name": "SIM APALISOK", "hole": "HOLE 2-A"},
    {"partno": "4", "name": "CEZAR CAL", "hole": "HOLE 2-A"},
    {"partno": "1", "name": "ED FRANCISCO", "hole": "HOLE 2-B"},
    {"partno": "2", "name": "MER RODRIGUEZ", "hole": "HOLE 2-B"},
    {"partno": "3", "name": "MILO LUCENARIO", "hole": "HOLE 2-B"},
    {"partno": "4", "name": "YARLIE LIM", "hole": "HOLE 2-B"},

    //HOLE 3
    {"partno": "1", "name": "LAKAN FONACIER", "hole": "HOLE 3-A"},
    {"partno": "2", "name": "JUAN PAULO CANLAS", "hole": "HOLE 3-A"},
    {"partno": "3", "name": "AMIEL JUBILAN", "hole": "HOLE 3-A"},
    {"partno": "4", "name": "RAYMUND DALANGIN", "hole": "HOLE 3-A"},
    {"partno": "1", "name": "JOHNNY GUITERREZ", "hole": "HOLE 3-B"},
    {"partno": "2", "name": "ALEX SUELILA", "hole": "HOLE 3-B"},
    {"partno": "3", "name": "BENJO BERNARDO", "hole": "HOLE 3-B"},
    {"partno": "4", "name": "EGAY DA ROSAS", "hole": "HOLE 3-B"},

    //HOLE 4
    {"partno": "1", "name": "JULIUS DRILON", "hole": "HOLE 4-A"},
    {"partno": "2", "name": "ROMEO REYES", "hole": "HOLE 4-A"},
    {"partno": "3", "name": "MICHAEL DRILON", "hole": "HOLE 4-A"},
    {"partno": "4", "name": "SAMANTHA DRILON", "hole": "HOLE 4-A"},
    {"partno": "1", "name": "BIANCO MARIANO", "hole": "HOLE 4-B"},
    {"partno": "2", "name": "ALJHEN SUELILA", "hole": "HOLE 4-B"},
    {"partno": "3", "name": "DIONE RAMOS", "hole": "HOLE 4-B"},
    {"partno": "4", "name": "CB ROARO", "hole": "HOLE 4-B"},

    //HOLE 5
    {"partno": "1", "name": "CALOY REYES", "hole": "HOLE 5-A"},
    {"partno": "2", "name": "JIGGY GARCIA", "hole": "HOLE 5-A"},
    {"partno": "3", "name": "MANNY CABUNGCAL", "hole": "HOLE 5-A"},
    {"partno": "4", "name": "GERRY GONZALEZ", "hole": "HOLE 5-A"},
    {"partno": "1", "name": "ELMO SAN DIEGO SR.", "hole": "HOLE 5-B"},
    {"partno": "2", "name": "GEORGE REGIS", "hole": "HOLE 5-B"},
    {"partno": "3", "name": "JUN FERRER", "hole": "HOLE 5-B"},
    {"partno": "4", "name": "PINGOY LAGUMBAY", "hole": "HOLE 5-B"},
    {"partno": "1", "name": "ALEX PAPA", "hole": "HOLE 5-C"},
    {"partno": "2", "name": "JULES CHANCO", "hole": "HOLE 5-C"},
    {"partno": "3", "name": "HECTOR MAGPANTAY", "hole": "HOLE 5-C"},
    {"partno": "4", "name": "TOTI ISIP", "hole": "HOLE 5-C"},

    //HOLE 6
    {"partno": "1", "name": "AYEE BEECH", "hole": "HOLE 6-A"},
    {"partno": "2", "name": "WILLIAM VALO", "hole": "HOLE 6-A"},
    {"partno": "3", "name": "CHRIS DAVIES", "hole": "HOLE 6-A"},
    {"partno": "4", "name": "GREG FIGUEROA", "hole": "HOLE 6-A"},
    {"partno": "1", "name": "ALEX GORNE", "hole": "HOLE 6-B"},
    {"partno": "2", "name": "OGENG PALASIGUE", "hole": "HOLE 6-B"},
    {"partno": "3", "name": "DING MAULEON", "hole": "HOLE 6-B"},
    {"partno": "4", "name": "EDDIE CHEANG", "hole": "HOLE 6-B"},

    //HOLE 7
    {"partno": "1", "name": "AGNES ILLESCAS", "hole": "HOLE 7-A"},
    {"partno": "2", "name": "STEPHANIE MELENDRES", "hole": "HOLE 7-A"},
    {"partno": "3", "name": "JOY MEGUITO", "hole": "HOLE 7-A"},
    {"partno": "4", "name": "NEIL MENGUITO", "hole": "HOLE 7-A"},
    {"partno": "1", "name": "DAN TOLENTINO", "hole": "HOLE 7-B"},
    {"partno": "2", "name": "DONG GO", "hole": "HOLE 7-B"},
    {"partno": "3", "name": "JUN LANDAYAN", "hole": "HOLE 7-B"},
    {"partno": "4", "name": "TONY CALVELO", "hole": "HOLE 7-B"},

    //HOLE 8
    {"partno": "1", "name": "RAMONY SY", "hole": "HOLE 8-A"},
    {"partno": "2", "name": "OLIVER SALUD", "hole": "HOLE 8-A"},
    {"partno": "3", "name": "PATRICK BAGSIK", "hole": "HOLE 8-A"},
    {"partno": "4", "name": "PORFIRIO BAGSIK JR.", "hole": "HOLE 8-A"},
    {"partno": "1", "name": "ANDY HIRANG", "hole": "HOLE 8-B"},
    {"partno": "2", "name": "EDDIE COLLADO", "hole": "HOLE 8-B"},
    {"partno": "3", "name": "DAN JAVIER", "hole": "HOLE 8-B"},
    {"partno": "4", "name": "SUY MINIGAWA", "hole": "HOLE 8-B"},

    //HOLE 9
    {"partno": "1", "name": "LEE LONGA", "hole": "HOLE 9-A"},
    {"partno": "2", "name": "WINSTON GINEZ", "hole": "HOLE 9-A"},
    {"partno": "3", "name": "ALVIN JADE RIVANO", "hole": "HOLE 9-A"},
    {"partno": "4", "name": "REMAUR MIRO", "hole": "HOLE 9-A"},
    {"partno": "1", "name": "MAI GONZALEZ", "hole": "HOLE 9-B"},
    {"partno": "2", "name": "BERNARD JAO", "hole": "HOLE 9-B"},
    {"partno": "3", "name": "NOEL ISIP", "hole": "HOLE 9-B"},
    {"partno": "4", "name": "MARTIN CASTRO", "hole": "HOLE 9-B"},

    //HOLE 10
    {"partno": "1", "name": "RAMIR ENCABO", "hole": "HOLE 10-A"},
    {"partno": "2", "name": "ABEL PANGAN", "hole": "HOLE 10-A"},
    {"partno": "3", "name": "MERK LIMBO", "hole": "HOLE 10-A"},
    {"partno": "4", "name": "ARON FRANCISCO", "hole": "HOLE 10-A"},
    {"partno": "1", "name": "MAX CAVEL", "hole": "HOLE 10-B"},
    {"partno": "2", "name": "IKE YUSINGCO", "hole": "HOLE 10-B"},
    {"partno": "3", "name": "MEL LATINAZO", "hole": "HOLE 10-B"},
    {"partno": "4", "name": "GERRY GUERRERO", "hole": "HOLE 10-B"},

    //HOLE 11
    {"partno": "1", "name": "DAN YATCO", "hole": "HOLE 11-A"},
    {"partno": "2", "name": "ARNEL LAGAREJOS", "hole": "HOLE 11-A"},
    {"partno": "3", "name": "ARNEL ESTACIO", "hole": "HOLE 11-A"},
    {"partno": "4", "name": "IRENE DEL ROSARIO", "hole": "HOLE 11-A"},
    {"partno": "1", "name": "ELMO SAN DIEGO JR.", "hole": "HOLE 11-B"},
    {"partno": "2", "name": "JAMES REYES", "hole": "HOLE 11-B"},
    {"partno": "3", "name": "MON ISIP", "hole": "HOLE 11-B"},
    {"partno": "4", "name": "CHARLIE ISIP", "hole": "HOLE 11-B"},

    //HOLE 12
    {"partno": "1", "name": "DAN CUERPO", "hole": "HOLE 12-A"},
    {"partno": "2", "name": "JOEL PINEDA", "hole": "HOLE 12-A"},
    {"partno": "3", "name": "RAMIR TIAMZON", "hole": "HOLE 12-A"},
    {"partno": "4", "name": "DINO CREZO", "hole": "HOLE 12-A"},
    {"partno": "1", "name": "PAULO AGUILAR", "hole": "HOLE 12-B"},
    {"partno": "2", "name": "MIKE ANTONIO", "hole": "HOLE 12-B"},
    {"partno": "3", "name": "BONA MORALES", "hole": "HOLE 12-B"},
    {"partno": "4", "name": "PAUL REYES", "hole": "HOLE 12-B"},

    //HOLE 13
    {"partno": "1", "name": "WILLIE MANAHAN", "hole": "HOLE 13-A"},
    {"partno": "2", "name": "JR CENIZA", "hole": "HOLE 13-A"},
    {"partno": "3", "name": "RIO VENTURANZA", "hole": "HOLE 13-A"},
    {"partno": "4", "name": "WALER VILLANUEVA", "hole": "HOLE 13-A"},
    {"partno": "1", "name": "JON CASTELO", "hole": "HOLE 13-B"},
    {"partno": "2", "name": "DEO MAGNAYON", "hole": "HOLE 13-B"},
    {"partno": "3", "name": "BARBIE FRANCISCO", "hole": "HOLE 13-B"},
    {"partno": "4", "name": "ORLY FRANCISCO", "hole": "HOLE 13-B"},

    //HOLE 14
    {"partno": "1", "name": "DANNY ESCARES", "hole": "HOLE 14-A"},
    {"partno": "2", "name": "ED MANZANARES", "hole": "HOLE 14-A"},
    {"partno": "3", "name": "LYNA ARBEJO", "hole": "HOLE 14-A"},
    {"partno": "4", "name": "DIANNE ABELLA", "hole": "HOLE 14-A"},
    {"partno": "1", "name": "ALLAN DELA CRUZ", "hole": "HOLE 14-B"},
    {"partno": "2", "name": "JASON CHUA", "hole": "HOLE 14-B"},
    {"partno": "3", "name": "MARC ALAIN ONG", "hole": "HOLE 14-B"},
    {"partno": "4", "name": "PATRICK CHUA", "hole": "HOLE 14-B"},

    //HOLE 15
    {"partno": "1", "name": "ALDRIN TOLENTION", "hole": "HOLE 15-A"},
    {"partno": "2", "name": "ARNEL CAMACHO", "hole": "HOLE 15-A"},
    {"partno": "3", "name": "OSCAR CRUZ", "hole": "HOLE 15-A"},
    {"partno": "4", "name": "TOFFI SUMULONG", "hole": "HOLE 15-A"},
    {"partno": "1", "name": "DANNY ROBLES", "hole": "HOLE 15-B"},
    {"partno": "2", "name": "MARK FRANCISCO", "hole": "HOLE 15-B"},
    {"partno": "3", "name": "MIKE ACERO", "hole": "HOLE 15-B"},
    {"partno": "4", "name": "LARRY UMALI", "hole": "HOLE 15-B"},

    //HOLE 16
    {"partno": "1", "name": "TONY SALVADOR", "hole": "HOLE 16-A"},
    {"partno": "2", "name": "RENE CENIZA", "hole": "HOLE 16-A"},
    {"partno": "3", "name": "JR BRION", "hole": "HOLE 16-A"},
    {"partno": "4", "name": "JOHN SICAT", "hole": "HOLE 16-A"},
    {"partno": "1", "name": "CALOY VIGARE", "hole": "HOLE 16-B"},
    {"partno": "2", "name": "DJ MACOMB", "hole": "HOLE 16-B"},
    {"partno": "3", "name": "ERWIN BALDERAMA", "hole": "HOLE 16-B"},
    {"partno": "4", "name": "BERT TAGAYUNA", "hole": "HOLE 16-B"},

    //HOLE 17
    {"partno": "1", "name": "DERICK VILLANUEVA", "hole": "HOLE 17-A"},
    {"partno": "2", "name": "PAULO HERNANDEZ", "hole": "HOLE 17-A"},
    {"partno": "3", "name": "GIO PASION", "hole": "HOLE 17-A"},
    {"partno": "4", "name": "CHRISTOPHER VIDALLION", "hole": "HOLE 17-A"},
    {"partno": "1", "name": "AMON LADEZA", "hole": "HOLE 17-B"},
    {"partno": "2", "name": "BUDS NERO", "hole": "HOLE 17-B"},
    {"partno": "3", "name": "FERDIE ALARILLA", "hole": "HOLE 17-B"},
    {"partno": "4", "name": "REY LEGASPI", "hole": "HOLE 17-B"},

    //HOLE 18
    {"partno": "1", "name": "JOSEPH BEJERANO", "hole": "HOLE 18-A"},
    {"partno": "2", "name": "RECHELL BULANDOZ", "hole": "HOLE 18-A"},
    {"partno": "3", "name": "WILLIE GONZALES", "hole": "HOLE 18-A"},
    {"partno": "4", "name": "JOEY DE DIOS", "hole": "HOLE 18-A"},
    {"partno": "1", "name": "PAT NAVARRO", "hole": "HOLE 18-B"},
    {"partno": "2", "name": "NEMS NAVARRO", "hole": "HOLE 18-B"},
    {"partno": "3", "name": "JUSTIN DIVINIGARCIA", "hole": "HOLE 18-B"},
    {"partno": "4", "name": "MIGUEL BARRETO", "hole": "HOLE 18-B"},
    {"partno": "1", "name": "ANDREW GOPEZ", "hole": "HOLE 18-C"},
    {"partno": "2", "name": "RONNEL RODRIGUEZ", "hole": "HOLE 18-C"},
    {"partno": "3", "name": "LOUIE MELENDRES", "hole": "HOLE 18-C"},
    {"partno": "4", "name": "RAEFEL ROXAS", "hole": "HOLE 18-C"},
  ];

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
          content: const Text("The name you entered is not in the list. Please type your full name correctly."),
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
              child: Container(
                width: screenWidth * 0.7, // Scale width dynamically
                padding: EdgeInsets.all(screenWidth * 0.02), // Scale padding
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png', height: screenHeight * 0.1),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'E.M. CUERPO\n10TH INTERNATIONAL GOLF CUP\n(NORTH COURSE)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    _buildSearchField(screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    _buildButtonRow(screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      "RESULTS",
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildResultField("Participant No.", _participantNo, screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    _buildResultField("Participant Name", _participantName, screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    _buildResultField("Hole Number", _holeNo, screenWidth),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(double screenWidth) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        hintText: "Enter name (e.g. Juan Cruz)",
        contentPadding: EdgeInsets.all(screenWidth * 0.02),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(fontSize: screenWidth * 0.03),
    );
  }

  Widget _buildButtonRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _searchParticipant,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.015,
              horizontal: screenWidth * 0.05,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
          ),
          child: Text(
            "Search",
            style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.white),
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        ElevatedButton(
          onPressed: _clearSearch,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.015,
              horizontal: screenWidth * 0.05,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
          ),
          child: Text(
            "Clear",
            style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildResultField(String label, String result, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(screenWidth * 0.025),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            border: Border.all(color: Colors.black54),
          ),
          child: Text(
            result,
            style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
