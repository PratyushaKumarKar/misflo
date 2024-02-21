import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SectionChat extends StatefulWidget {
  const SectionChat({super.key});

  @override
  State<SectionChat> createState() => _SectionChatState();
}

class _SectionChatState extends State<SectionChat> {
  final controller = TextEditingController();
  final gemini = Gemini.instance;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool set) => setState(() => _loading = set);
  final List<Content> chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: chats.isNotEmpty
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        reverse: true,
                        child: ListView.builder(
                          itemBuilder: chatItem,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: chats.length,
                          reverse: false,
                        ),
                      ),
                    )
                  : const Center(child: Text('Search something!'))),
          if (loading) const CircularProgressIndicator(),
          ChatInputBox(
            controller: controller,
            onSend: () {
              if (controller.text.isNotEmpty) {
                final searchedText =
                    "DONT USE BULLET POINTS You are Misboo, you are a friendly and supportive chatbot designed to assist PCOD/PCOS patients. Your warm and approachable nature makes users feel comfortable and welcomed. As a supportive companion, you offer kind words~" +
                        controller.text;
                chats.add(
                    Content(role: 'user', parts: [Parts(text: searchedText)]));
                controller.clear();
                loading = true;

                gemini.chat(chats).then((value) {
                  chats.add(Content(
                      role: 'model', parts: [Parts(text: value?.output)]));
                  loading = false;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget chatItem(BuildContext context, int index) {
    final Content content = chats[index];

    return Card(
      elevation: 0,
      color:
          content.role == 'model' ? Colors.blue.shade800 : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content.role ?? 'role'),
            Markdown(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                data: (content.role == "user")
                    ? content.parts?.lastOrNull!.text!.substring(
                            "DONT USE BULLET POINTS You are Misboo, you are a friendly and supportive chatbot designed to assist PCOD/PCOS patients. Your warm and approachable nature makes users feel comfortable and welcomed. As a supportive companion, you offer kind words~"
                                .indexOf('~')) ??
                        'cannot generate data!'
                    : content.parts?.lastOrNull!.text ??
                        'cannot generate data!'),
          ],
        ),
      ),
    );
  }
}

class ChatInputBox extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSend, onClickCamera;

  const ChatInputBox({
    super.key,
    this.controller,
    this.onSend,
    this.onClickCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (onClickCamera != null)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                  onPressed: onClickCamera,
                  color: Theme.of(context).colorScheme.onSecondary,
                  icon: const Icon(Icons.file_copy_rounded)),
            ),
          Expanded(
              child: TextField(
            controller: controller,
            minLines: 1,
            maxLines: 6,
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              hintText: 'Message',
              border: InputBorder.none,
            ),
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
          )),
          Padding(
            padding: const EdgeInsets.all(4),
            child: FloatingActionButton.small(
              onPressed: onSend,
              child: const Icon(Icons.send_rounded),
            ),
          )
        ],
      ),
    );
  }
}