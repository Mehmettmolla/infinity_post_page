import 'package:flutter/material.dart';
import 'package:social_media/cubit/post_cubit/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/home/services/post_service.dart';
import 'package:social_media/features/home/view/posts_view.dart';
import 'cubit/comment_cubit/comment_cubit.dart';

void main() {
  runApp(PaginationApp(
    repository: PostService(),
  ));
}

class PaginationApp extends StatelessWidget {
  final PostService repository;

  const PaginationApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostCubit(repository),
          child: PostsView(),
        ),
        BlocProvider<CommentCubit>(
          create: (context) => CommentCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostsView(),
      ),
    );
  }
}
