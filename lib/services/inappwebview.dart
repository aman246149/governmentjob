import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWeb extends StatefulWidget {
  final String url;
  final bool isAppBarNeeded;

  const InAppWeb({super.key, required this.url, this.isAppBarNeeded = true});

  @override
  State<InAppWeb> createState() => _InAppWebState();
}

class _InAppWebState extends State<InAppWeb> {
  InAppWebViewController? webViewController;
  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  String error = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("JOBS"),),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onLoadStart: (controller, url) {
              log("ON WEB URL LOAD", name: url.toString(), level: 4);


              //! Redirection for investment document
              if(url.toString().contains("Signature/Signed-Complete")){
               
              } 
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
            onLoadError: (controller, url, code, message) {
              setState(() {
                error = message;
              });
            },
          ),
          progress < 1.0
              ? Center(
                  child: CircularProgressIndicator(
                    value: progress,
                  ),
                )
              : const SizedBox.shrink(),
          error.isNotEmpty
              ? Center(
                  child: Text(error),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
