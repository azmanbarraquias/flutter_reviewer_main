import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  final title = 'MyPage';

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    var coffee = Emoji('coffee', '☕');
    var heart = Emoji('heart', '❤️');

// Get emoji info
    var emojiHeart = parser.info('heart');
    print(emojiHeart); // '{name: heart, full: :heart:, code: ❤️}'

// Check emoji equality
    heart == emojiHeart; // returns: true
    heart == coffee; // returns: false

// Get emoji by name or code
    parser.get(
        'coffee'); // returns: Emoji{name="coffee", full=":coffee:", code="☕"}
    parser.get(
        ':coffee:'); // returns: Emoji{name="coffee", full=":coffee:", code="☕"}

    parser.hasName('coffee'); // returns: true
    parser.getName(
        'coffee'); // returns: Emoji{name="coffee", full=":coffee:", code="☕"}

    parser.hasEmoji('❤️'); // returns: true
    parser.getEmoji(
        '❤️'); // returns: Emoji{name="heart", full=":heart:", code="❤️"}

    parser.emojify('I :heart: :coffee:'); // returns: 'I ❤️ ☕'
    parser.unemojify('I ❤️ ☕'); // returns: 'I :heart: :coffee:'
    print('${parser.get('skull')}');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        title: Text('Hello there: \u2620'),
      ),
      body: SafeArea(
        child: Container(
          // Start Here
          child: const Placeholder(),
        ),
      ),
    );
  }
}
