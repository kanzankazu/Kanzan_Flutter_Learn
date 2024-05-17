import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewSample extends StatefulWidget {
  const WebviewSample({super.key});

  @override
  State<WebviewSample> createState() => _WebviewSampleState();
}

class _WebviewSampleState extends State<WebviewSample> {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: controller),
    );
  }
}
