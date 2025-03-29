import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleMyMapsScreen extends StatefulWidget {
  const GoogleMyMapsScreen({super.key});

  @override
  _GoogleMyMapsScreenState createState() => _GoogleMyMapsScreenState();
}

class _GoogleMyMapsScreenState extends State<GoogleMyMapsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Habilita JavaScript
      ..loadRequest(
        Uri.parse("https://www.google.com/maps/d/u/0/embed?mid=1jLVJufFxntmWnPcrRi-yJtlev6BpPpU&ehbc=2E312F"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google My Maps en Flutter"),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
