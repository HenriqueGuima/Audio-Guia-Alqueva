import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'main.dart';
import 'maps.dart';
import 'monsaraz_es.dart';

void main() => runApp(Monsaraz());

class Monsaraz extends StatefulWidget {
  Monsaraz({Key? key}) : super(key: key);

  @override
  _MonsarazState createState() => _MonsarazState();
}

class _MonsarazState extends State<Monsaraz> {
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
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J1-Monsaraz+Observat%C3%B3rio+Lago+Alqueva+(2).jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J10-Praia+Fluvial+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J11-Praia+Fluvial+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J13-Praia+Fluvial+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J14-Monsaraz+Patrim%C3%B3nio+Natural.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J15-Monsaraz+Vista+geral+do+Observat%C3%B3rio.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J16-Monsaraz+Vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J17-Monsaraz+Monumento+7+maravilhas.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J18-Monsaraz+Homeagem+ao+Cante.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J19-Monsaraz+Homeagem+ao+Cante.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J2-Monsaraz+Observat%C3%B3rio+Lago+Alqueva+(3).jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J20-Monsaraz+Vista+do+Miradouro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J21-Monsaraz+Vista+do+Miradouro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J22-Monsaraz+vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J23-Monsaraz+Vista+do+Miradouro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J24-Ruas+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J25-Ruas+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J26-Ruas+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J27-Entrada+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J28-Monsaraz+Museu+do+Fresco.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J29-Monsaraz+Igreja+Matriz+de+Santa+Maria+da+Lagoa-Editar.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J30-Monsaraz+Galeria+de+Arte+da+Igreja+de+Santiago.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J31-Monsaraz+Galeria+de+Arte+da+Igreja+de+Santiago.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J33-Monsaraz+Hospital+de+Sta+Casa+da+Miseric%C3%B3rdia.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J34-Monsaraz+Casa+da+Inquisi%C3%A7%C3%A3o.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J35-Casa+Monsaraz+e+Pelourinho.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J36-Monsaraz+Rua+com+vista+para+o+Castelo.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J37-Castelo+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J38-Castelo+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J39-Ruas+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J4-Centro+N%C3%A1utico+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J40-Monsaraz+vista+geral.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J41-Monsaraz+Forte+de+S.+Bento+e+Ermida.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J42-Monsaraz+placa+entrada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J43-Monsaraz+placa+ribeirinha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J44-Hospital+Sta+Casa+Miseric%C3%B3rdia.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J45-janela+emblem%C3%A1tica+Castelo+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J46-Vista+do+Castelo+para+a+aldeia.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J47-pra%C3%A7a+de+Touros+do+Castelo+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J48-Castelo+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J49-Vista+do+Castelo+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J5-Cais+de+Monsaraz.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Monsaraz/J7-Cais+de+Monsaraz.jpg',
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
                        Container(
                          margin: EdgeInsets.all(6.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[31],
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
                                              list[31],
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
                                  list[32],
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
                                              list[32],
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
                                  list[33],
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
                                              list[33],
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
                                  list[34],
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
                                              list[34],
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
                                  list[35],
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
                                              list[35],
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
                                  list[36],
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
                                              list[36],
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
                                  list[37],
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
                                              list[37],
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
                                  list[38],
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
                                              list[38],
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
                                  list[39],
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
                                              list[39],
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
                                  list[40],
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
                                              list[40],
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
                                  list[41],
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
                                              list[41],
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
                      "Monsaraz",
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
                          "Protegida pelas suas muralhas, a vila histórica de Monsaraz é uma pequena povoação com ruas de xisto e paredes caiadas de branco que contrastam com o perfeito azul do Alqueva. As ruas estreitas percorrem locais encantadores com uma paisagem alentejana deslumbrante sobre o Grande Lago a servir de cenário. \n\nDesafiando o tempo e num harmonioso rasgo com a tranquilidade da paisagem envolvente, esta histórica vila espelha a beleza que sempre a caracterizou e que ainda hoje se preserva como em muitos poucos locais no mundo. Neste que é o ponto do Alentejo mais próximo do céu, o silêncio permite-nos ouvir as histórias de uma terra de reis e cavaleiros audazes e de uma simplicidade arquitetónica que perdura no tempo. \n\nOs primórdios da ocupação territorial da vila de Monsaraz remontam aos tempos da pré-história, estando os mesmos representados por centenas de registos arqueológicos datados dos períodos paleolítico, neolítico e até mesmo da Idade do Bronze e da Idade do Ferro. Entende-se, por isso, que seja uma das localidades mais antigas de Portugal. A vila foi inicialmente conquistada aos Mouros, em 1167, por Geraldo Sem-Pavor, tendo sido mais tarde entregue aos templários por D. Sancho II para sua defesa e povoamento. Durante séculos, a fortificação de Monsaraz foi deveras importante e desempenhou um papel de posto de vigia do Guadiana, de onde era possível avistar a fronteira com Castela. Foi ainda sede do concelho até 1838, altura em que esta função passou para a Aldeia de Reguengos – atualmente reconhecida por Reguengos de Monsaraz. \n\nEm termos históricos, sabe-se que a vila cairia sob domínio do Islão aquando das invasões muçulmanas que viriam a ocupar grande parte da Península Ibérica. Só mais tarde, já em 1232, é que D. Sancho II, com o auxílio dos cavaleiros templários, consegue aliar definitivamente a vila sob o domínio cristão, fazendo a sua doação à Ordem do Tempo, que estaria encarregue da sua defesa e repovoamento. Ainda assim, este processo de repovoamento só ocorre no reinado de D. Afonso III, altura em que é estipulado o concelho de Monsaraz, dando início ao período cristão. Mas, em 1422, o condestável D. Nuno Álvares Pereira doa o território ao seu neto, D. Fernando, sendo o concelho incorporado na Casa de Bragança, tornando-se num dos mais valiosos vínculos desta casa ducal portuguesa. Anos mais tarde, por volta de 1512, D. Manuel concede um novo foral à vila de Monsaraz, passando a regular a vida pública e jurídica do concelho. \n\nAquando da proclamação da independência face à Coroa Espanhola, em 1640, a dinastia de Bragança passa a executar uma vasta e importante campanha de construção de fortificações modernas na linha fronteiriça portuguesa, incluindo a vila de Monsaraz. A edificação do estilo Vauban avança em redor do castelo, contornando toda a vila com muralhas adaptadas aos tiros de artilharia. \n\nA condição de vila medieval acastelada e o desenvolvimento de atividades artesanais e vinícolas, assim como o forte crescimento das aldeias de Reguengos, que se encontravam situadas numa planície de fácil acesso, são fatores decisivos para a passagem oficial e definitiva da sede de concelho para a Aldeia de Reguengos, entre 1838 e 1851. \n\nUma curiosidade acerca da vila de Monsaraz está relacionada com a origem toponímica do nome. Especula-se que a palavra “Saraz” possa derivar de Xarez ou Xerez que equivaleria, durante o domínio muçulmano, à arábica Saris ou Sharish. Neste sentido, Monsaraz poderá significar Monte Xarez ou Monte Xaraz, isto é, um monte erguido no coração de uma terra nas margens do Guadiana, que seria povoada por um “brenhal” de estevas (ou xaras) e que, pela excelência de condições estratégicas – posição de altura com cobertura defensiva de um grande e importante rio - recomendava, naquele sítio de difícil acesso, a fundação de um povoado, quase naturalmente defendido. ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Metropolis',
                          ),
                          trimLines: 10,
                          colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...Mostrar mais',
                          trimExpandedText: ' Mostrar menos',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 10),
                      ),
                      ExpansionTile(
                        title: Text("Onde Dormir",style: TextStyle(color: Colors.black),),
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa da Anica",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa da Avó",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa da Muralha Suite",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa D'as Papoilas",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa das Videiras",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Daterra",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa do Varandin",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Letizia & Casa Sebastião",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Pinto",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Santiago",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Charme de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Charme de Monsaraz II",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Horta do Lago Renting",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monsaraz Starry Night",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monte das Matas",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monte dos Cismeiros",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Recanto de S.Bento",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Refúgio da Vila",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Dona Antónia",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Rural Santo Condestável",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Saramago de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Dom Nuno",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Estalagem de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Horta da Coutada",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monte Alerta",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monte de Santa Catarina",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Skyscape Countryhouse",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "São Lourenço do Barrocal",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Vila Planície",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
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
                      ExpansionTile(
                        title: Text("Onde Comer", style: TextStyle(color: Colors.black),),
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa da Muralha",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa do Forno",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Modesta",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Centro Náutico de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Lumunba",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "O alcaide",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "O Bizaca",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "O convívio",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "O Gaspacho",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Sabores de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Sem-Fim (DarkSky)",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Taverna Os Templários",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Xarez (DarkSky)",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 10),
                  ),
                ])),
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
                        Container(
                          margin: EdgeInsets.all(6.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              child: Hero(
                                tag: 'hero',
                                child: Image.network(
                                  list[31],
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
                                              list[31],
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
                                  list[32],
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
                                              list[32],
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
                                  list[33],
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
                                              list[33],
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
                                  list[34],
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
                                              list[34],
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
                                  list[35],
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
                                              list[35],
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
                                  list[36],
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
                                              list[36],
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
                                  list[37],
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
                                              list[37],
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
                                  list[38],
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
                                              list[38],
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
                                  list[39],
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
                                              list[39],
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
                                  list[40],
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
                                              list[40],
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
                                  list[41],
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
                                              list[41],
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
                      "Monsaraz",
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
                          "Protegida pelas suas muralhas, a vila histórica de Monsaraz é uma pequena povoação com ruas de xisto e paredes caiadas de branco que contrastam com o perfeito azul do Alqueva. As ruas estreitas percorrem locais encantadores com uma paisagem alentejana deslumbrante sobre o Grande Lago a servir de cenário. \n\nDesafiando o tempo e num harmonioso rasgo com a tranquilidade da paisagem envolvente, esta histórica vila espelha a beleza que sempre a caracterizou e que ainda hoje se preserva como em muitos poucos locais no mundo. Neste que é o ponto do Alentejo mais próximo do céu, o silêncio permite-nos ouvir as histórias de uma terra de reis e cavaleiros audazes e de uma simplicidade arquitetónica que perdura no tempo. \n\nOs primórdios da ocupação territorial da vila de Monsaraz remontam aos tempos da pré-história, estando os mesmos representados por centenas de registos arqueológicos datados dos períodos paleolítico, neolítico e até mesmo da Idade do Bronze e da Idade do Ferro. Entende-se, por isso, que seja uma das localidades mais antigas de Portugal. A vila foi inicialmente conquistada aos Mouros, em 1167, por Geraldo Sem-Pavor, tendo sido mais tarde entregue aos templários por D. Sancho II para sua defesa e povoamento. Durante séculos, a fortificação de Monsaraz foi deveras importante e desempenhou um papel de posto de vigia do Guadiana, de onde era possível avistar a fronteira com Castela. Foi ainda sede do concelho até 1838, altura em que esta função passou para a Aldeia de Reguengos – atualmente reconhecida por Reguengos de Monsaraz. \n\nEm termos históricos, sabe-se que a vila cairia sob domínio do Islão aquando das invasões muçulmanas que viriam a ocupar grande parte da Península Ibérica. Só mais tarde, já em 1232, é que D. Sancho II, com o auxílio dos cavaleiros templários, consegue aliar definitivamente a vila sob o domínio cristão, fazendo a sua doação à Ordem do Tempo, que estaria encarregue da sua defesa e repovoamento. Ainda assim, este processo de repovoamento só ocorre no reinado de D. Afonso III, altura em que é estipulado o concelho de Monsaraz, dando início ao período cristão. Mas, em 1422, o condestável D. Nuno Álvares Pereira doa o território ao seu neto, D. Fernando, sendo o concelho incorporado na Casa de Bragança, tornando-se num dos mais valiosos vínculos desta casa ducal portuguesa. Anos mais tarde, por volta de 1512, D. Manuel concede um novo foral à vila de Monsaraz, passando a regular a vida pública e jurídica do concelho. \n\nAquando da proclamação da independência face à Coroa Espanhola, em 1640, a dinastia de Bragança passa a executar uma vasta e importante campanha de construção de fortificações modernas na linha fronteiriça portuguesa, incluindo a vila de Monsaraz. A edificação do estilo Vauban avança em redor do castelo, contornando toda a vila com muralhas adaptadas aos tiros de artilharia. \n\nA condição de vila medieval acastelada e o desenvolvimento de atividades artesanais e vinícolas, assim como o forte crescimento das aldeias de Reguengos, que se encontravam situadas numa planície de fácil acesso, são fatores decisivos para a passagem oficial e definitiva da sede de concelho para a Aldeia de Reguengos, entre 1838 e 1851. \n\nUma curiosidade acerca da vila de Monsaraz está relacionada com a origem toponímica do nome. Especula-se que a palavra “Saraz” possa derivar de Xarez ou Xerez que equivaleria, durante o domínio muçulmano, à arábica Saris ou Sharish. Neste sentido, Monsaraz poderá significar Monte Xarez ou Monte Xaraz, isto é, um monte erguido no coração de uma terra nas margens do Guadiana, que seria povoada por um “brenhal” de estevas (ou xaras) e que, pela excelência de condições estratégicas – posição de altura com cobertura defensiva de um grande e importante rio - recomendava, naquele sítio de difícil acesso, a fundação de um povoado, quase naturalmente defendido. ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Metropolis',
                          ),
                          trimLines: 10,
                          colorClickableText: Color.fromRGBO(84, 156, 193, 1.0),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...Mostrar mais',
                          trimExpandedText: ' Mostrar menos',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 10),
                      ),
                      ExpansionTile(
                        title: Text("Onde Dormir",style: TextStyle(color: Colors.black),),
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa da Anica",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa da Avó",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa da Muralha Suite",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa D'as Papoilas",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa das Videiras",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Daterra",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa do Varandin",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Letizia & Casa Sebastião",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Pinto",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Santiago",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Charme de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Charme de Monsaraz II",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Horta do Lago Renting",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monsaraz Starry Night",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monte das Matas",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monte dos Cismeiros",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Recanto de S.Bento",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Refúgio da Vila",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Dona Antónia",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Rural Santo Condestável",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Saramago de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Dom Nuno",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Estalagem de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Horta da Coutada",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monte Alerta",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Monte de Santa Catarina",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Skyscape Countryhouse",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "São Lourenço do Barrocal",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Vila Planície",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
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
                      ExpansionTile(
                        title: Text("Onde Comer", style: TextStyle(color: Colors.black),),
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa da Muralha",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa do Forno",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Casa Modesta",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Centro Náutico de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Lumunba",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "O alcaide",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "O Bizaca",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "O convívio",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "O Gaspacho",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Sabores de Monsaraz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Sem-Fim (DarkSky)",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Taverna Os Templários",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      "Xarez (DarkSky)",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromRGBO(
                                              129, 195, 215, 1),
                                          fontWeight: FontWeight.w600),
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 10),
                  ),
                ])),
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
              "https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Monsaraz.mp3"),
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
                          builder: (context) => Monsaraz()),
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
                          builder: (context) => MonsarazES()),
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
