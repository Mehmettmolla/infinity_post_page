import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/cubit/comments_cubit/comment_cubit.dart';
import 'package:social_media/cubit/posts_cubit/posts_cubit.dart';
import 'package:social_media/features/home/view/post_details_view.dart';
import 'package:social_media/posts/models/post_model.dart';

import 'dart:async';

import 'package:social_media/posts/widgets/card/post_card.dart';

class PostsView extends StatefulWidget {
  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PostsCubit>(context).loadPosts();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PostsCubit>(context).loadPosts();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Good Morning, Alex",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            Spacer(),
            Icon(Icons.email_outlined),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: _postList(),
    );
  }

  Widget _postList() {
    return BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
      if (state is PostsLoading && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<PostModel> posts = [];
      bool isLoading = false;

      if (state is PostsLoading) {
        posts = state.oldPosts;
        isLoading = true;
      } else if (state is PostsLoaded) {
        posts = state.posts;
      }

      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < posts.length)
            return _post(posts[index], context);
          else {
            Timer(Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: posts.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _post(PostModel post, BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CommentCubit>(context).fetchComments(post.id);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PostDetailsView(post: post)));
      },
      child: PostCard(post: post)
    );
  }
}
