import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainerState(this.url);
}
class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();
  _WebViewContainerState(this._url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: WebView(
                        key: _key,
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: _url)),

                /*FacebookBannerAd(
                  bannerSize: BannerSize.STANDARD,
                  keepAlive: true,
                  placementId: "IMG_16_9_APP_INSTALL#1347549032304210_1347550045637442",

                ),*/



              ],
            ),


          ],


        )

    );
  }
}


