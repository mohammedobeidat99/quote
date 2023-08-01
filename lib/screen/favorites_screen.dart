import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/colors.dart'; // Add this import

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final Favorites _favorites = Favorites();

  @override
  void initState() {
    super.initState();
    _initFavorites();
  }

  Future<void> _initFavorites() async {
    await _favorites.initSharedPreferences(); // Load favorite quotes from SharedPreferences
    setState(() {}); // Refresh the UI after loading favorites
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(61, 131, 97, 1),
          title: Text(
            'المفضلة',
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
        body: ListView.builder(
          itemCount: _favorites.favoriteQuotes.length,
          itemBuilder: (context, index) {
            var quote = _favorites.favoriteQuotes[index];

            return Container(
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
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              quote,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Divider(
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
                                ClipboardData(text: quote),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
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
                              color: _favorites.favoriteQuotes.contains(quote)
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_favorites.favoriteQuotes.contains(quote)) {
                                  _favorites.removeQuoteFromFavorites(quote);
                                } else {
                                  _favorites.addQuoteToFavorites(quote);
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
                              Share.share(quote);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}







class Favorites {
  static final Favorites _instance = Favorites._internal();

  factory Favorites() => _instance;

  Favorites._internal();

  List<String> _favoriteQuotes = [];

  List<String> get favoriteQuotes => _favoriteQuotes;

  Future<void> initSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _favoriteQuotes = prefs.getStringList('favoriteQuotes') ?? [];
  }

  Future<void> addQuoteToFavorites(String quote) async {
    if (!_favoriteQuotes.contains(quote)) {
      _favoriteQuotes.add(quote);
      await _saveFavoritesToSharedPreferences(); // Save favorite quotes to SharedPreferences
    }
  }

  Future<void> removeQuoteFromFavorites(String quote) async {
    _favoriteQuotes.remove(quote);
    await _saveFavoritesToSharedPreferences(); // Save favorite quotes to SharedPreferences
  }

  Future<void> _saveFavoritesToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteQuotes', _favoriteQuotes);
  }
}
