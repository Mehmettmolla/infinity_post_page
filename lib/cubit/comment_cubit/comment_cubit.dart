import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media/features/home/services/comments_service.dart';
import 'package:social_media/posts/models/comment_model.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  final _dataService = CommentService();

  Future<void> fetchComments(postId) async {
    final comments = await _dataService.fetchComments(postId);
    emit(CommentLoaded(comments));
  }
}
