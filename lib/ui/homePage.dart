import 'package:flutter/material.dart';
import 'package:wallpaper_generator/logic/filePicker.dart';
import 'customButton.dart';
import 'visualSettings.dart';


class HomePage extends StatefulWidget {
  final VoidCallback onThemeChanged;

  const HomePage({required this.onThemeChanged, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedFolderPath;
  String? _selectedTxtPath;


  Future<void> _handlePickFolder() async {
    String? path = await Filepicker.pickImagesFolder();
    if (path != null) {
      setState(() {
        _selectedFolderPath = path;
      });
    }
  }

  Future<void> _handlePickTxt() async {
    String? path = await Filepicker.pickTxtFile();
    if (path != null) {
      setState(() {
        _selectedTxtPath = path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallpaper Generator"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: CustomButton(
                onPressed: widget.onThemeChanged,
                icon: isDark ? Icons.wb_sunny : Icons.nightlight_round,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text("Меню Настройки", style: TextStyle(fontSize: 20)),
            ),
            
            ListTile(
              leading: const Icon(Icons.folder_open),
              title: const Text("Выбрать фото"),
              subtitle: Text(
                _selectedFolderPath ?? "Не выбрано",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () async {
                Navigator.pop(context); 
                await _handlePickFolder();
              },
            ),
            ListTile(
              leading: const Icon(Icons.text_snippet),
              title: const Text("Выбрать текстовый файл"),
              subtitle: Text(
                    _selectedTxtPath != null 
                    ? _selectedTxtPath!.split(RegExp(r'[/\\]')).last 
                    : "Не выбрано",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    ),
              onTap: () async {
                Navigator.pop(context); 
                await _handlePickTxt();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(VisualSettings.defaultPadding),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(VisualSettings.borderRadius),
                border: Border.all(color: theme.colorScheme.secondary),
              ),
              child: Center(
                child: Text(
                       "Здесь будет картинка",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: CustomButton(
              onPressed: () {
                if (_selectedFolderPath == null || _selectedTxtPath == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Сначала выберите папку и текстовый файл!')),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Генерируем файл...')),
                );
              },
              text: "Сгенерировать",
            ),
          ),
        ],
      ),
    );
  }
}