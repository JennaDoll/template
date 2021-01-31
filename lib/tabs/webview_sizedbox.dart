import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewContainerSizedBox extends StatefulWidget {
  final url;
  WebViewContainerSizedBox(this.url);
  @override
  createState() => _WebViewContainer(this.url);

}

class _WebViewContainer extends State<WebViewContainerSizedBox> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  var _url;
  final _key = UniqueKey();
  _WebViewContainer(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [SizedBox(height: 50),
          Container(
            height: 750,
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

                  heroTag: "floating_SizedBox",
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
