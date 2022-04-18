import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/product/models/comment_model.dart';

class CommentCard extends StatelessWidget {
  final CommentModel comment;

  const CommentCard({Key? key, required this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.name.toString(),
                    style: Theme.of(context).textTheme.bodyText1),
                headerItems(context),
              ],
            ),
            subtitle: Text(comment.body.toString(),
                style: Theme.of(context).textTheme.bodyText2)
                )
                );
  }

  Row headerItems(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.account_circle_rounded,
          size: 35,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment.email.toString(),
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
        Spacer(),
        Icon(
          Icons.favorite_border,
        ),
      ],
    );
  }
}
