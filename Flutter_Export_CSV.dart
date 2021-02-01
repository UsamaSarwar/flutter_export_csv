import 'dart:io';

main() {
  // Input Data for CSV file i.e. Usama Sarwar, Pakistan, facebook.com/UsamaSarwarOfficial, youtube.com/UsamaSarwar, instagram.com/UsamaSarwarOfficial, 
  String data;
  // Location Path where you want to export CSV File
  String location = './';
  // CSV File name
  String name = 'file';
  // prompt for file input
  stdout.write('Enter Comma Separated Values (CSV): ');
  // Saving data into local variable
  data = stdin.readLineSync()!;
  // Calling exportCSV Function
  exportCSV(
    commaSeparatedValues: data,
    downloadLocation: location,
    fileName: name,
  );
}

exportCSV({commaSeparatedValues, downloadLocation, fileName}) {
  var file = new File(downloadLocation + fileName + '.csv');
  file.create();
  try {
    file.writeAsStringSync(commaSeparatedValues.toString() + '\n',
        mode: FileMode.append);
    print(
        '$fileName.csv is successfully downloaded to $downloadLocation$fileName.csv');
  } catch (e) {
    print('Failed due to error: ${e.toString}');
  }
}
