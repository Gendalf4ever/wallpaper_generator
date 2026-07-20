import 'package:file_selector/file_selector.dart';

class Filepicker {
  /// Only txt files selection
  static Future<String?> pickTxtFile() async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'Text files',
      extensions: ['txt'],
    );
    final XFile? file = await openFile(acceptedTypeGroups: [typeGroup]);
    return file?.path;
  }

  ///Images selection
  static Future<String?> pickImagesFolder() async {
    final String? directoryPath = await getDirectoryPath();
    return directoryPath;
  }
}