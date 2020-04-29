import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.onSendMessage);
  final Function({String text, File imgFile}) onSendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  final TextEditingController _controller = TextEditingController();

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              final File imgFile = await ImagePicker.pickImage(source: ImageSource.gallery);
              if (imgFile == null) return;
              widget.onSendMessage(imgFile: imgFile);
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
              onChanged: (txt) {
                setState(() {
                  _isComposing = txt.isNotEmpty;
                });
              },
              onSubmitted: (txt) {
                widget.onSendMessage(text: _controller.text);
                _reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    widget.onSendMessage(text: _controller.text);
                    _reset();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
