part of 'comment_cubit.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}
class CommentLoaded extends CommentState {
  final List<CommentModel> comments;

  CommentLoaded(this.comments);
}
