import 'package:flutter/material.dart';
import 'package:social_media/cubit/posts_cubit/posts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/home/services/posts_service.dart';
import 'package:social_media/features/home/view/posts_view.dart';
import 'cubit/comments_cubit/comment_cubit.dart';

void main() {
  runApp(PaginationApp(
    repository: PostsService(),
  ));
}

class PaginationApp extends StatelessWidget {
  final PostsService repository;

  const PaginationApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostsCubit(repository),
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
