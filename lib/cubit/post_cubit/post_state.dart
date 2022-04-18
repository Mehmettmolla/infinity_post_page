part of 'post_cubit.dart';

abstract class PostState {}

class PostsInitial extends PostState {}

class PostsLoaded extends PostState {
  final List<PostModel> posts;

  PostsLoaded(this.posts);
}

class PostsLoading extends PostState {
  final List<PostModel> oldPosts;
  final bool isFirstFetch;

  PostsLoading(this.oldPosts, {this.isFirstFetch = false});
}
