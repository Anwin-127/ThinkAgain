import 'dart:convert';
import 'package:http/http.dart' as http;

class DecisionAnalysisService {
  static Future<String> getDecisionAnalysis(String decision) async {
    final url = Uri.parse("http://192.168.47.84:5000/chat");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"topic": decision}),
    );

    if (response.statusCode == 200) {
      try {
        final data = response.body.substring(14, (response.body).length-2);
        return data?? "No analysis available.";
      } catch (e) {
        return "Failed to parse response: ${e.toString()}";
      }
    } else {
      throw Exception("Failed to load analysis");
    }
  }

}
