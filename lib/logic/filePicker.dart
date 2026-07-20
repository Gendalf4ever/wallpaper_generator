import 'package:file_picker/file_picker.dart';

class Filepicker {
  // txt selection
  Future<String?> pickTxtFile() async { 
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );
    if (result != null && result.files.single.path != null) {
      return result.files.single.path;
    }
    return null;
  }

  // folder selection
  Future<String?> pickImagesFolder() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      return selectedDirectory;
    }
    return null;
  }
}