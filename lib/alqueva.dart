import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';

import 'alqueva_es.dart';
import 'main.dart';
import 'main_es.dart';
import 'maps.dart';

void main() => runApp(Alqueva());

class Alqueva extends StatefulWidget {
  Alqueva({Key? key}) : super(key: key);

  @override
  _AlquevaState createState() => _AlquevaState();
}

class _AlquevaState extends State<Alqueva> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  List<String> list = [
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A1-placa+entrada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A10-Igreja+S%C3%A3o+Lounre%C3%A7o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A11-Igreja+S%C3%A3o+Lounre%C3%A7o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A12-praia+alqueva.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A12B-Praia+de+Alqueva.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A13-Ermida+sto+antonio.JPG',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A14-vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A15-vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A16-vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A17-Monumento.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A18-Monumento.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A19-patrimonio+natural.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A2-placa+entrada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A20-ancoradouro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A21+-+Aldeia+de+Alqueva.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A22-Aldeia+de+Alqueva.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A3-museu+medronho.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A4-museu+medronho.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A4B+-+Museu+do+Medronho.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A5-barragem.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A7-barragem.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A8-ancoradouro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Alqueva/A9-ancoradouro.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final title = '';
    int _current = 0;
    final CarouselController _controller = CarouselController();
    var screenSize = MediaQuery.of(context).size;

    if(screenSize.width < 384) {return MaterialApp(
      title: title,
      home: Scaffold(
        //extendBodyBehindAppBar:true,
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: CustomScrollView(
          slivers: <Widget>[
            // Add the app bar to the CustomScrollView.
            SliverAppBar(
              title: Text(''),
              floating: true,
              expandedHeight: 50,
              //pinned: true,
              snap: true,
              backgroundColor: Colors.transparent, elevation: 0.0,
              actions: <Widget>[
                /*IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),*/
                Column(
                  children: [
                    Builder(
                      builder: (context) => ControlButtons(_player),
                      /*ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0.0),
                          primary: Colors.transparent,
                          elevation: 0.0,
                          fixedSize: Size(50, 50)),
                      onPressed: () {},
                      child: Image.asset(
                          "assets/bussola.png",
                          fit: BoxFit.cover,

                      ),),*/
                    ),
                  ],
                ),

              ],
            ),
            // Next, create a SliverList
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildListDelegate([
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      //enlargeCenterPage: true,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 5),
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 900),
                      viewportFraction: 1,
                    ),
                    items: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[0],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[0],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[1],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[1],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[2],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[2],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[3],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[3],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[4],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[4],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[5],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[5],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[6],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[6],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[7],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[7],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[8],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[8],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[9],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[9],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[10],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[10],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[11],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[11],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[12],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[12],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[13],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[13],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[14],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[14],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[15],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[15],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[16],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[16],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[17],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[17],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[18],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[18],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[19],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[19],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[20],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[20],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[21],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[21],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 5.0,
                        height: 5.0,
                        margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == entry.key ? 0.4 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, left: 45),
                  child: Text(
                    "Alqueva",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Metropolis',
                        color: Color.fromRGBO(84, 156, 193, 1.0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                /*Container(
                    padding: const EdgeInsets.only(top: 30, left: 45),
                    child: Text(
                      "Atividades",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),*/
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/ancora.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*child: Tooltip(
                                  message: 'N??uticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "N??uticas",
                                      style: TextStyle(fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/bussola.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*child: Tooltip(
                                  message: 'N??uticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Turismo",
                                      style: TextStyle(fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/mar.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*child: Tooltip(
                                  message: 'N??uticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Albufeira",
                                      style: TextStyle(fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/natureza.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*child: Tooltip(
                                  message: 'N??uticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Natureza",
                                      style: TextStyle(fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      /*
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],),*/
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: ReadMoreText(
                        "Carregada de hist??ria e com uma natureza invej??vel a servir de cen??rio, a Aldeia do Alqueva ?? hoje uma das v??rias aldeias ribeirinhas que circundam o Grande Lago de Alqueva. Pertencente ?? freguesia do mesmo nome e situada no extremo sul do concelho de Portel, as primeiras refer??ncias a esta aldeia remontam ao s??culo XIII, estando a Igreja de S. Louren??o de Alqueva entre os sete templos fundados por D. Jo??o Peres de Aboim ??? o povoador de Portel, no territ??rio que lhe fora atribu??do. O que haver??, ent??o, de t??o especial para descobrir em Alqueva? Reconhecida tamb??m pela associa????o ao nome da Barragem de Alqueva, uma infraestrutura que permitiu criar e garantir condi????es ??nicas para o desenvolvimento econ??mico da regi??o ??? outrora marcada pela agricultora como atividade principal ??? h?? uma s??rie de motivos para explorar a riqueza cultural e gastron??mica que a regi??o tem para oferecer. De entre os v??rios pontos atrativos, destaca-se o observat??rio oficial do Dark Sky, que compreende tamb??m os munic??pios de Reguengos de Monsaraz, Portel, Alandroal, Mour??o, Moura e Barrancos, e tem v??rios telesc??pios dispon??veis para uma verdadeira viagem c??smica. A observa????o solar e astron??mica permite visualizar nebulosas, gal??xias e aglomerados de estrelas.  \n\nRecuando no tempo, concluiu-se que a ??rea correspondente ?? atual freguesia de Alqueva j?? viria a ser povoada na segunda metade do s??culo XIII, ainda que de uma forma dispersa por v??rias herdades, supondo que a atividade agr??cola poder?? ter contribu??do para a designa????o e origem topon??mica da aldeia. Esta liga????o ?? terra agricultada e ao cultivo poder?? ser explicada pela refer??ncia ao termo ???alqueive??? que se traduzia em ???terra do pousio??? ou ???terra deserta??? ??? o que se pode constatar pelos solos secos e ??speros da regi??o, constituindo um dos entraves ao respetivo desenvolvimento. Desde o in??cio da sua povoa????o que esta ??rea integra as terras outrora concebidas pelo Rei D. Afonso III ao seu mordomo-mor D. Jo??o Peres de Aboim. Juntamente com outras, essas terras viriam a constituir o novo termo de Portel, inserido entre o termo de ??vora, de Beja e de Monsaraz. A proximidade da aldeia ao rio Guadiana (um dos mais extensos de toda a Pen??nsula Ib??rica) foi em tempos deveras importante, dada a sua for??a econ??mica, resultante quer pela abund??ncia de peixe, como pela fonte de energia que permitiu criar condi????es para a exist??ncia de v??rios moinhos para a ???fatura de farinhas???.?? \n\nA viagem tur??stica pela riqueza sociocultural da Aldeia de Alqueva inicia-se no centro, percet??vel desde o Largo da Igreja ao Largo da Vila. Toda a freguesia ?? rica em monumentos e vest??gios arquitet??nicos que expressam a beleza natural da regi??o. A visita prossegue para a Igreja Paroquial de S??o Louren??o de Alqueva, uma igreja barroca fundada no s??culo XIII (embora o atual templo esteja datado do s??culo XVIII), sofreu obras de requalifica????o nos dois s??culos seguintes. A igreja viria a ser melhorada ap??s a visita do Cardeal-Infante D. Afonso, em 1534, ainda que a obra de arquitetura tenha resultado de interven????es j?? posteriores a 1755. No interior da igreja matriz avista-se uma pequena imagem de S. Miguel Arcanjo e ainda uma pia batismal e uma para ??gua benta: uma manuelina e a outra tardo-barroca. \n\nUm outro ponto de interesse nesta viagem hist??rica ?? a Ermida de Santo Ant??nio, uma ermida maneirista em forma de cuba e cobertura em c??pula, que se encontra situada no ponto mais alto da aldeia, sendo poss??vel contemplar o Grande Lago de Alqueva. Datada do s??culo XVI-XVII, no interior desta capela-mor encontramos uma pia de ??gua benta e ainda um p??lpito em alvenaria, onde est??o representadas algumas imagens representativas de jovens soldados, recordando as promessas em tempos feitas pelos devotos, por ocasi??o da guerra colonial. J?? o Museu do Medronho disp??e de quatro ??reas distintas, come??ando pela vertente de exposi????o, na qual ?? poss??vel conhecer o medronho: a caracteriza????o da planta e do fruto, o seu ciclo de vida e at?? o processo de destila????o do fruto. Ainda no Museu, h?? uma loja de produtos regionais, como mel, compotas, plantas naturais para infus??o e confeitaria artesanal.?? \n\nMais recente ?? a Praia Fluvial de Alqueva, uma das atra????es imperd??veis, estando aberta durante a ??poca balnear. Encontra-se a 1,5 km da aldeia, num antigo parque de merendas, e destaca-se pela fant??stica vista sobre a Barragem de Alqueva. A aldeia ?? ainda muito conhecida culturalmente pelo fabrico das tradicionais botas caneleiras em pele de cabra ou de vaca, que s??o, ainda hoje, produzidas de forma artesanal. Atualmente ?? poss??vel visitar a oficina de Jer??nimo Gaud??ncio, uma marca centen??ria que mant??m viva a tradi????o implementada pelo sapateiro que cedeu o nome ao neg??cio. A produ????o continua a ser maioritariamente artesanal, implementando novas t??cnicas e materiais mais inovadores.  \n\nNesta pequena vila situada no cora????o do Alentejo, a riqueza hist??rica funde-se com as maravilhas da regi??o, oferecendo uma s??rie de propostas de turismo rural e gastron??mico, destacando os sabores e as iguarias locais que acompanham os vinhos regionais tamb??m muito apreci??veis.  \n\nNuma visita mais prolongada, n??o faltam locais para pernoitar e desfrutar da tranquilidade da regi??o. Muito central est?? a Estrelinha d???Alqueva, uma casa que disp??e de v??rios espa??os de lazer, ou a Herdade Monte da Tapada, situada bem no monte alentejano e muito pr??ximo do centro da Aldeia de Alqueva, sendo um local acolhedor e muito prop??cio ao descanso, dado o sil??ncio da paisagem que se funde com a harmonia da natureza. Uma outra proposta poder?? ainda ser o Alqueva Hostel que ?? recomendado a fam??lias. Para desfrutar das iguarias da regi??o, a sugest??o ser?? no Restaurante Costa do Sol, onde a especialidade s??o os grelhados, ou o Restaurante O Seara. ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Metropolis',
                        ),
                        trimLines: 10,
                        colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Mostrar mais',
                        trimExpandedText: ' Mostrar menos',
                        //textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                ),
                ExpansionTile(
                  title: Text("Estadia",style: TextStyle(color: Colors.black),),
                  children: [
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  "Numa visita mais prolongada, n??o faltam locais para pernoitar e desfrutar da tranquilidade da regi??o. Muito central est?? a Estrelinha d???Alqueva, uma casa que disp??e de v??rios espa??os de lazer, ou a Herdade Monte da Tapada, situada bem no monte alentejano e muito pr??ximo do centro da Aldeia de Alqueva, sendo um local acolhedor e muito prop??cio ao descanso, dado o sil??ncio da paisagem que se funde com a harmonia da natureza. Uma outra proposta poder?? ainda ser o Alqueva Hostel que ?? recomendado a fam??lias. Para desfrutar das iguarias da regi??o, a sugest??o ser?? no Restaurante Costa do Sol, onde a especialidade s??o os grelhados, ou o Restaurante O Seara. ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(bottom: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],),),
          ],
        ),
      ),
    );}else {return MaterialApp(
      title: title,
      home: Scaffold(
        //extendBodyBehindAppBar:true,
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: CustomScrollView(
          slivers: <Widget>[
            // Add the app bar to the CustomScrollView.
            SliverAppBar(
              title: Text(''),
              floating: true,
              expandedHeight: 50,
              //pinned: true,
              snap: true,
              backgroundColor: Colors.transparent, elevation: 0.0,
              actions: <Widget>[
                /*IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),*/
                Column(
                  children: [
                    Builder(
                      builder: (context) => ControlButtons(_player),
                      /*ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0.0),
                          primary: Colors.transparent,
                          elevation: 0.0,
                          fixedSize: Size(50, 50)),
                      onPressed: () {},
                      child: Image.asset(
                          "assets/bussola.png",
                          fit: BoxFit.cover,

                      ),),*/
                    ),
                  ],
                ),

              ],
            ),
            // Next, create a SliverList
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildListDelegate([
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      //enlargeCenterPage: true,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 5),
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 900),
                      viewportFraction: 1,
                    ),
                    items: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[0],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[0],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[1],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[1],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[2],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[2],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[3],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[3],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[4],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[4],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[5],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[5],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[6],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[6],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[7],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[7],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[8],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[8],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[9],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[9],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[10],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[10],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[11],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[11],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[12],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[12],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[13],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[13],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[14],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[14],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[15],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[15],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[16],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[16],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[17],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[17],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[18],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[18],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[19],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[19],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[20],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[20],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[21],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return GestureDetector(
                                        child: Center(
                                          child: Hero(
                                            tag: 'hero',
                                            child: Image.network(
                                              list[21],
                                              fit: BoxFit.contain,
                                              width: 500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 5.0,
                        height: 5.0,
                        margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == entry.key ? 0.4 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, left: 45),
                  child: Text(
                    "Alqueva",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Metropolis',
                        color: Color.fromRGBO(84, 156, 193, 1.0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                /*Container(
                    padding: const EdgeInsets.only(top: 30, left: 45),
                    child: Text(
                      "Atividades",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),*/
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/ancora.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*child: Tooltip(
                                  message: 'N??uticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "N??uticas",
                                      style: TextStyle(fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/bussola.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*child: Tooltip(
                                  message: 'N??uticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Turismo",
                                      style: TextStyle(fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/mar.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*child: Tooltip(
                                  message: 'N??uticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Albufeira",
                                      style: TextStyle(fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/natureza.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*child: Tooltip(
                                  message: 'N??uticas',
                                  preferBelow: false,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  showDuration: Duration(seconds: 2),
                                  waitDuration: Duration(milliseconds: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0.0),
                                    onPressed: () {},
                                    child: new Tab(icon: new Image.asset("assets/bussola.png", fit: BoxFit.cover,),)
                                  ),
                                ),*/
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Natureza",
                                      style: TextStyle(fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      /*
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],),*/
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: ReadMoreText(
                        "Carregada de hist??ria e com uma natureza invej??vel a servir de cen??rio, a Aldeia do Alqueva ?? hoje uma das v??rias aldeias ribeirinhas que circundam o Grande Lago de Alqueva. Pertencente ?? freguesia do mesmo nome e situada no extremo sul do concelho de Portel, as primeiras refer??ncias a esta aldeia remontam ao s??culo XIII, estando a Igreja de S. Louren??o de Alqueva entre os sete templos fundados por D. Jo??o Peres de Aboim ??? o povoador de Portel, no territ??rio que lhe fora atribu??do. O que haver??, ent??o, de t??o especial para descobrir em Alqueva? Reconhecida tamb??m pela associa????o ao nome da Barragem de Alqueva, uma infraestrutura que permitiu criar e garantir condi????es ??nicas para o desenvolvimento econ??mico da regi??o ??? outrora marcada pela agricultora como atividade principal ??? h?? uma s??rie de motivos para explorar a riqueza cultural e gastron??mica que a regi??o tem para oferecer. De entre os v??rios pontos atrativos, destaca-se o observat??rio oficial do Dark Sky, que compreende tamb??m os munic??pios de Reguengos de Monsaraz, Portel, Alandroal, Mour??o, Moura e Barrancos, e tem v??rios telesc??pios dispon??veis para uma verdadeira viagem c??smica. A observa????o solar e astron??mica permite visualizar nebulosas, gal??xias e aglomerados de estrelas.  \n\nRecuando no tempo, concluiu-se que a ??rea correspondente ?? atual freguesia de Alqueva j?? viria a ser povoada na segunda metade do s??culo XIII, ainda que de uma forma dispersa por v??rias herdades, supondo que a atividade agr??cola poder?? ter contribu??do para a designa????o e origem topon??mica da aldeia. Esta liga????o ?? terra agricultada e ao cultivo poder?? ser explicada pela refer??ncia ao termo ???alqueive??? que se traduzia em ???terra do pousio??? ou ???terra deserta??? ??? o que se pode constatar pelos solos secos e ??speros da regi??o, constituindo um dos entraves ao respetivo desenvolvimento. Desde o in??cio da sua povoa????o que esta ??rea integra as terras outrora concebidas pelo Rei D. Afonso III ao seu mordomo-mor D. Jo??o Peres de Aboim. Juntamente com outras, essas terras viriam a constituir o novo termo de Portel, inserido entre o termo de ??vora, de Beja e de Monsaraz. A proximidade da aldeia ao rio Guadiana (um dos mais extensos de toda a Pen??nsula Ib??rica) foi em tempos deveras importante, dada a sua for??a econ??mica, resultante quer pela abund??ncia de peixe, como pela fonte de energia que permitiu criar condi????es para a exist??ncia de v??rios moinhos para a ???fatura de farinhas???.?? \n\nA viagem tur??stica pela riqueza sociocultural da Aldeia de Alqueva inicia-se no centro, percet??vel desde o Largo da Igreja ao Largo da Vila. Toda a freguesia ?? rica em monumentos e vest??gios arquitet??nicos que expressam a beleza natural da regi??o. A visita prossegue para a Igreja Paroquial de S??o Louren??o de Alqueva, uma igreja barroca fundada no s??culo XIII (embora o atual templo esteja datado do s??culo XVIII), sofreu obras de requalifica????o nos dois s??culos seguintes. A igreja viria a ser melhorada ap??s a visita do Cardeal-Infante D. Afonso, em 1534, ainda que a obra de arquitetura tenha resultado de interven????es j?? posteriores a 1755. No interior da igreja matriz avista-se uma pequena imagem de S. Miguel Arcanjo e ainda uma pia batismal e uma para ??gua benta: uma manuelina e a outra tardo-barroca. \n\nUm outro ponto de interesse nesta viagem hist??rica ?? a Ermida de Santo Ant??nio, uma ermida maneirista em forma de cuba e cobertura em c??pula, que se encontra situada no ponto mais alto da aldeia, sendo poss??vel contemplar o Grande Lago de Alqueva. Datada do s??culo XVI-XVII, no interior desta capela-mor encontramos uma pia de ??gua benta e ainda um p??lpito em alvenaria, onde est??o representadas algumas imagens representativas de jovens soldados, recordando as promessas em tempos feitas pelos devotos, por ocasi??o da guerra colonial. J?? o Museu do Medronho disp??e de quatro ??reas distintas, come??ando pela vertente de exposi????o, na qual ?? poss??vel conhecer o medronho: a caracteriza????o da planta e do fruto, o seu ciclo de vida e at?? o processo de destila????o do fruto. Ainda no Museu, h?? uma loja de produtos regionais, como mel, compotas, plantas naturais para infus??o e confeitaria artesanal.?? \n\nMais recente ?? a Praia Fluvial de Alqueva, uma das atra????es imperd??veis, estando aberta durante a ??poca balnear. Encontra-se a 1,5 km da aldeia, num antigo parque de merendas, e destaca-se pela fant??stica vista sobre a Barragem de Alqueva. A aldeia ?? ainda muito conhecida culturalmente pelo fabrico das tradicionais botas caneleiras em pele de cabra ou de vaca, que s??o, ainda hoje, produzidas de forma artesanal. Atualmente ?? poss??vel visitar a oficina de Jer??nimo Gaud??ncio, uma marca centen??ria que mant??m viva a tradi????o implementada pelo sapateiro que cedeu o nome ao neg??cio. A produ????o continua a ser maioritariamente artesanal, implementando novas t??cnicas e materiais mais inovadores.  \n\nNesta pequena vila situada no cora????o do Alentejo, a riqueza hist??rica funde-se com as maravilhas da regi??o, oferecendo uma s??rie de propostas de turismo rural e gastron??mico, destacando os sabores e as iguarias locais que acompanham os vinhos regionais tamb??m muito apreci??veis.  \n\nNuma visita mais prolongada, n??o faltam locais para pernoitar e desfrutar da tranquilidade da regi??o. Muito central est?? a Estrelinha d???Alqueva, uma casa que disp??e de v??rios espa??os de lazer, ou a Herdade Monte da Tapada, situada bem no monte alentejano e muito pr??ximo do centro da Aldeia de Alqueva, sendo um local acolhedor e muito prop??cio ao descanso, dado o sil??ncio da paisagem que se funde com a harmonia da natureza. Uma outra proposta poder?? ainda ser o Alqueva Hostel que ?? recomendado a fam??lias. Para desfrutar das iguarias da regi??o, a sugest??o ser?? no Restaurante Costa do Sol, onde a especialidade s??o os grelhados, ou o Restaurante O Seara. ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Metropolis',
                        ),
                        trimLines: 10,
                        colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Mostrar mais',
                        trimExpandedText: ' Mostrar menos',
                        //textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                ),
                ExpansionTile(
                  title: Text("Estadia",style: TextStyle(color: Colors.black),),
                  children: [
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  "Numa visita mais prolongada, n??o faltam locais para pernoitar e desfrutar da tranquilidade da regi??o. Muito central est?? a Estrelinha d???Alqueva, uma casa que disp??e de v??rios espa??os de lazer, ou a Herdade Monte da Tapada, situada bem no monte alentejano e muito pr??ximo do centro da Aldeia de Alqueva, sendo um local acolhedor e muito prop??cio ao descanso, dado o sil??ncio da paisagem que se funde com a harmonia da natureza. Uma outra proposta poder?? ainda ser o Alqueva Hostel que ?? recomendado a fam??lias. Para desfrutar das iguarias da regi??o, a sugest??o ser?? no Restaurante Costa do Sol, onde a especialidade s??o os grelhados, ou o Restaurante O Seara. ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Metropolis',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(bottom: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],),),
          ],
        ),
      ),
    );}


  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(
              "https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Alqueva.mp3"),
        ),
      );
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  ControlButtons(this.player);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if(screenSize.width < 384) {

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              player.stop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mapas()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blue,
            ),
          ),
          // Opens volume slider dialog
          /*IconButton(
          icon: Icon(
            Icons.volume_up,
            color: Colors.black,
          ),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),*/

          Container(margin: const EdgeInsets.only(left: 120),),

          /// This StreamBuilder rebuilds whenever the player state changes, which
          /// includes the playing/paused state and also the
          /// loading/buffering/ready state. Depending on the state we show the
          /// appropriate button or loading indicator.
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {

              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 30),
                    ),
                    Container(
                      width: 15.0,
                      height: 15.0,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              } else if (playing != true) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        color: Colors.blue,
                      ),
                      iconSize: 25.0,
                      onPressed: player.play,
                    ),
                  ],
                );
              } else if (processingState != ProcessingState.completed) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.pause,
                        color: Colors.blue,
                      ),
                      iconSize: 25.0,
                      onPressed: player.pause,
                    ),
                  ],
                );
              } else {
                return IconButton(
                  icon: Icon(
                    Icons.replay,
                    color: Colors.blue,
                  ),
                  iconSize: 25.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: Image.asset('assets/ptI.png'),
                  iconSize: 25,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: Image.asset('assets/esI.png'),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                    player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlquevaES()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    }
    else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              player.stop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mapas()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blue,
            ),
          ),
          // Opens volume slider dialog
          /*IconButton(
          icon: Icon(
            Icons.volume_up,
            color: Colors.black,
          ),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),*/

          Container(margin: const EdgeInsets.only(left: 210),),

          /// This StreamBuilder rebuilds whenever the player state changes, which
          /// includes the playing/paused state and also the
          /// loading/buffering/ready state. Depending on the state we show the
          /// appropriate button or loading indicator.
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {

              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 30),
                    ),
                    Container(
                      width: 15.0,
                      height: 15.0,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              } else if (playing != true) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        color: Colors.blue,
                      ),
                      iconSize: 25.0,
                      onPressed: player.play,
                    ),
                  ],
                );
              } else if (processingState != ProcessingState.completed) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.pause,
                        color: Colors.blue,
                      ),
                      iconSize: 25.0,
                      onPressed: player.pause,
                    ),
                  ],
                );
              } else {
                return IconButton(
                  icon: Icon(
                    Icons.replay,
                    color: Colors.blue,
                  ),
                  iconSize: 25.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: Image.asset('assets/ptI.png'),
                  iconSize: 25,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: Image.asset('assets/esI.png'),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                    player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlquevaES()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}

class _Shimmer extends StatelessWidget {
  const _Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 500.0,
        height: 300.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: Colors.white),
            child: Column(),
          ),
        ),
      ),
    );
  }
}
