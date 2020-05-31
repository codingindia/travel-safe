import 'package:flutter_chat_ui/models/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User abcd = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/abcd.jpg',
);

// USERS
final User efgh = User(
  id: 1,
  name: 'member1',
  imageUrl: 'assets/images/efgh.jpg',
);
final User ijkl = User(
  id: 2,
  name: 'member2',
  imageUrl: 'assets/images/ijkl.jpg',
);
