import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

// Model class to represent a Quran edition
class Edition {
  final String name;
  final String language;
  final String type;
  final String source; // Add source
  final String comments; // Add comments
  final String link; // Add link

  Edition({
    required this.name,
    required this.language,
    required this.type,
    required this.source,
    required this.comments,
    required this.link,
  });

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
      name: json['name'] ?? 'Unknown',
      language: json['language'] ?? 'Unknown',
      type: json['type'] ?? 'Unknown',
      source: json['source'] ?? 'N/A',
      comments: json['comments'] ?? 'No comments available',
      link: json['link'] ?? 'No link available',
    );
  }
}

class Apicall {
  Future<List<Edition>?> fetchData() async {
    final url = Uri.parse(
        "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions.json");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        return List<Edition>.from(
          jsonData.values.map((edition) => Edition.fromJson(edition)),
        );
      } else {
        print("Response status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future fetchchdta(Url) async {
    final url = Uri.parse(Url);
    print(url);
  }
}
