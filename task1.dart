import 'package:flutter/material.dart';

void main() => runApp(ImageGridApp());

class ImageGridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Responsive Grid', home: ImageGridScreen());
  }
}

class ImageGridScreen extends StatelessWidget {
  final List<String> imageUrls = List.generate(
    12,
    (index) => 'https://picsum.photos/200/300?random=$index',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Responsive Image Grid")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = (constraints.maxWidth ~/ 150).toInt();

          return GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: imageUrls.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrls[index], fit: BoxFit.cover),
              );
            },
          );
        },
      ),
    );
  }
}
