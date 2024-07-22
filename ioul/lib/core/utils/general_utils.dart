// ignore_for_file: library_prefixes
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:image/image.dart' as img hide Color;
import 'package:ioul/core/core.dart';
import 'dart:math';

class GeneralUtils {
  static String removeUnderScoreFromString(String label) {
    return label.replaceAll("_", " ");
  }

  static String removeCommasFromNumber(String amount) {
    return amount.replaceAll(",", "");
  }

  static roundToNextHigherNumber(double number) {
    int roundedNumber = number.ceil();

    double roundedDouble = roundedNumber.toDouble();
    return roundedDouble;
  }

  static String removeDotsFromNumber(String amount) {
    return amount.replaceAll(".", "");
  }

  static String capitalizeText(String str) {
    if (str.isNotEmpty) {
      str = str.splitMapJoin(RegExp(r'\w+'),
          onMatch: (m) =>
              '${m.group(0)}'.substring(0, 1).toUpperCase() +
              '${m.group(0)}'.substring(1).toLowerCase(),
          onNonMatch: (n) => ' ');
    }
    return str;
  }

  void printLongString(String str, {int chunkSize = 800}) {
    int startIndex = 0;
    while (startIndex < str.length) {
      int endIndex = startIndex + chunkSize;
      if (endIndex > str.length) {
        endIndex = str.length;
      }
      // print(str.substring(startIndex, endIndex));
      startIndex = endIndex;
    }
  }

  /// the current time, in “seconds since the epoch”
  static int currentTimeInSeconds() {
    var ms = (DateTime.now()).millisecondsSinceEpoch;
    return ms;
    //return (ms / 1000).round();
  }

  // static double toNDecimalPlaces(double value, int n){
  //   String newValue = value.toStringAsFixed(n);
  //   return double.parse(newValue);
  // }
  static double toNDecimalPlaces(double value, int n) {
    final num scale = pow(10, n);
    return (value * scale).round() / scale;
  }

  /// convert to 2 decimal places
  static double dp2(double val) {
    num mod = pow(10.0, 3);
    return ((val * mod).round().toDouble() / mod);
  }

  static Color colorForText(String text) {
    var hash = 0;
    for (var i = 0; i < text.length; i++) {
      hash = text.codeUnitAt(i) + ((hash << 3) - hash);
    }
    final finalHash = hash.abs() % (256 * 256 * 256);
    final red = ((finalHash & 0xFF0000) >> 16);
    final blue = ((finalHash & 0xFF00) >> 8);
    final green = ((finalHash & 0xFF));
    final color = Color.fromRGBO(red, green, blue, 1);
    return color;
  }

  static int colorHash(String text) {
    var hash = 0;
    for (var i = 0; i < text.length; i++) {
      hash = text.codeUnitAt(i) + ((hash << 3) - hash);
    }
    final finalHash = hash.abs() % (256 * 256 * 256);
    return finalHash;
  }

  static String getFormattedNumber(num value) {
    return NumberFormat.compact().format(value);
  }

  // 2. compress file and get file.

  // static Future<File> compressAndGetFile(File file, String tempFolioId) async {
  //   Directory parentDirectoryPath = file.parent;
  //   String targetFilePath = //file.path;
  //       "${parentDirectoryPath.absolute.path}/$tempFolioId.png";
  //   // print("new path: $targetFilePath");
  //   // print("unique id for png images: $tempFolioId");
  //
  //   // Read a jpeg image from file.
  //   img.Image? image = img.decodeImage(file.readAsBytesSync());
  //
  //   // Resize the image to a 500x? thumbnail (maintaining the aspect ratio).
  //   img.Image thumbnail = img.copyResize(image!, width: 200);
  //
  //   // Save the thumbnail as a PNG.
  //   var newFile = Io.File(targetFilePath)
  //     ..writeAsBytesSync(img.encodePng(thumbnail));
  //
  //   ///remove the old file
  //   // if (await file.exists()) {
  //   //   await file.delete();
  //   // }
  //   // print(newFile);
  //   return newFile;
  // }

  static Future<File> compressAndGetFile(File file, String tempFolioId) async {
    Directory parentDirectoryPath = file.parent;
    String targetFilePath =
        "${parentDirectoryPath.absolute.path}/$tempFolioId.png";

    // Read the image from file.
    img.Image? image = img.decodeImage(await file.readAsBytes());

    // Resize the image to a desired width (maintaining the aspect ratio).
    int desiredWidth = 200;
    img.Image thumbnail = img.copyResize(image!, width: desiredWidth);

    // Save the thumbnail as a PNG.
    await File(targetFilePath).writeAsBytes(img.encodePng(thumbnail));

    // Optionally, you can remove the old file.
    // if (await file.exists()) {
    //   await file.delete();
    // }

    return File(targetFilePath);
  }

  static String getNigerianIdCardNumber(List<String> extracts) {
    String pattern = r'(^[0-9]{4}\s[0-9]{4}\s[0-9]{4}\s[0-9]{4}$)';
    String cardNumber = "";
    RegExp regExp = RegExp(pattern);
    for (String data in extracts) {
      if (regExp.hasMatch(data)) {
        cardNumber = data;
        break;
      }
    }
    return cardNumber;
  }

  static bool areListsEqual(var list1, var list2) {
    // check if both are lists
    if (!(list1 is List && list2 is List)
        // check if both have same length
        ||
        list1.length != list2.length) {
      return false;
    }

    // check if elements are equal
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }

    return true;
  }

  Map<String, double> expressionValues(String value) {
    var values = value.split(";");
    Map<String, double> mapValues = {};
    for (String expressionWithValue in values) {
      var newValue = expressionWithValue.split("=");
      mapValues[newValue[0].trim()] =
          double.parse(newValue[1].trim()).toPrecision(3);
    }
    return mapValues;
  }

  bool isMale(double maleValue, double femaleValue) {
    return maleValue > femaleValue;
  }

  bool isSmiling(double smilingValue) {
    double thresholdValue = 0.5;
    return smilingValue >= thresholdValue;
  }

  bool isLiveliness(double livelinessValue) {
    double thresholdValue = 0.9;
    return livelinessValue >= thresholdValue;
  }

  Future<File> convertToBlackAndWhite(File file) async {
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    final blackAndWhiteImage = img.grayscale(image!);
    String targetFaceCropFilePath = "/storage/emulated/0/Download/";
    final blackAndWhiteFile = File('${targetFaceCropFilePath}_bw.png')
      ..writeAsBytesSync(img.encodePng(blackAndWhiteImage));
    return blackAndWhiteFile;
  }

  Future<File> lightenImage(String filePath) async {
    File originalImageFile =
        File(filePath); // Replace with the actual path to your image file
    img.Image? originalImage =
        img.decodeImage(originalImageFile.readAsBytesSync());

// Lighten the image by increasing the brightness
    img.Image lightenedImage = img.adjustColor(originalImage!,
        brightness: 50); // Adjust the brightness value as per your requirement
    const path = "/storage/emulated/0/Download/";
    File lightenedImageFile = File(
        '$path${DateTime.now().microsecondsSinceEpoch}.png'); // Replace with the desired path to save the lightened image
    lightenedImageFile.writeAsBytesSync(img.encodePng(lightenedImage));
    // print("path: ${lightenedImageFile.path}");
    return lightenedImageFile;
  }

  double eyesOpenProbability(String value) {
    var map = expressionValues(value);
    return map["EyesOpen"] ?? 0.0;
  }
}
