import 'package:flutter/material.dart';
import 'package:social_media/posts/models/post_model.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final String nameTitle ="Tony Monta";

  const PostCard({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(context),
            Text(
              "${post.title}",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10.0),
            Text(
              "${post.body}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            bottomIcons()
          ],
        ),
      ),
    );
  }

  Row header(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.account_circle_rounded, size: 45),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nameTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text("1h ago", style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
        Spacer(),
        Icon(Icons.more_vert),
      ],
    );
  }

  Row bottomIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.favorite_border,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.comment_outlined),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.system_update_alt_outlined),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.bookmark_border_sharp,
            size: 30,
          ),
        ),
      ],
    );
  }
}
