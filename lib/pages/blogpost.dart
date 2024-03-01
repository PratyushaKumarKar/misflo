import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:misflo/utils/screentools.dart';

class BlogPost extends StatefulWidget {
  final String title;
  final String author;
  final String image;
  final String textcontent;
  final DateTime date;
  const BlogPost(
      {super.key,
      required this.title,
      required this.author,
      required this.image,
      required this.textcontent,
      required this.date});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  @override
  Widget build(BuildContext context) {
    print(widget.textcontent.split(' ').length);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.25), BlendMode.darken),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: width(context, 330),
                        left: width(context, 16),
                        right: width(context, 16)),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 72,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width(context, 16), top: height(context, 16)),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.author,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height(context, 5), left: width(context, 16)),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            DateFormat('d MMMM yyyy on hh:mm')
                                .format(widget.date),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color(0xFF878787)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: height(context, 15),
                        ),
                        child: Container(
                            height: 0.5,
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xFF878787)),
                      )
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HtmlWidget(
                        widget.textcontent,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
