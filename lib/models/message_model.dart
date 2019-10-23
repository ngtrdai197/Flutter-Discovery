import 'package:myapp/models/user_model.dart';

class Message {
  final User sender;
  final String content;
  final String time;
  final bool isReaded;

  Message(this.sender, this.content, this.time, this.isReaded);
}

final User huy = new User(1, "Nguyen Huy", 'images/apple.jpg');
final User duyen = new User(2, "Nguyen Duyen", 'images/hoasen.png');
final User dai = new User(3, "Nguyen Dai", 'images/vuejs.png');
final User loc = new User(4, "Nguyen Loc", 'images/react.jpeg');
final User vana = new User(5, "Nguyen Van A", 'images/pic0.jpg');

List<User> favorites = []..add(huy)..add(duyen)..add(dai)..add(loc)..add(vana);
List<Message> chats = []
  ..add(Message(
      huy, 'Hey, how\'s it going? What did you do today?', '5:30 PM', false))
  ..add(Message(
      duyen, 'Hey, how\'s it going? What did you do today?', '5:30 PM', false))
  ..add(Message(
      dai, 'Hey, how\'s it going? What did you do today?', '5:30 PM', true))
  ..add(Message(
      loc, 'Hey, how\'s it going? What did you do today?', '5:30 PM', false))
  ..add(Message(
      vana, 'Hey, how\'s it going? What did you do today?', '5:30 PM', true));
