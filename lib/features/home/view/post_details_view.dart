import 'package:flutter/material.dart';
import 'package:social_media/product/widgets/comment_list/comments_list.dart';
import 'package:social_media/product/models/post_model.dart';
import 'package:social_media/product/widgets/card/post_card.dart';

class PostDetailsView extends StatelessWidget {
  final PostModel post;

  const PostDetailsView({
    required this.post,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post"),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            PostCard(post: post),
            commentTitle(context),
            CommentList(),
          ],
        ));
  }

  Container commentTitle(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "COMMENTS",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    ));
  }
}
