import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexColorPicker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorPickerDemo(),
    );
  }
}

class ColorPickerDemo extends StatefulWidget {
  const ColorPickerDemo({super.key});

  @override
  _ColorPickerDemoState createState() => _ColorPickerDemoState();
}

class _ColorPickerDemoState extends State<ColorPickerDemo> {
  Color selectedColor = Colors.blue; // Initial color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlexColorPicker Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: selectedColor,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openColorPicker,
              child: const Text('Pick a Color'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to open the color picker dialog
  Future<void> _openColorPicker() async {
    bool pickedColor = await ColorPicker(
      color: selectedColor,
      onColorChanged: (Color newColor) {
        setState(() {
          selectedColor = newColor;
        });
      },
      width: 40,
      height: 40,
      borderRadius: 20,
      spacing: 10,
      runSpacing: 10,
      heading: const Text('Pick a color'),
      subheading: const Text('Select a color for your widget'),
      wheelDiameter: 200,
      wheelWidth: 20,
      
    ).showPickerDialog(context);
  }
}
