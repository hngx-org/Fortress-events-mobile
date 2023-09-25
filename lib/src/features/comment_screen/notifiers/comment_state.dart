import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/features/auth/model/profile_details/user.dart';
import 'package:event_app/src/features/comment_screen/model/post_comments/post_comments.dart';

class CommentState {
  final LoadState loadState;
  final String errorMessage;

  final List<PostComments>? resp;

  CommentState({required this.loadState, this.errorMessage = '', this.resp});

  factory CommentState.initialState() {
    return CommentState(loadState: LoadState.idle, errorMessage: '', resp: []);
  }

  CommentState copyWith({
    LoadState? loadState,
    List<PostComments>? resp,
    String? errorMessage,
  }) {
    return CommentState(
        loadState: loadState ?? this.loadState,
        errorMessage: errorMessage ?? this.errorMessage,
        resp: resp ?? this.resp);
  }
}
