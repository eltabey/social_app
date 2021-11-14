abstract class SocialStates {}

class InitialState extends SocialStates {}

class GetUserLoadingState extends SocialStates {}

class GetUserSuccessState extends SocialStates {}

class GetUserErrorState extends SocialStates {
  final String error;

  GetUserErrorState(this.error);
}

class ChangeBottomNavState extends SocialStates {}

class NewPostState extends SocialStates {}

class ProfileImagePickedSuccessState extends SocialStates {}

class ProfileImagePickedErrorState extends SocialStates {}

class CoverImagePickedSuccessState extends SocialStates {}

class CoverImagePickedErrorState extends SocialStates {}

class UploadProfileImageSuccessState extends SocialStates {}

class UploadProfileImageErrorState extends SocialStates {}

class UploadCoverImageSuccessState extends SocialStates {}

class UploadCoverImageErrorState extends SocialStates {}

class UserUpdateErrorState extends SocialStates {}

class UserUpdateLoadingState extends SocialStates {}

//////////////////////////////////////////////////////
//create post
class CreatePostLoadingState extends SocialStates {}

class CreatePostSuccessState extends SocialStates {}

class CreatePostErrorState extends SocialStates {}

class PostImagePickedSuccessState extends SocialStates {}

class PostImagePickedErrorState extends SocialStates {}

class RemovePostImageSuccessState extends SocialStates {}

//////////////////////////////////////////////////////////
//get Posts
class GetPostsLoadingState extends SocialStates {}

class GetPostsSuccessState extends SocialStates {}

class GetPostsErrorState extends SocialStates {
  final String error;

  GetPostsErrorState(this.error);
}

//////////////////////////////////////////////////////////
//like Posts
class LikePostsSuccessState extends SocialStates {}

class LikePostsErrorState extends SocialStates {
  final String error;

  LikePostsErrorState(this.error);
}
///////////////////////////////////////////////////////
class GetAllUserLoadingState extends SocialStates {}

class GetAllUserSuccessState extends SocialStates {}

class GetAllUserErrorState extends SocialStates {
  final String error;

  GetAllUserErrorState(this.error);
}
//////////////////////////////////////////////////////////
//chat

class SendMessageSuccessState extends SocialStates {}

class SendMessageErrorState extends SocialStates {}

class GetMessagesSuccessState extends SocialStates {}

class GetMessagesErrorState extends SocialStates {}

class ChatImagePickedSuccessState extends SocialStates {}

class ChatImagePickedErrorState extends SocialStates {}

class RemoveChatImageSuccessState extends SocialStates {}

class UploadChatLoadingState extends SocialStates {}

class UploadChatSuccessState extends SocialStates {}

class UploadChatErrorState extends SocialStates {}