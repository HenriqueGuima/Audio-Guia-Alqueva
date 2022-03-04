import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'main.dart';
import 'main_es.dart';
import 'mapsES.dart';
import 'monsaraz.dart';

void main() => runApp(MonsarazES());

class MonsarazES extends StatefulWidget {
  MonsarazES({Key? key}) : super(key: key);

  @override
  _MonsarazESState createState() => _MonsarazESState();
}

class _MonsarazESState extends State<MonsarazES> {
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
                          "Protegida pelas suas muralhas, a vila histórica de Monsaraz é uma pequena povoação com ruas de xisto e paredes caiadas de branco que contrastam com o perfeito azul do Alqueva. As ruas estreitas percorrem locais encantadores com uma paisagem alentejana deslumbrante sobre o Grande Lago a servir de cenário. \n\nEsta villa histórica refleja la belleza que siempre la caracterizó, desafiando al tiempo y en armonía con el paisaje de alrededor, puede presumir de conservarse como pocos lugares en el mundo. En este punto del Alentejo más cercano al cielo, el silencio permite escuchar las historias de una tierra de reyes y caballeros valientes, junto con una sencillez arquitectónica que perdura en el tiempo. \n\nLos inicios de la ocupación territorial de Monsaraz se retoman a tiempos de la prehistoria, estando documentados por centenas de registros arqueológicos de los periodos del pelotítico, neolítico e incluso la Edad de Bronce y la Edad de Hierro. Por estos datos podría ser una de las localidades más antiguas de Portugal. La villa fue inicialmente conquistada por los Moros, en 1167, por el conocido por Geraldo Sem-Pavor, siendo posteriormente entregada a los templarios por D. Sancho II, para su defensa y asentamiento. Durante siglos, la fortificación de Monsaraz fue de vital importancia, cumpliendo la función de puesto de vigilancia del Guadiana, desde donde se veía la frontera con el Reino de Castilla. También fue centro municipal hasta 1838, momento en el que esta función fue dada a la Aldeia dos Reguengos, la actualmente conocida por Reguengos de Monsaraz. \n\nReferentemente a los hechos históricos, se sabe que la localidad cayó sobre el dominio del Islam, en el momento que se produjeron las invasiones musulmanas en la Península Ibérica. Posteriormente, en 1232, D. Sancho II, con la ayuda de los templarios, logra colocar definitivamente la aldea bajo el dominio cristiano, cediendo el territorio a la Orden del Tiempo, que se encargaría de su defensa y repoblación. Aunque este proceso de repoblación solo tiene lugar con el reinado de D. Afonso III, cuando es constituido el municipio de Monsaraz, dando inicio a la época cristiana. Pero, en 1422, el conde D. Nuno Álvares Pereira dona estas tierras a su nieto, D. Fernando, incorporando este territorio a la Casa de Bragança, convirtiéndose en uno de los eslabones más valiosos de esta casa ducal portuguesa. Años más tarde, sobre el 1512, D. Manuel otorgó un nuevo foral a la villa de Monsaraz, comenzando a regular la vida pública y jurídica del municipio. \n\nDespués de la proclamación de independencia de la Corona Española, en 1640, la dinastía Bragança empezó a realizar una amplia e importante campaña para construir fortificaciones más modernas a lo largo de la frontera portuguesa, incluyendo la ciudad de Monsaraz. El edificio de estilo Vauban avanza alrededor del castillo, rodeando toda la ciudad con murallas adaptadas para el fuego de artillería. \n\nLa condición de villa medieval almenada y el desarrollo de las actividades artesanales y bodegueras, así como el fuerte crecimiento de las aldeas de Reguengos, que estaban ubicadas en una llanura de fácil acceso, son factores decisivos para el paso oficial y definitivo de la sede comarcal a la Villa de Reguengos, entre 1838 y 1851. \n\nEn este pequeño territorio, hay una serie de atractivos turísticos por descubrir. La visita puede tener como punto de partida el Castillo de Monsaraz, desde donde es posible contemplar un magnífico paisaje sobre todo el pueblo. Además de las diversas líneas de defensa que se pueden visitar, también se puede ver la Igreja Matriz de Nossa Senhora da Lagoa, la Igreja da Misericórdia, el Museu do Fresco, el Cromeleque do Xerez, el Menir do Outeiro o el da Bulhoa, entre otros lugares de interés. También la Playa Fluvial de Monsaraz, el Centro Náutico y el Muelle son posibles opciones para disfrutar de la tranquilidad de la región. \n\nUna curiosidad sobre el pueblo de Monsaraz está relacionada con el origen toponímico del nombre. Se especula que la palabra “Saraz” puede derivar de Xarez o Xerez, que sería equivalente, durante el dominio musulmán, al árabe Saris o Sharish. En este sentido, Monsaraz puede significar Monte Xarez o Monte Xaraz, es decir, un cerro ergido en el corazón de un terreno a orillas del Guadiana, que estaría cubierto por una gran maleza de jaras y que, por las excelentes condiciones estratégicas -una posición alta con la cobertura defensiva de un importane y grande río – favoreció a que en ese lugar de difícil acceso, fuese posible la fundación de una aldea, creada casi de forma natural como defensiva. ",
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
                      Padding(
                        padding: EdgeInsets.only(top: 20),
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
                          "Protegida pelas suas muralhas, a vila histórica de Monsaraz é uma pequena povoação com ruas de xisto e paredes caiadas de branco que contrastam com o perfeito azul do Alqueva. As ruas estreitas percorrem locais encantadores com uma paisagem alentejana deslumbrante sobre o Grande Lago a servir de cenário. \n\nEsta villa histórica refleja la belleza que siempre la caracterizó, desafiando al tiempo y en armonía con el paisaje de alrededor, puede presumir de conservarse como pocos lugares en el mundo. En este punto del Alentejo más cercano al cielo, el silencio permite escuchar las historias de una tierra de reyes y caballeros valientes, junto con una sencillez arquitectónica que perdura en el tiempo. \n\nLos inicios de la ocupación territorial de Monsaraz se retoman a tiempos de la prehistoria, estando documentados por centenas de registros arqueológicos de los periodos del pelotítico, neolítico e incluso la Edad de Bronce y la Edad de Hierro. Por estos datos podría ser una de las localidades más antiguas de Portugal. La villa fue inicialmente conquistada por los Moros, en 1167, por el conocido por Geraldo Sem-Pavor, siendo posteriormente entregada a los templarios por D. Sancho II, para su defensa y asentamiento. Durante siglos, la fortificación de Monsaraz fue de vital importancia, cumpliendo la función de puesto de vigilancia del Guadiana, desde donde se veía la frontera con el Reino de Castilla. También fue centro municipal hasta 1838, momento en el que esta función fue dada a la Aldeia dos Reguengos, la actualmente conocida por Reguengos de Monsaraz. \n\nReferentemente a los hechos históricos, se sabe que la localidad cayó sobre el dominio del Islam, en el momento que se produjeron las invasiones musulmanas en la Península Ibérica. Posteriormente, en 1232, D. Sancho II, con la ayuda de los templarios, logra colocar definitivamente la aldea bajo el dominio cristiano, cediendo el territorio a la Orden del Tiempo, que se encargaría de su defensa y repoblación. Aunque este proceso de repoblación solo tiene lugar con el reinado de D. Afonso III, cuando es constituido el municipio de Monsaraz, dando inicio a la época cristiana. Pero, en 1422, el conde D. Nuno Álvares Pereira dona estas tierras a su nieto, D. Fernando, incorporando este territorio a la Casa de Bragança, convirtiéndose en uno de los eslabones más valiosos de esta casa ducal portuguesa. Años más tarde, sobre el 1512, D. Manuel otorgó un nuevo foral a la villa de Monsaraz, comenzando a regular la vida pública y jurídica del municipio. \n\nDespués de la proclamación de independencia de la Corona Española, en 1640, la dinastía Bragança empezó a realizar una amplia e importante campaña para construir fortificaciones más modernas a lo largo de la frontera portuguesa, incluyendo la ciudad de Monsaraz. El edificio de estilo Vauban avanza alrededor del castillo, rodeando toda la ciudad con murallas adaptadas para el fuego de artillería. \n\nLa condición de villa medieval almenada y el desarrollo de las actividades artesanales y bodegueras, así como el fuerte crecimiento de las aldeas de Reguengos, que estaban ubicadas en una llanura de fácil acceso, son factores decisivos para el paso oficial y definitivo de la sede comarcal a la Villa de Reguengos, entre 1838 y 1851. \n\nEn este pequeño territorio, hay una serie de atractivos turísticos por descubrir. La visita puede tener como punto de partida el Castillo de Monsaraz, desde donde es posible contemplar un magnífico paisaje sobre todo el pueblo. Además de las diversas líneas de defensa que se pueden visitar, también se puede ver la Igreja Matriz de Nossa Senhora da Lagoa, la Igreja da Misericórdia, el Museu do Fresco, el Cromeleque do Xerez, el Menir do Outeiro o el da Bulhoa, entre otros lugares de interés. También la Playa Fluvial de Monsaraz, el Centro Náutico y el Muelle son posibles opciones para disfrutar de la tranquilidad de la región. \n\nUna curiosidad sobre el pueblo de Monsaraz está relacionada con el origen toponímico del nombre. Se especula que la palabra “Saraz” puede derivar de Xarez o Xerez, que sería equivalente, durante el dominio musulmán, al árabe Saris o Sharish. En este sentido, Monsaraz puede significar Monte Xarez o Monte Xaraz, es decir, un cerro ergido en el corazón de un terreno a orillas del Guadiana, que estaría cubierto por una gran maleza de jaras y que, por las excelentes condiciones estratégicas -una posición alta con la cobertura defensiva de un importane y grande río – favoreció a que en ese lugar de difícil acceso, fuese posible la fundación de una aldea, creada casi de forma natural como defensiva. ",
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
                      Padding(
                        padding: EdgeInsets.only(top: 20),
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
          Uri.parse("https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Monsaraz_es.mp3"),
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
                          builder: (context) => Monsaraz()),
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
                          builder: (context) => Monsaraz()),
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
