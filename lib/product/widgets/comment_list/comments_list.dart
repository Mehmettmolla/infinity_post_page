import 'package:flutter/material.dart';
import 'package:social_media/cubit/comment_cubit/comment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/product/widgets/card/comment_card.dart';

class CommentList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        if (state is CommentLoaded) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  return CommentCard(comment: state.comments[index]);
                }),
          );
        } else
          return CircularProgressIndicator();
      },
    );
  }
}
