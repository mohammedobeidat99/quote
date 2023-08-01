import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quote/constant/colors.dart';
import 'package:share/share.dart';

import '../model/category.dart';
import 'favorites_screen.dart';

class QuotesPage extends StatefulWidget {
  final Category category;
  String? title;

  QuotesPage({required this.category, this.title});

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final Favorites _favorites = Favorites();
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(61, 131, 97, 1),
          title: Text(
            widget.title!,
            style: const TextStyle(
              fontFamily: 'Lateef',
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.right,
          ),
          centerTitle: true,
          
        ),
        body: AnimationLimiter(
          child: ListView.builder(
            itemCount: widget.category.quotes.length,
            itemBuilder: (context, index) {
              var quote = widget.category.quotes[index];

              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 600),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: ScaleAnimation(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 225,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Icon(
                              Icons.format_quote,
                              color: Color2.main2,
                              size: 24,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              Icons.format_quote,
                              color: Color2.main2,
                              size: 24,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(8.0),
                                height: 130,
                                child: SingleChildScrollView(
                                  child: ListTile(
                                    title: Text(
                                      quote.text!,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                             const Divider(
                                thickness: 1,
                                color: Colors.grey,
                                endIndent: 60,
                                indent: 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.copy,
                                      color: Color2.main2,
                                    ),
                                    onPressed: () {
                                      Clipboard.setData(
                                        ClipboardData(text: quote.text!),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'تم نسخ النص إلى الحافظة',
                                            textAlign: TextAlign.right,
                                          ),
                                          backgroundColor: Color2.main2,
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: _favorites.favoriteQuotes
                                              .contains(quote.text!)
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_favorites.favoriteQuotes
                                            .contains(quote.text!)) {
                                          _favorites.removeQuoteFromFavorites(
                                              quote.text!);
                                        } else {
                                          _favorites.addQuoteToFavorites(
                                              quote.text!);
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.share,
                                      color: Color2.main3,
                                    ),
                                    onPressed: () {
                                      Share.share(quote.text!);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}