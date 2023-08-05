class PostModel {
  int? id;
  String userName;
  String location;
  String userProfilePhotoUrl;
  String caption;
  String photoUrl;
  int loves;
  int comments;
  int bookmarks;
  String? createdTime;

  PostModel(
    this.userName,
    this.location,
    this.userProfilePhotoUrl,
    this.caption,
    this.photoUrl,
    this.loves,
    this.comments,
    this.bookmarks,
    this.createdTime,
  );
}
