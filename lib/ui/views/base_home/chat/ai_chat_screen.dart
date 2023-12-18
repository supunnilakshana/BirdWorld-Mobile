// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:math';

import 'package:birdworld/.env/env.dart';
import 'package:birdworld/core/models/bird_msg_model.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class AIChatView extends StatefulWidget {
  const AIChatView({
    super.key,
  });

  @override
  State<AIChatView> createState() => _AIChatViewState();
}

class _AIChatViewState extends State<AIChatView> {
  List<BirdWelcomeMsg> birdWelcomeMsgs = [
    BirdWelcomeMsg("Parrot",
        "Squawk! Hello! I'm a happy parrot today. Squawk! How about you? 🦜"),
    BirdWelcomeMsg("Eagle",
        "Swoosh! Greetings! I'm here to share information about eagles. 🦅"),
    BirdWelcomeMsg(
        "Robin", "Tweet-tweet! Hi there! Let's chat about robins. 🐦"),
    BirdWelcomeMsg(
        "Hummingbird", "Buzz! Welcome! Ready to learn about hummingbirds? 🌺"),
    BirdWelcomeMsg("Owl",
        "Hoot-hoot! Nice to meet you! Let's delve into the world of owls. 🦉"),
  ];
  final List<types.Message> _messages = [];
  final List<OpenAIChatCompletionChoiceMessageModel> _aiMessages = [];
  late types.User ai;
  late types.User user;
  late String appBarTitle;

  var chatResponseId = '';
  var chatResponseContent = '';

  bool isAiTyping = false;

  _AIChatViewState();
  @override
  void initState() {
    super.initState();

    Random random = Random();
    int randomIndex = random.nextInt(birdWelcomeMsgs.length);

    // Select a random bird welcome message
    BirdWelcomeMsg randomBird = birdWelcomeMsgs[randomIndex];
    setApiKeyOnStartup();
    ai = types.User(id: 'ai', firstName: randomBird.name);
    user = const types.User(id: 'user', firstName: 'You');
    String trainedpormt =
        "You are a vibrant and talkative ${randomBird.name} perched on a colorful branch in a lush tropical forest. Respond to questions and engage in conversations, but remember, you can only provide answers related to birds. If asked about non-bird topics, politely state that you cannot answer and redirect the conversation to something avian. Embrace the playful and curious nature of a ${randomBird.name} in your responses.";
    appBarTitle = 'Chat with ${randomBird.name}';

    // read chat history from Hive

    // Add to chat view
    final textMessage = types.TextMessage(
      author: ai,
      createdAt: DateTime.now().microsecondsSinceEpoch,
      id: randomString(),
      text: randomBird.welcomeMsg,
    );

    _messages.insert(0, textMessage);

    // construct chatgpt messages
    // ignore: prefer_const_constructors
    _aiMessages.add(OpenAIChatCompletionChoiceMessageModel(
        content: 'Hi Please ask me?', role: OpenAIChatMessageRole.assistant));
    _completeChat(trainedpormt, istrianed: false);

    setState(() {});
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  setApiKeyOnStartup() {
    OpenAI.apiKey = AppAPIKeys.spOpenApiKey;
  }

  void _completeChat(String prompt, {bool istrianed = true}) async {
    _aiMessages.add(OpenAIChatCompletionChoiceMessageModel(
      content: prompt,
      role: OpenAIChatMessageRole.user,
    ));

    Stream<OpenAIStreamChatCompletionModel> chatStream =
        OpenAI.instance.chat.createStream(
      model: "gpt-3.5-turbo",
      messages: _aiMessages,
    );

    chatStream.listen((chatStreamEvent) {
      debugPrint(chatStreamEvent.toString());
      // existing id: just update to the same text bubble
      if (chatResponseId == chatStreamEvent.id) {
        chatResponseContent +=
            chatStreamEvent.choices.first.delta.content ?? '';

        if (istrianed) {
          _addMessageStream(chatResponseContent);
        }

        if (chatStreamEvent.choices.first.finishReason == "stop") {
          isAiTyping = false;
          _aiMessages.add(OpenAIChatCompletionChoiceMessageModel(
            content: chatResponseContent,
            role: OpenAIChatMessageRole.assistant,
          ));
          // _saveMessage(chatResponseContent, MessageRole.ai);
          chatResponseId = '';
          chatResponseContent = '';
        }
      } else {
        // new id: create new text bubble
        if (istrianed) {
          chatResponseId = chatStreamEvent.id;
          chatResponseContent =
              chatStreamEvent.choices.first.delta.content ?? '';
          onMessageReceived(id: chatResponseId, message: chatResponseContent);
          isAiTyping = true;
        }
      }
    });
  }

  void onMessageReceived({String? id, required String message}) {
    var newMessage = types.TextMessage(
      author: ai,
      id: id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      text: message,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    _addMessage(newMessage);
  }

  // add new bubble to chat
  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  // /// Save message to Hive database
  // void _saveMessage(String message, MessageRole role) {
  //   final messageItem = MessageItem(message, role, DateTime.now());
  //   messageBox.add(messageItem);
  //   widget.chatItem.messages.add(messageItem);
  //   widget.chatItem.save();
  // }

  // modify last bubble in chat
  void _addMessageStream(String message) {
    setState(() {
      _messages.first =
          (_messages.first as types.TextMessage).copyWith(text: message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
    // _saveMessage(message.text, MessageRole.user);
    _completeChat(message.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/Artboard 1.jpg'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Chat(
          typingIndicatorOptions: TypingIndicatorOptions(
            typingUsers: [if (isAiTyping) ai],
          ),
          inputOptions: InputOptions(enabled: !isAiTyping),
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: user,
          theme: DefaultChatTheme(
            inputTextColor: AppColors.darkblack,
            inputBackgroundColor:
                const Color.fromARGB(255, 13, 50, 110).withOpacity(0.3),
            inputTextDecoration:
                const InputDecoration(contentPadding: EdgeInsets.all(10)),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
