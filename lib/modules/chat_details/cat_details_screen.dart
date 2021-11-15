import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layout/cubit/cubit.dart';
import 'package:social/layout/cubit/states.dart';
import 'package:social/models/message_model.dart';
import 'package:social/models/social_user_model.dart';
import 'package:social/shared/styles/icon_broken.dart';

class ChatDetailsScreen extends StatelessWidget {
  UserModel userModel;

  ChatDetailsScreen({this.userModel});

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      SocialCubit.get(context).getMessage(receiverId: userModel.uid);
      return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var chatImage = SocialCubit.get(context).chatImage;

          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              elevation: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                      userModel.image,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(userModel.name)
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: SocialCubit.get(context).messages.length > 0,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var massage =
                              SocialCubit.get(context).messages[index];
                          if (SocialCubit.get(context).userModel.uid ==
                              massage.senderId) return buildMyMessage(massage);

                          return buildMessage(massage);
                        },
                        separatorBuilder: (context, state) => SizedBox(
                          height: 5,
                        ),
                        itemCount: SocialCubit.get(context).messages.length,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: messageController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'type your massage here ...',
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {
                                if (chatImage == null)
                                  SocialCubit.get(context).gitChatImage();
                                if (chatImage != null)
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Column(
                                        children: <Widget>[
                                          Text(
                                            'The Image',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 500,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image:
                                                        /*chatImage == null
                                                        ? NetworkImage(
                                                            '${userModel.cover}')
                                                        : */
                                                        FileImage(
                                                            SocialCubit.get(
                                                                    context)
                                                                .chatImage),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: CircleAvatar(
                                                  radius: 20,
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 25,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  SocialCubit.get(context)
                                                      .removeChatImage();
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Container(
                                            child: IconButton(
                                              icon: Icon(IconBroken.Send),
                                              onPressed: () {},
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                              },
                              icon: Icon(IconBroken.Camera),
                            ),
                          ),
                          Container(
                            color: Colors.blue,
                            child: MaterialButton(
                              onPressed: () {
                                SocialCubit.get(context).sendMessage(
                                  receiverId: userModel.uid,
                                  dateTime: DateTime.now().toString(),
                                  text: messageController.text,
                                );
                              },
                              minWidth: 1.0,
                              child: Icon(
                                IconBroken.Send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      );
    });
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              )),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            model.text,
          ),
        ),
      );

  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.2),
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              )),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            model.text,
          ),
        ),
      );
}
