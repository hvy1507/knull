import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skeleton/constant/status.k.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/view/gemini/gemini.cubit.dart';
import 'package:skeleton/ui/view/gemini/gemini.state.dart';
import 'package:skeleton/ui/widget/image_view.dart';
import 'package:skeleton/utils/extension/build_context.dart';
import 'package:url_launcher/url_launcher.dart';

class GeminiView extends StatefulWidget {
  const GeminiView({super.key});

  @override
  State<GeminiView> createState() => _GeminiViewState();
}

class _GeminiViewState extends State<GeminiView> {
  GeminiCubit get cubit => context.read<GeminiCubit>();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent > 0.0) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeminiCubit, GeminiState>(builder: (context, state) {
      if (state.messages.isNotEmpty) {
        _scrollToBottom();
      }
      return Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: Row(
            children: [
              ImageView.asset(
                R.vectors.gemini_ai,
                width: 48,
                height: 48,
              ),
              const SizedBox(
                width: 16,
              ),
              const Text('Ask Gemini')
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  final message = state.messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: message.isUser
                                ? context.colorScheme.onTertiary
                                : context.colorScheme.surfaceContainerHighest,
                            borderRadius: message.isUser
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24),
                                    bottomLeft: Radius.circular(24))
                                : const BorderRadius.only(
                                    topRight: Radius.circular(24),
                                    topLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24))),
                        child: message.isUser
                            ? Text(
                                message.text,
                                style: context.textTheme.labelLarge?.copyWith(
                                  color: Colors.black,
                                ),
                              )
                            : state.status == Status.loading
                                ? SpinKitThreeBounce(
                                    color: context.colorScheme.primary,
                                    size: 20,
                                  )
                                : MarkdownBody(
                                    onTapLink: (text, href, title) {
                                      href != null
                                          ? launchUrl(Uri.parse(href))
                                          : null;
                                    },
                                    data: message.text,
                                    selectable: true,
                                    styleSheet: MarkdownStyleSheet(
                                      a: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 32, top: 16.0, left: 16.0, right: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: cubit.controller,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: cubit.getResponse,
                        child: const Icon(Icons.send),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
