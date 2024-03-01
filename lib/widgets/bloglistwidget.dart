import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:misflo/pages/blogpost.dart';

class BlogPostItem extends StatelessWidget {
  final DateTime date;
  final String title;
  final String author;
  final String imageUrl;
  final String textcontent;

  const BlogPostItem({
    Key? key,
    required this.date,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.textcontent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String post_date = DateFormat('d MMMM yyyy').format(date);
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlogPost(
                        date: date,
                        title: title,
                        author: author,
                        image: imageUrl,
                        textcontent: textcontent,
                      )));
        },
        child: ListTile(
          leading: Image.network(imageUrl), // Image path kept as provided
          title: Text(title),
          subtitle: Text('$post_date by $author'),
        ),
      ),
    );
  }
}
