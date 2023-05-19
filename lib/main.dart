import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
            decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search,
          color: Colors.grey,
          size: 26,
            ),

        )
            ),
            SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20.0),
                ReelItem(),
                SizedBox(width: 20.0),
                ReelItem(),
                SizedBox(width: 20.0),
                ReelItem(),
              ],
            ),
            SizedBox(height: 7.0),
            PostItem(
              avatarUrl: '',
              name: 'Max',
              description:
              'Its So Nice',
              comments: [
                Comment(
                  avatarUrl: '',
                  name: 'Alexa',
                  comment: 'Thats Right',
                ),
                Comment(
                  avatarUrl: '',
                  name: 'Diana',
                  comment: 'Hahaa you so funny',
                ),
              ],
              onPressedViewComments: () {
              },
            ),
            SizedBox(height: 8.0),
            PostItem(
              avatarUrl: '',
              name: 'Linda',
              description:
              'Yeah I pass',
              comments: [
                Comment(
                  avatarUrl: '',
                  name: 'Ivan',
                  comment: 'Congratulation!!',
                ),
              Comment(
              avatarUrl: '',
              name: 'Gilbert',
              comment: 'Oh My God',
            ),
          ],
              onPressedViewComments: () {
                // TODO: Implement view comments functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReelItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 100.0,
      color: Colors.blue,

    );
  }
}

class PostItem extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String description;
  final List<Comment> comments;
  final VoidCallback onPressedViewComments;

  const PostItem({
    required this.avatarUrl,
    required this.name,
    required this.description,
    required this.comments,
    required this.onPressedViewComments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              SizedBox(width: 8.0),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 8.0),


          ElevatedButton(
            onPressed: onPressedViewComments,
            child: Text('View Comments'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.blue;
                  }
                  return Colors.blue[250]; // Use the component's default.
                },
              ),
            ),
          ),
          SizedBox(height: 8.0),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return CommentItem(
                avatarUrl: comment.avatarUrl,
                name: comment.name,
                comment: comment.comment,
              );
            },
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String avatarUrl;
  final String name;
  final String comment;

  const Comment({
    required this.avatarUrl,
    required this.name,
    required this.comment,
  });
}

class CommentItem extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String comment;

  const CommentItem({
    required this.avatarUrl,
    required this.name,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.0,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                comment,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}