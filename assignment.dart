import 'dart:io';
import 'dart:convert';

class TextUtility {
  // String Manipulation 🔤✨
  String concatenate(String str1, String str2) => "$str1 $str2";

  String reverse(String input) => input.split('').reversed.join();

  String toggleCase(String input) {
    return input.split('').map((char) {
      return char == char.toUpperCase()
          ? char.toLowerCase()
          : char.toUpperCase();
    }).join();
  }
}

class CollectionManager {
  // Collections 📊
  List<String> storeInList(List<String> items) => items;

  Set<String> removeDuplicates(List<String> items) => items.toSet();

  Map<String, int> countOccurrences(List<String> items) {
    return {for (var item in items) item: items.where((x) => x == item).length};
  }
}

class FileManager {
  // File Handling 📂✍️
  Future<void> readAndWrite(String inputFile, String outputFile) async {
    try {
      String data = await File(inputFile).readAsString();
      await File(outputFile).writeAsString("Modified Data:\n$data");
      print("File successfully written to $outputFile");
    } on FileSystemException catch (e) {
      print("File error: ${e.message}");
    }
  }
}

class DateTimeUtility {
  // Date and Time ⏳🗓️
  String formatDate(DateTime date) => date.toIso8601String();

  Duration calculateDifference(DateTime start, DateTime end) =>
      end.difference(start);
}

// Modular Application 💡
class TextOrganizerApp {
  final TextUtility textUtility = TextUtility();
  final CollectionManager collectionManager = CollectionManager();
  final FileManager fileManager = FileManager();
  final DateTimeUtility dateTimeUtility = DateTimeUtility();

  Future<void> run() async {
    print("Welcome to Text Organizer! 🚀");

    String concatenated = textUtility.concatenate("Hello", "World");
    print("Concatenated: $concatenated");

    String reversed = textUtility.reverse("Dart");
    print("Reversed: $reversed");

    String toggled = textUtility.toggleCase("DaRt Is AwEsOmE");
    print("Toggle Case: $toggled");

    List<String> items = ["apple", "banana", "apple", "cherry"];
    print("List: ${collectionManager.storeInList(items)}");
    print("Set (Unique): ${collectionManager.removeDuplicates(items)}");
    print("Occurrences: ${collectionManager.countOccurrences(items)}");

    print("\nFile Handling in Progress...");
    await fileManager.readAndWrite("input.txt", "output.txt");

    DateTime now = DateTime.now();
    DateTime future = now.add(Duration(days: 10));
    print("Current Date: ${dateTimeUtility.formatDate(now)}");
    print(
        "Difference in Days: ${dateTimeUtility.calculateDifference(now, future).inDays}");

    print("\nThank you for using Text Organizer!");
  }
}

// Testing the Application
void main() async {
  final app = TextOrganizerApp();
  await app.run();
}
 
