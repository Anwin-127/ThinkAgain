import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the google_fonts package
import '../core/constants.dart';
import '../core/styles.dart';
import 'decision_input_page.dart';
import '../widgets/complication_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showInstructions = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showInstructions = true;
      });
    });
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.tealAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Information',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Made by Convincing Stars',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextButton(
                  child: Text(
                    'OK',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle, style: GoogleFonts.poppins(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.tealAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Colors.white),
            onPressed: _showInfoDialog, // Show dialog on press
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.teal[50],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _showInstructions ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'Follow the instructions below to make your decision.',
                    style: GoogleFonts.poppins(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: _showInstructions ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'Welcome to ThinkAgain!',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal, Colors.tealAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DecisionInputPage()),
                      );
                    },
                    child: Text('Start Overthinking', style: GoogleFonts.poppins(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ComplicationSlider(),
                AnimatedOpacity(
                  opacity: _showInstructions ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'Choose your level of Overthinking.',
                    style: GoogleFonts.poppins(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ), // Include the ComplicationSlider here
              ],
            ),
          ),
        ),
      ),
    );
  }
}