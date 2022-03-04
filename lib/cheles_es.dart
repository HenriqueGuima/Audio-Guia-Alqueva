import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';

import 'cheles.dart';
import 'main.dart';
import 'main_es.dart';
import 'mapsES.dart';

void main() => runApp(ChelesES());

class ChelesES extends StatefulWidget {
  ChelesES({Key? key}) : super(key: key);

  @override
  _ChelesState createState() => _ChelesState();
}

class _ChelesState extends State<ChelesES> {
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

    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P1+-Placa+Cheles.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P1b-Placa+Cheles.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P2-PLaca+Cheles.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P10-Cheles+Ermida+do+Santo+Cristo+da+Paz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P11-Cheles+Ermida+do+Santo+Cristo+da+Paz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P11b-Cheles+Ermida+do+Santo+Cristo+da+Paz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P12-Cheles+Ermida+do+Santo+Cristo+da+Paz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P13-Cheles-Igreja+de+Nossa+Senhora+da+Concei%C3%A7%C3%A3o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P14-Cheles-Igreja+de+Nossa+Senhora+da+Concei%C3%A7%C3%A3o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P14b-Cheles-Igreja+de+Nossa+Senhora+da+Concei%C3%A7%C3%A3o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P15-Cheles-Torre+Igreja+de+Nossa+Senhora+da+Concei%C3%A7%C3%A3o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P16-Cheles-Igreja+de+Nossa+Senhora+da+Concei%C3%A7%C3%A3o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P17-Cheles-Igreja+de+Nossa+Senhora+da+Concei%C3%A7%C3%A3o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P17b-Cheles-Igreja+de+Nossa+Senhora+da+Concei%C3%A7%C3%A3o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P18+rua+de+Cheles+-+recolha+tampas+plasticos.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P19b-Cheles-+arcadas+caf%C3%A9+na+base+do+pal%C3%A1cio+Condes+de+Via+Manuel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P20-Cheles-+Praia+fluvial.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P21-Cheles-+Praia+fluvial.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P22-Cheles-+Praia+fluvial.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P23-Cheles-+Praia+fluvial.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P24-Cheles-+Praia+fluvial.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P25-Cheles-+Praia+fluvial.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P26-+Albergue+Praia+Cheles.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P27-+Albergue+Praia+Cheles.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P28-+Albergue+Praia+Cheles.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P3-Cheles-+Vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P4-Cheles-+Ayuntamiento.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P5-Cheles+-+Palacio+Condes+de+Via+Manuel_.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P6-Cheles-+Torre+das+homenagens+do+Palacio+Condes+de+Via+Manuel.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P7-Cheles-+Rua+de+Cheles.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P8-Cheles+Ermida+do+Santo+Cristo+da+Paz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Cheles/P9-Cheles+Ermida+do+Santo+Cristo+da+Paz.jpg',
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
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[22],
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
                                              list[22],
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
                                  list[23],
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
                                              list[23],
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
                                  list[24],
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
                                              list[24],
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
                                  list[25],
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
                                              list[25],
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
                                  list[26],
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
                                              list[26],
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
                                  list[27],
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
                                              list[27],
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
                                list[28],
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
                                            list[28],
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
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: GestureDetector(
                            child: Hero(
                              tag: 'hero',
                              child: Image.network(
                                list[29],
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
                                            list[29],
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
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: GestureDetector(
                            child: Hero(
                              tag: 'hero',
                              child: Image.network(
                                list[30],
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
                                            list[30],
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
                          ),
                        ),
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
                    "Cheles",
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
                                  message: 'Náuticas',
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
                                      "Náuticas",
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
                                  message: 'Náuticas',
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
                                  message: 'Náuticas',
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
                                  message: 'Náuticas',
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
                        "Al lado del Gran Lago de Alqueva, el pueblo de Cheles pertenece a la provincia de Badajoz, sirviendo el río Guadiana como frontera con Portugal. El municipio fronterizo español abarca una superficie de 47,90 km² y cuenta con unos 1200 habitantes. Situado a 52 km de Badajoz y 24 km de Olivenza (la capital de la comarca), la localidad está situada en una depresión al este, sur y oeste y descubierta al norte. \n\nLa perfecta combinación entre agua y naturaleza aumenta el valor de la región, permitiendo la existencia de varias actividades diferentes, destacando las diversas rutas turísticas, tanto pedestres como en bicicleta. La proximidad al río también permite la práctica de deportes náuticos, siendo el piragüismo la actividad más demandada. La ubicación geográfica a orillas del río Guadiana, que marca la frontera natural con Portugal, también fue muy importante para la evolución histórica de esta región, alternando entre períodos marcados por enfrentamientos y otros de perfecta convivencia. \n\nCuando conocemos en profundidad la historia de Cheles, podemos darmos cuenta de que el primitivo núcleo urbano, de origen musulmán, se construyó en el lugar de San Blas, y fue posteriormente conquistado por los Caballeros Templarios (en 1231), durante el reinado de Fernando III de Castilla. Aunque nunca fue un lugar fortificado, en comparación con las fortalezas del país vecino, Cheles encontraría en el siglo XVI una época favorable para el desarrollo urbanístico, principalmente gracias a la familia de Manuel Villena. Precisamente en esta altura se construyó la Iglesia de Nuestra Señora de La Purísima Concepción, que hoy es una admirable estructura religiosa en el pueblo, con una cruz latina de estilo románico. Al igual que el resto de regiones de la Península, Cheles estuvo bajo dominio musulmán hasta 1231, cuando fue reconquistada durante el reinado de Fernando III. A principios del siglo XIX, el pueblo ya no estaba rodeado por el territorio portugués, pero Manuel Godoy conquistó la comarca de Olivenza, a petición de Napoleón durante la Guerra de las Naranjas. \n\nComo consecuencia de los continuos conflictos fronterizos derivados de la Guerra de la Restauración, todavía en el siglo XVII, el pueblo acabó siendo temporalmente despoblado hasta que volvió a recibir como habitantes a un gran número de familias fronterizas portuguesas. Aunque el pueblo estuvo muy aislado hasta la construcción de la presa de Alqueva, Cheles conserva un rico patrimonio cultural, también reconocido por la expresión del canto y la poesía alentejanos, donde no puede faltar una cocina tradicional, heredera de la mejor tradición cinegética, del pescado del río y también de los productos de la sierra. \n\nLas ermitas y santuarios son puntos de interés de la localidad, como es el caso de la Ermita de San Goldrofe, Los Mártires y Santa Clara. Además del vasto patrimonio de carácter religioso, se encuentra el Palacio Señorial de los Condes de Cheles de Via-Manuel, que fue construido en el siglo XVII, adquiriendo todavía mayor relevancia al contemplar diferentes categorías arquitectónicas. La construcción del palacio tiene lugar en dos fases, la primera de las cuales comienza con el regreso del “señor” a la ciudad, después de que Castilla y Portugal asumieran la paz en el Tratado de Lisboa. La parte más antigua comprende toda la vertiente desde la torre de homenaje hasta el inicio del arco. En cuanto a la Ermita del Santo Cristo, se desconoce la fecha exacta de su construcción, sin embargo se supone que fue entre el último tercio del siglo XVII y el primer cuarto del siglo XVIII. Su construcción nace como un homenaje a la victoria en la batalla contra Portugal. Así, la imagen del Cristo Crucificado recibe el sobrenombre de “La Paz”. Esta capilla está compuesta por dos partes: un presbiterio en forma de cubo, que está coronado por una tapa esférica, y una nave central rectangular con bóveda de cañón. \n\nComo importante patrimonio religioso, cabe destacar la Ermita de S. Román y la iglesia parroquial, que fue consagrada a Nuestra Señora de las Nieves. Pero los atractivos turísticos no se acaban aquí. Quienes pasan por el pueblo también pueden disfrutar de la riqueza de la naturaleza que rodea a la Playa Fluvial de Cheles, ubicada en una zona más periférica de la localidad. Además de las diversas actividades náuticas que se pueden practicar en la región, como paddle surf, kayak o incluso paseos en barco, además de los recorridos pedestres que ofrecen grandes oportunidades para descubrir la riqueza de esta tierra. \n\nUn dato curioso: el pueblo de Cheles está ubicado en una zona reconocida con el certificado Starlight, ya que es un territorio que garantiza excelentes condiciones para contemplar el magnífico cielo durante la mayor parte del año. El municipio de Cheles también está incluido en la Reserva DarkSky Alqueva. Son varios los eventos que se realizan anualmente en Cheles, algunos de los cuales son un verdadero homenaje a la tradición. En febrero, la “Masacre Popular” es un evento que combina el deporte con la tradición relacionada con los cerdos, seguido del “Ven a la era” en agosto, que tiene como objetivo dar a conocer el trabajo de campo antes de la llegada de las máquinas agrícolas. En septiembre, se realiza una fiesta simbólica en honor al patrón del pueblo, el Santo Cristo de la Paz, previa a la “Carrera Popular de Alqueva”, en octubre, en la que es habitual la participación de varios corredores de diferentes localidades. Incluso en esa época, es habitual que el pueblo celebre la “Feria del Pescado” acompañado por cocineros de Alandroal que preparan y degustan platos típicos de ambos países, teniendo al pescado como protagonista. \n\nPara quien busca pernoctar en la zona y quiere disfrutar, en mayor medida, de las oportunidades que ofrece la región, el Hostal La Casa Verde, la Casa Rural La Fontana, la Casa Rural Sierra San Blas y el Albergue y parking para Caravanas son perfectas sugerencias. Para comer el Restaurante Chiringuito Pijín o el Restaurante Dehesa de San Bas son de las mejores recomendaciones para disfrutar de los sabores de esta tierra.  ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Metropolis',
                        ),
                        trimLines: 10,
                        colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Mostrar más',
                        trimExpandedText: ' Mostrar menos',
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                ),
                ExpansionTile(
                  title: Text("Alojamiento",style: TextStyle(color: Colors.black),),
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
                                  "Para quien busca pernoctar en la zona y quiere disfrutar, en mayor medida, de las oportunidades que ofrece la región, el Hostal La Casa Verde, la Casa Rural La Fontana, la Casa Rural Sierra San Blas y el Albergue y parking para Caravanas son perfectas sugerencias. Para comer el Restaurante Chiringuito Pijín o el Restaurante Dehesa de San Bas son de las mejores recomendaciones para disfrutar de los sabores de esta tierra.  ",
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
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[22],
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
                                              list[22],
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
                                  list[23],
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
                                              list[23],
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
                                  list[24],
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
                                              list[24],
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
                                  list[25],
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
                                              list[25],
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
                                  list[26],
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
                                              list[26],
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
                                  list[27],
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
                                              list[27],
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
                                list[28],
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
                                            list[28],
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
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: GestureDetector(
                            child: Hero(
                              tag: 'hero',
                              child: Image.network(
                                list[29],
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
                                            list[29],
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
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: GestureDetector(
                            child: Hero(
                              tag: 'hero',
                              child: Image.network(
                                list[30],
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
                                            list[30],
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
                          ),
                        ),
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
                    "Cheles",
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
                                  message: 'Náuticas',
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
                                      "Náuticas",
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
                                  message: 'Náuticas',
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
                                  message: 'Náuticas',
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
                                  message: 'Náuticas',
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
                        "Al lado del Gran Lago de Alqueva, el pueblo de Cheles pertenece a la provincia de Badajoz, sirviendo el río Guadiana como frontera con Portugal. El municipio fronterizo español abarca una superficie de 47,90 km² y cuenta con unos 1200 habitantes. Situado a 52 km de Badajoz y 24 km de Olivenza (la capital de la comarca), la localidad está situada en una depresión al este, sur y oeste y descubierta al norte. \n\nLa perfecta combinación entre agua y naturaleza aumenta el valor de la región, permitiendo la existencia de varias actividades diferentes, destacando las diversas rutas turísticas, tanto pedestres como en bicicleta. La proximidad al río también permite la práctica de deportes náuticos, siendo el piragüismo la actividad más demandada. La ubicación geográfica a orillas del río Guadiana, que marca la frontera natural con Portugal, también fue muy importante para la evolución histórica de esta región, alternando entre períodos marcados por enfrentamientos y otros de perfecta convivencia. \n\nCuando conocemos en profundidad la historia de Cheles, podemos darmos cuenta de que el primitivo núcleo urbano, de origen musulmán, se construyó en el lugar de San Blas, y fue posteriormente conquistado por los Caballeros Templarios (en 1231), durante el reinado de Fernando III de Castilla. Aunque nunca fue un lugar fortificado, en comparación con las fortalezas del país vecino, Cheles encontraría en el siglo XVI una época favorable para el desarrollo urbanístico, principalmente gracias a la familia de Manuel Villena. Precisamente en esta altura se construyó la Iglesia de Nuestra Señora de La Purísima Concepción, que hoy es una admirable estructura religiosa en el pueblo, con una cruz latina de estilo románico. Al igual que el resto de regiones de la Península, Cheles estuvo bajo dominio musulmán hasta 1231, cuando fue reconquistada durante el reinado de Fernando III. A principios del siglo XIX, el pueblo ya no estaba rodeado por el territorio portugués, pero Manuel Godoy conquistó la comarca de Olivenza, a petición de Napoleón durante la Guerra de las Naranjas. \n\nComo consecuencia de los continuos conflictos fronterizos derivados de la Guerra de la Restauración, todavía en el siglo XVII, el pueblo acabó siendo temporalmente despoblado hasta que volvió a recibir como habitantes a un gran número de familias fronterizas portuguesas. Aunque el pueblo estuvo muy aislado hasta la construcción de la presa de Alqueva, Cheles conserva un rico patrimonio cultural, también reconocido por la expresión del canto y la poesía alentejanos, donde no puede faltar una cocina tradicional, heredera de la mejor tradición cinegética, del pescado del río y también de los productos de la sierra. \n\nLas ermitas y santuarios son puntos de interés de la localidad, como es el caso de la Ermita de San Goldrofe, Los Mártires y Santa Clara. Además del vasto patrimonio de carácter religioso, se encuentra el Palacio Señorial de los Condes de Cheles de Via-Manuel, que fue construido en el siglo XVII, adquiriendo todavía mayor relevancia al contemplar diferentes categorías arquitectónicas. La construcción del palacio tiene lugar en dos fases, la primera de las cuales comienza con el regreso del “señor” a la ciudad, después de que Castilla y Portugal asumieran la paz en el Tratado de Lisboa. La parte más antigua comprende toda la vertiente desde la torre de homenaje hasta el inicio del arco. En cuanto a la Ermita del Santo Cristo, se desconoce la fecha exacta de su construcción, sin embargo se supone que fue entre el último tercio del siglo XVII y el primer cuarto del siglo XVIII. Su construcción nace como un homenaje a la victoria en la batalla contra Portugal. Así, la imagen del Cristo Crucificado recibe el sobrenombre de “La Paz”. Esta capilla está compuesta por dos partes: un presbiterio en forma de cubo, que está coronado por una tapa esférica, y una nave central rectangular con bóveda de cañón. \n\nComo importante patrimonio religioso, cabe destacar la Ermita de S. Román y la iglesia parroquial, que fue consagrada a Nuestra Señora de las Nieves. Pero los atractivos turísticos no se acaban aquí. Quienes pasan por el pueblo también pueden disfrutar de la riqueza de la naturaleza que rodea a la Playa Fluvial de Cheles, ubicada en una zona más periférica de la localidad. Además de las diversas actividades náuticas que se pueden practicar en la región, como paddle surf, kayak o incluso paseos en barco, además de los recorridos pedestres que ofrecen grandes oportunidades para descubrir la riqueza de esta tierra. \n\nUn dato curioso: el pueblo de Cheles está ubicado en una zona reconocida con el certificado Starlight, ya que es un territorio que garantiza excelentes condiciones para contemplar el magnífico cielo durante la mayor parte del año. El municipio de Cheles también está incluido en la Reserva DarkSky Alqueva. Son varios los eventos que se realizan anualmente en Cheles, algunos de los cuales son un verdadero homenaje a la tradición. En febrero, la “Masacre Popular” es un evento que combina el deporte con la tradición relacionada con los cerdos, seguido del “Ven a la era” en agosto, que tiene como objetivo dar a conocer el trabajo de campo antes de la llegada de las máquinas agrícolas. En septiembre, se realiza una fiesta simbólica en honor al patrón del pueblo, el Santo Cristo de la Paz, previa a la “Carrera Popular de Alqueva”, en octubre, en la que es habitual la participación de varios corredores de diferentes localidades. Incluso en esa época, es habitual que el pueblo celebre la “Feria del Pescado” acompañado por cocineros de Alandroal que preparan y degustan platos típicos de ambos países, teniendo al pescado como protagonista. \n\nPara quien busca pernoctar en la zona y quiere disfrutar, en mayor medida, de las oportunidades que ofrece la región, el Hostal La Casa Verde, la Casa Rural La Fontana, la Casa Rural Sierra San Blas y el Albergue y parking para Caravanas son perfectas sugerencias. Para comer el Restaurante Chiringuito Pijín o el Restaurante Dehesa de San Bas son de las mejores recomendaciones para disfrutar de los sabores de esta tierra.  ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Metropolis',
                        ),
                        trimLines: 10,
                        colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Mostrar más',
                        trimExpandedText: ' Mostrar menos',
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                ),
                ExpansionTile(
                  title: Text("Alojamiento",style: TextStyle(color: Colors.black),),
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
                                  "Para quien busca pernoctar en la zona y quiere disfrutar, en mayor medida, de las oportunidades que ofrece la región, el Hostal La Casa Verde, la Casa Rural La Fontana, la Casa Rural Sierra San Blas y el Albergue y parking para Caravanas son perfectas sugerencias. Para comer el Restaurante Chiringuito Pijín o el Restaurante Dehesa de San Bas son de las mejores recomendaciones para disfrutar de los sabores de esta tierra.  ",
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
              "https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Cheles_es.mp3"),
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
                MaterialPageRoute(builder: (context) => MapasES()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blue,
            ),
          ),

          Container(margin: const EdgeInsets.only(left: 120),),
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
                      padding: const EdgeInsets.only(top: 15, right: 30),
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
                  icon: Image.asset('assets/pt.png'),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                    player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cheles()),
                    );
                  },
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
                  icon: Image.asset('assets/es.png'),
                  iconSize: 25,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      );
    }else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              player.stop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapasES()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blue,
            ),
          ),

          Container(margin: const EdgeInsets.only(left: 210),),
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
                      padding: const EdgeInsets.only(top: 15, right: 30),
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
                  icon: Image.asset('assets/pt.png'),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                    player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cheles()),
                    );
                  },
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
                  icon: Image.asset('assets/es.png'),
                  iconSize: 25,
                  onPressed: () {},
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
