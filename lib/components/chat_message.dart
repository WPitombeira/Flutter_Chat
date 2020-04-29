import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  Map<String, dynamic> data;
  final bool _isMine;

  ChatMessage(this.data, this._isMine);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: <Widget>[
          !_isMine
              ? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPhotoUrl']),
                  ),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  _isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                data["imgUrl"] != null
                    ? Image.network(
                        data['imgUrl'],
                      )
                    : Text(
                        data['text'],
                        textAlign: _isMine ? TextAlign.end : TextAlign.start,
                        style: TextStyle(fontSize: 16),
                      ),
                Text(
                  data["senderName"],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          _isMine
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPhotoUrl']),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
