import 'package:flutter/material.dart';
import 'customButton.dart';
import 'visualSettings.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onThemeChanged;

  const HomePage({required this.onThemeChanged, super.key});

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
                onPressed: onThemeChanged,
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
            const DrawerHeader(child: Text("Меню Настройки")),
            ListTile(
              title: const Text("Выбрать фото"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Выбрать текстовый файл для надписи"),
              onTap: () {},
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
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
              ),
            ),
          ),
          // Generate button
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: CustomButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Генерируем файл...'),
                    duration: Duration(seconds: 2), 
                    behavior: SnackBarBehavior.floating,
                  ),
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