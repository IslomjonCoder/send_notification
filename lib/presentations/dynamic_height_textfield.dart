import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicHeightTextField extends StatefulWidget {
  @override
  _DynamicHeightTextFieldState createState() => _DynamicHeightTextFieldState();
}

class _DynamicHeightTextFieldState extends State<DynamicHeightTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  double _textFieldHeight = 100.0; // Initial height
  final double _maxHeight = 200.0; // Maximum height

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _textFieldHeight,
      child: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        // Allows for unlimited lines
        inputFormatters: [
          LengthLimitingTextInputFormatter(1000), // Limit text length if needed
        ],
        onChanged: (text) {
          // Calculate the new height based on the content
          final textSpan = TextSpan(
            text: text,
            style: const TextStyle(fontSize: 16.0), // Adjust the font size as needed
          );

          final painter = TextPainter(
            text: textSpan,
            maxLines: null,
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: MediaQuery.of(context).size.width - 32); // Subtract padding

          setState(() {
            // Limit the height to the maximum height
            _textFieldHeight = painter.height < _maxHeight ? painter.height : _maxHeight;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Enter text...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
