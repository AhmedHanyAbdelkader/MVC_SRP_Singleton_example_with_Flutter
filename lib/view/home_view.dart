import 'package:flutter/material.dart';
import 'package:mvc_example/controller/controller.dart';
import 'package:mvc_example/model/post_model.dart';

class MyView extends StatefulWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  _MyViewState createState() => _MyViewState();
}
class _MyViewState extends State<MyView> {
  bool _isLoading = false;
  List<Post>? posts;
  var controller =  PostsController.postsController;

  void _fetchGlobalStats() async {
    setState(() => _isLoading = true);
    try {
      var stats = await controller.getPostsFromDataModel();
      setState(() => posts = stats);
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    _fetchGlobalStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: _isLoading ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                itemCount: posts!.length,
                itemBuilder: (context,index)=> PostCardWidget(post: posts![index]),
          ),
          ),
        ),
      );
  }
}




class PostCardWidget extends StatelessWidget {
   PostCardWidget({Key? key,required this.post}) : super(key: key);
   Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${post.title}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              Text('${post.body}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),),
            ],
          ),
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.black)
        ),
      ),
    );
  }
}
