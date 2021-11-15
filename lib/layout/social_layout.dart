import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social/layout/cubit/cubit.dart';
import 'package:social/layout/cubit/states.dart';
import 'package:social/modules/new_post/new_post_screen.dart';
import 'package:social/shared/components/cmponents.dart';
import 'package:social/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, stata)
      {
        if(stata is NewPostState)
        {
          navigateTo(context: context, widget: NewPostScreen());
        }
      },
      builder: (context, stata) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
             //textTheme: TextTheme(overline:TextStyle(color: Colors.black)),
            elevation: 0,
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  IconBroken.Notification,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  IconBroken.Search,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Upload),
                label: 'post',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Location),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Setting),
                label: 'Setting',
              ),
            ],
          ),
        );
      },
    );
  }
}
/*

ConditionalBuilder(
            condition: SocialCubit.get(context).model != null,
            builder: (context) {
              var model = SocialCubit.get(context).model;
              return Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  if (!FirebaseAuth.instance.currentUser.emailVerified)
                    Container(
                      color: Colors.amber.withOpacity(0.6),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'please verify your email',
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            defaultButton(
                              width: 100,
                              function: () {
                                FirebaseAuth.instance.currentUser
                                    .sendEmailVerification()
                                    .then((value) {
                                  showToast(
                                    text: 'check your mail',
                                    state: ToastStates.SUCCESS,
                                  );
                                }).catchError((error) {});
                              },
                              text: 'send',
                            )
                          ],
                        ),
                      ),
                    )
                ],
              );
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
*/
