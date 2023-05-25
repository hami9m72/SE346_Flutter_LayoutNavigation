import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
      routes: {
        InfoPage.routeName: (context) =>
        const InfoPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
                Navigator.pushNamed(context,
                    InfoPage.routeName,
                    arguments: InfoArguments('', [
                      Comment(
                        avatarUrl: '' ,
                          name: 'Alexa',
                          comment: 'Thats Right',
                      ),
                      Comment(
                        avatarUrl: '',
                        name: 'Diana',
                        comment: 'Hahaa you so funny',
                      ),
                    ], 'Its So Nice', 'Max'));
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
                Navigator.pushNamed(context,
                    InfoPage.routeName,
                    arguments: InfoArguments('https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/5.png', [
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
                    ], 'Yeah I pass', 'Linda'));
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: onPressedViewComments,
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
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
                onPressed: () {},
                child: Text('View Comments'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueAccent;
                      }
                      return Colors.blue;
                    },
                  ),
                ),
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),

        Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('comments',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ListView.builder(
                  shrinkWrap: true,
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
            )
        ),
      ],
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

class InfoArguments {
  final String avatarUrl;
  final List<Comment> comments;
  final String name;
  final String description;

  InfoArguments(this.avatarUrl, this.comments, this.description, this.name);
}
//
//
class InfoPage extends StatelessWidget{
  const InfoPage({super.key});
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    var args = InfoArguments('https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/10.png',
        [], 'default', 'default');
    args = ModalRoute.of(context)!.settings.arguments as InfoArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.name + ' Info'),
      ),
      body: Container(
          child: SingleChildScrollView(
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
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(args.avatarUrl),
                      ),
                      SizedBox(width: 8.0),
                      Text(args.name, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bio', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8.0),
                      Text('', style: TextStyle(fontSize: 14.0)),
                      Text('', style: TextStyle(fontSize: 14.0)),
                      Text('', style: TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Friends', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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

                        ],
                      ),
                      SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('                              Load more', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold) ,),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Images', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                        ],
                      ),
                      SizedBox(width: 12.0),
                      Text('                              Load more', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold) ,),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                PostItem(
                  avatarUrl: args.avatarUrl,
                  name: args.name,
                  comments: args.comments,
                  description: args.description,
                  onPressedViewComments: () {},
                )
              ],
            ),
          )
      ),
    );
  }
}
