class CommentsModel {
  final String photo;
  final String handle;
  final String comment;
  final String time;
  final bool isLiked;
  final bool hasPicture;
  final String picture;

  CommentsModel(this.photo, this.handle, this.comment, this.time, this.isLiked,
      this.hasPicture, this.picture);
}

List<CommentsModel> comments = [
  CommentsModel('1.png', '@blessing462', 'Hello, how is everyone doing?',
      'Just Now', true, false, ''),
  CommentsModel('2.png', '@moyin49826', 'Yes, we are okayone doing?', '1:41 pm',
      false, true, '4.png'),
  CommentsModel(
      '3.png', '@patrickhins', 'Who has a pen?', 'Yesterday', true, false, ''),
  CommentsModel('1.png', '@blessing462', 'Hello, how is everyone doing?',
      'Just Now', true, false, ''),
  CommentsModel('2.png', '@moyin49826', 'Yes, we are okayone doing?', '1:41 pm',
      false, true, '4.png'),
  CommentsModel(
      '3.png', '@patrickhins', 'Who has a pen?', 'Yesterday', true, false, ''),
  CommentsModel('1.png', '@blessing462', 'Hello, how is everyone doing?',
      'Just Now', true, false, ''),
  CommentsModel('2.png', '@moyin49826', 'Yes, we are okayone doing?', '1:41 pm',
      false, true, '4.png'),
  CommentsModel(
      '3.png', '@patrickhins', 'Who has a pen?', 'Yesterday', true, false, ''),
  CommentsModel('1.png', '@blessing462', 'Hello, how is everyone doing?',
      'Just Now', true, false, ''),
  CommentsModel('2.png', '@moyin49826', 'Yes, we are okayone doing?', '1:41 pm',
      false, true, '4.png'),
  CommentsModel(
      '3.png', '@patrickhins', 'Who has a pen?', 'Yesterday', true, false, ''),
  CommentsModel('1.png', '@blessing462', 'Hello, how is everyone doing?',
      'Just Now', true, false, ''),
  CommentsModel('2.png', '@moyin49826', 'Yes, we are okayone doing?', '1:41 pm',
      false, true, '4.png'),
  CommentsModel(
      '3.png', '@patrickhins', 'Who has a pen?', 'Yesterday', true, false, ''),
  CommentsModel('1.png', '@blessing462', 'Hello, how is everyone doing?',
      'Just Now', true, false, ''),
  CommentsModel('2.png', '@moyin49826', 'Yes, we are okayone doing?', '1:41 pm',
      false, true, '4.png'),
  CommentsModel(
      '3.png', '@patrickhins', 'Who has a pen?', 'Yesterday', true, false, ''),
];
