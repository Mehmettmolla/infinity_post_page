import 'package:social_media/features/home/services/post_service.dart';
import 'package:social_media/product/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.repository) : super(PostsInitial());

  int page = 1;
  final PostService repository;

  void loadPosts() {
    if (state is PostsLoading) return;
    final currentState = state;

    var oldPosts = <PostModel>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }

    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));

    repository.fetchPosts(page).then((newPosts) {
      page++;

      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);    

      emit(PostsLoaded(posts));
    });
  }

}