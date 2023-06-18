import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WomenSaftyWebView extends StatefulWidget {
  WomenSaftyWebView({super.key});

  @override
  State<WomenSaftyWebView> createState() => _WomenSaftyWebViewState();
}

class _WomenSaftyWebViewState extends State<WomenSaftyWebView> {
  late WebViewController _webViewController;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl:
                "https://www.mha.gov.in/en/divisionofmha/women-safety-division",
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onPageStarted: (url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
          const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
