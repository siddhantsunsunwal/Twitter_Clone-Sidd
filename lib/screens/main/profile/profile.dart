import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/screens/main/posts/list.dart';
import 'package:twitter_clone/services/posts.dart';

class Profile extends StatefulWidget {
  Profile({required Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value:
            _postService.getPostsByUser(FirebaseAuth.instance.currentUser.uid),
        initialData: [],
        child: Scaffold(
          body: Container(
            child: Text("list item"),
          ),
        ));
  }
}
