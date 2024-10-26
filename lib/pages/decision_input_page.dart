import 'package:flutter/material.dart';
import '../core/styles.dart';
import '../services/decision_analysis_service.dart';

class DecisionInputPage extends StatefulWidget {
  @override
  _DecisionInputPageState createState() => _DecisionInputPageState();
}

class _DecisionInputPageState extends State<DecisionInputPage> {
  final TextEditingController _controller = TextEditingController();
  String _analysisResult = "";
  bool _isLoading = false;

  Future<void> _getDecisionAnalysis() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final result = await DecisionAnalysisService.getDecisionAnalysis(_controller.text);
      setState(() {
        _analysisResult = result;
      });
    } catch (e) {
      setState(() {
        _analysisResult = "Error fetching analysis. Please try again.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Your Decision', style: AppStyles.textTheme.titleMedium),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.tealAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'What decision are you agonizing over?',
                style: AppStyles.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter your decision',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.teal[200]?.withOpacity(0.1),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                ),
                maxLines: 3,
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
                  onPressed: _getDecisionAnalysis,
                  child: Text('Analyze Decision', style: AppStyles.textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    elevation: 0, backgroundColor: Colors.transparent, // Remove default elevation
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18), // Make background transparent to show gradient
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_isLoading)
                Center(child: CircularProgressIndicator())
              else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    _analysisResult,
                    style: AppStyles.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}