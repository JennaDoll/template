import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainer(this.url);

}

class _WebViewContainer extends State<WebViewContainer> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  var _url;
  final _key = UniqueKey();
  _WebViewContainer(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [SizedBox(height: 30),
          Expanded(
            child: WebView(
              initialUrl: _url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                  heroTag: "floating",
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    controller.data.goBack();
                  });
            }

            return Container();
          }
      ),
    );
  }
}
