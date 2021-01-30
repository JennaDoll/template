import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';

import '../model/post_entity.dart';
import '../widgets/posts_list.dart';

class SingleCategory extends StatelessWidget {
  PostCategory category;

  SingleCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Stack(
        children: [
          Container(
            child: PostsList(category: category.id),
          ),

          Container(
            child:
            Positioned (
              bottom: 0,
              left:50,


              child: FacebookBannerAd(
                bannerSize: BannerSize.STANDARD,
                keepAlive: true,
                placementId: "1347549032304210_1348086808917099",

              ),



            ),
          )
        ],
      ),

    );
  }
}

