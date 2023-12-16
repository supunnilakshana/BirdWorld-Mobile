// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:math';

import 'package:birdworld/.env/env.dart';
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
  final List<types.Message> _messages = [];
  final List<OpenAIChatCompletionChoiceMessageModel> _aiMessages = [];
  late types.User ai;
  late types.User user;
  late String appBarTitle;

  var chatResponseId = '';
  var chatResponseContent = '';

  bool isAiTyping = false;
  String welcomeMessage =
      "🚀 Welcome to the Crypto Wonderland! I'm your trusty sidekick, JanuX AI. 💡 Powered by GPT-3.5 Turbo, I'm your go-to guide for unlocking the enchanting world of cryptocurrencies. 🌟 Whether you're a crypto enthusiast or a curious explorer, I'm here to serve you with lightning-fast, wisdom-packed responses. 🌐 Let's embark on an epic journey through the realm of digital gold. 🌌 Ask me anything, and together we'll discover the treasures of the crypto universe!";

  final trainedpormt =
      "Act as a knowledgeable person who knows about Crypto. You are able to provide information, analysis, or insights related to cryptocurrency markets, technology, investments, trends, or anything related to crypto. If the question is not related to cryptocurrency, reply something like this, you can change the reply to a similar one: 'Please ask a question related to crypto.' Well if anyone asks about you, reply something like this, you can change the reply to a similar one: 'I am JanuX AI, your crypto-savvy companion in the digital realm. I'm powered by GPT-3.5 Turbo, and I'm here to unravel the mysteries of cryptocurrency in quick, snappy responses. If it's crypto wisdom you seek, look no further. Ask away, and let's navigate the world of digital gold together! .'";
  @override
  void initState() {
    super.initState();
    setApiKeyOnStartup();
    ai = const types.User(id: 'ai', firstName: 'AI');
    user = const types.User(id: 'user', firstName: 'You');

    appBarTitle = 'Chat with JanuX AI';

    // read chat history from Hive

    // Add to chat view
    final textMessage = types.TextMessage(
      author: ai,
      createdAt: DateTime.now().microsecondsSinceEpoch,
      id: randomString(),
      text: welcomeMessage,
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
      body: Chat(
        typingIndicatorOptions: TypingIndicatorOptions(
          typingUsers: [if (isAiTyping) ai],
        ),
        inputOptions: InputOptions(enabled: !isAiTyping),
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: user,
        theme: DefaultChatTheme(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
