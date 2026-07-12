import 'package:flutter/material.dart';
import 'customButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wallpaper Generator")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text("Меню Настройки")),
            ListTile(
              title: const Text("Выбрать фото"),
              onTap: (){
                /* photo selection logic later */
              },
            ),
            ListTile(
              title: const Text("Выбрать тектовый файл для надписи"),
              onTap: (){
                /*txt selection logic later */
              },
            ),
          ],
        ),
      ),
    body: Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            color: Colors.grey[300],
            child: const Center(child: Text("Здесь будет картинка")),
          )
        ),
        //generate button
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: CustomButton(
            onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Генерируем файл...'),
                duration: Duration(seconds: 2), 
                behavior: SnackBarBehavior.floating, // Чтобы висела над контентом, а не прижималась к низу
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