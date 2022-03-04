import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';
import 'juromenha_es.dart';
import 'main.dart';
import 'maps.dart';

void main() => runApp(Juromenha());

class Juromenha extends StatefulWidget {
  Juromenha({Key? key}) : super(key: key);

  @override
  _JuromenhaState createState() => _JuromenhaState();
}

class _JuromenhaState extends State<Juromenha> {
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
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S1-+Juromenha+placa+entrada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S10+-+Fortaleza+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S11+-+Fortaleza+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S12+-+Fortaleza+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S13+-+Fortaleza+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S14b+-+Fortaleza+Juromenha-Editar.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S15+-+Vista+Fortaleza+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S16+-+Posto+correios+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S17+-+casas+Juromenha-Editar.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S18-acessos+miradouro+s+lazaro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S19-acessos+miradouro+s+lazaro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S2-+Juromenha+placa+entrada.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S20-acessos+miradouro+s+lazaro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S20a-acessos+miradouro+s+lazaro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S20b-acessos+miradouro+s+lazaro-Editar.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S22-miradouro+s+lazaro.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S23+Bancos+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S24+-+casas+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S25+Fonte+entrada+juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S26+Vista+da+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S27-+Ancoradouro+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S28-+Ancoradouro+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S29-+Ancoradouro+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S3+-+Juromenha+Ermida+de+Santo+Ant%C3%B3nio-Editar.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S30-+Ancoradouro+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S31-+N%C3%B3madas+junto+ao+Ancoradouro+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S4+-+Juromenha+Ermida+de+Santo+Ant%C3%B3nio.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S5+-+Largo+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S6+-+Entrada+Fortaleza+juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S7+-+Fortaleza+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S7+percursos+pedestres+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S8+-+Fortaleza+Juromenha.jpg',
    'https://audioguia.s3.eu-west-3.amazonaws.com/FOTOS/Juromenha/S9+-+Fortaleza+Juromenha-Editar.jpg',
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
              delegate: SliverChildListDelegate(
                [
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
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                  Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                                  .withOpacity(
                                  _current == entry.key ? 0.4 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(top: 15, bottom: 10, left: 45),
                    child: Text(
                      "Juromenha",
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
                                        style:
                                        TextStyle(fontFamily: 'Metropolis'),
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
                                        style:
                                        TextStyle(fontFamily: 'Metropolis'),
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
                                        style:
                                        TextStyle(fontFamily: 'Metropolis'),
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
                                        style:
                                        TextStyle(fontFamily: 'Metropolis'),
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
                          "Juromenha é uma pequena vila do concelho de Alandroal que, se por um lado representa o número mais reduzido de habitantes, por outro revela-se uma terra riquíssima, quer pelo seu posicionamento como pela singularidade geográfica e cultural. Esta vila ribeirinha do Alqueva está situada na extremidade nordeste do concelho e tem como terras vizinhas a Aldeia da Mina do Bugalho, Vila Viçosa, Elvas e ainda Olivença. \n\nNo ano de 1801, contabilizavam-se cerca de 820 habitantes, embora atualmente o número em pouco ultrapasse os 100. Mas recuando no tempo, as primeiras referências a Juromenha surgem em textos árabes já nos finais do século VII e mais tarde, já no século IX, quando os muladis (os novos muçulmanos de origem ibérica) começam a revoltar-se por estarem insatisfeitos com a sua posição na estrutura social islâmica, formando movimentos de autonomia. Quando se dá por terminado o Califado de Córdova (929 – 1031), a região passa a ser regida por dois movimentos reformistas berberes: Almorávidas e Almóadas. Em 1167, D. Afonso Henriques conquista a vila de Juromenha aos mouros, tendo mais tarde a região entrado para a Ordem de Avis. Acredita-se ainda que Juromenha tenha sido uma azóia ocupada por muçulmanos voluntários que dividiam o tempo entre atividades bélicas e espirituais. \n\nDurante a Guerra da Restauração (1640-1668) foi construída uma fortaleza abaluartada – um estilo de fortificação muito desenvolvido do século XV – adaptada à nova artilharia, com uma planta poligonal composta por duas cinturas de muralha. No entanto, ainda decorriam as obras, quando em 1659 se dá uma forte explosão que acabou por abalar uma boa parte da estrutura. Atualmente, é possível conhecer no seu interior as igrejas da Misericórdia e de São Francisco, assim como a Igreja Matriz de Nossa Senhora do Loreto, os antigos Paços do Concelho, a cadeia e a cisterna – embora tudo em ruínas. Este que foi outrora um ponto importante de defesa e vigia sobre as margens do rio Guadiana, em tempos de conflitos internacionais, tem estado ao abandono, mas há, no entanto, um plano de recuperação que visa a promoção da Fortaleza de Juromenha enquanto ponto de referência histórica, turística e patrimonial. \n\nConhecida como a “sentinela do Guadiana”, dada a sua localização num cerro que se eleva sobre as margens do rio, Juromenha caracteriza-se por uma estrutura medieval que mostra reaproveitamento de alguns materiais de construção romanos e visigóticos, pelo que não se consegue comprovar que tenha tido de facto ocupação durante essa época. Além da Fortaleza de Juromenha, são vários os pontos de interesse a conhecer numa visita à vila. É o caso do ancoradouro, do Centro Náutico, do Miradouro de S. Lázaro e da Ermida de Santo António, a par de uma série de atividades desportivas e lúdicas que permitem conhecer a fundo a riqueza da região. \n\nA importância da vila e o sentimento identitário que as pessoas têm em relação à mesma continua presente nos dias de hoje, em exemplos como a poesia popular. \n\nSe a intenção passa por prolongar a estadia na vila de Juromenha, não faltam locais para descansar e saborear a tranquilidade do Alentejo. A Casa Central, as Casas de Juromenha, as Casas de S. Lázaro, a Ribeira de Mures ou a Casa do Arco são alguns desses exemplos. As iguarias da região podem também ser desfrutadas nos diversos restaurantes locais, destacando o Sentinela do Guadiana, o Pata Larga e a Tasca D’Juromenha.  A importância da vila e o sentimento identitário que as pessoas têm em relação à mesma continua presente nos dias de hoje, em exemplos como a poesia popular. \n\nA Vila de Juromenha integra a Reserva DarkSky Alqueva. ",
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
                                    "Se a intenção passa por prolongar a estadia na vila de Juromenha, não faltam locais para descansar e saborear a tranquilidade do Alentejo. A Casa Central, as Casas de Juromenha, as Casas de S. Lázaro, a Ribeira de Mures ou a Casa do Arco são alguns desses exemplos. As iguarias da região podem também ser desfrutadas nos diversos restaurantes locais, destacando o Sentinela do Guadiana, o Pata Larga e a Tasca D’Juromenha.  A importância da vila e o sentimento identitário que as pessoas têm em relação à mesma continua presente nos dias de hoje, em exemplos como a poesia popular. \n\nA Vila de Juromenha integra a Reserva DarkSky Alqueva. ",
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
                ],
              ),
            ),
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
              delegate: SliverChildListDelegate(
                [
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
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                  Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                                  .withOpacity(
                                  _current == entry.key ? 0.4 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(top: 15, bottom: 10, left: 45),
                    child: Text(
                      "Juromenha",
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
                                        style:
                                        TextStyle(fontFamily: 'Metropolis'),
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
                                        style:
                                        TextStyle(fontFamily: 'Metropolis'),
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
                                        style:
                                        TextStyle(fontFamily: 'Metropolis'),
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
                                        style:
                                        TextStyle(fontFamily: 'Metropolis'),
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
                          "Juromenha é uma pequena vila do concelho de Alandroal que, se por um lado representa o número mais reduzido de habitantes, por outro revela-se uma terra riquíssima, quer pelo seu posicionamento como pela singularidade geográfica e cultural. Esta vila ribeirinha do Alqueva está situada na extremidade nordeste do concelho e tem como terras vizinhas a Aldeia da Mina do Bugalho, Vila Viçosa, Elvas e ainda Olivença. \n\nNo ano de 1801, contabilizavam-se cerca de 820 habitantes, embora atualmente o número em pouco ultrapasse os 100. Mas recuando no tempo, as primeiras referências a Juromenha surgem em textos árabes já nos finais do século VII e mais tarde, já no século IX, quando os muladis (os novos muçulmanos de origem ibérica) começam a revoltar-se por estarem insatisfeitos com a sua posição na estrutura social islâmica, formando movimentos de autonomia. Quando se dá por terminado o Califado de Córdova (929 – 1031), a região passa a ser regida por dois movimentos reformistas berberes: Almorávidas e Almóadas. Em 1167, D. Afonso Henriques conquista a vila de Juromenha aos mouros, tendo mais tarde a região entrado para a Ordem de Avis. Acredita-se ainda que Juromenha tenha sido uma azóia ocupada por muçulmanos voluntários que dividiam o tempo entre atividades bélicas e espirituais. \n\nDurante a Guerra da Restauração (1640-1668) foi construída uma fortaleza abaluartada – um estilo de fortificação muito desenvolvido do século XV – adaptada à nova artilharia, com uma planta poligonal composta por duas cinturas de muralha. No entanto, ainda decorriam as obras, quando em 1659 se dá uma forte explosão que acabou por abalar uma boa parte da estrutura. Atualmente, é possível conhecer no seu interior as igrejas da Misericórdia e de São Francisco, assim como a Igreja Matriz de Nossa Senhora do Loreto, os antigos Paços do Concelho, a cadeia e a cisterna – embora tudo em ruínas. Este que foi outrora um ponto importante de defesa e vigia sobre as margens do rio Guadiana, em tempos de conflitos internacionais, tem estado ao abandono, mas há, no entanto, um plano de recuperação que visa a promoção da Fortaleza de Juromenha enquanto ponto de referência histórica, turística e patrimonial. \n\nConhecida como a “sentinela do Guadiana”, dada a sua localização num cerro que se eleva sobre as margens do rio, Juromenha caracteriza-se por uma estrutura medieval que mostra reaproveitamento de alguns materiais de construção romanos e visigóticos, pelo que não se consegue comprovar que tenha tido de facto ocupação durante essa época. Além da Fortaleza de Juromenha, são vários os pontos de interesse a conhecer numa visita à vila. É o caso do ancoradouro, do Centro Náutico, do Miradouro de S. Lázaro e da Ermida de Santo António, a par de uma série de atividades desportivas e lúdicas que permitem conhecer a fundo a riqueza da região. \n\nA importância da vila e o sentimento identitário que as pessoas têm em relação à mesma continua presente nos dias de hoje, em exemplos como a poesia popular. \n\nSe a intenção passa por prolongar a estadia na vila de Juromenha, não faltam locais para descansar e saborear a tranquilidade do Alentejo. A Casa Central, as Casas de Juromenha, as Casas de S. Lázaro, a Ribeira de Mures ou a Casa do Arco são alguns desses exemplos. As iguarias da região podem também ser desfrutadas nos diversos restaurantes locais, destacando o Sentinela do Guadiana, o Pata Larga e a Tasca D’Juromenha.  A importância da vila e o sentimento identitário que as pessoas têm em relação à mesma continua presente nos dias de hoje, em exemplos como a poesia popular. \n\nA Vila de Juromenha integra a Reserva DarkSky Alqueva. ",
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
                                    "Se a intenção passa por prolongar a estadia na vila de Juromenha, não faltam locais para descansar e saborear a tranquilidade do Alentejo. A Casa Central, as Casas de Juromenha, as Casas de S. Lázaro, a Ribeira de Mures ou a Casa do Arco são alguns desses exemplos. As iguarias da região podem também ser desfrutadas nos diversos restaurantes locais, destacando o Sentinela do Guadiana, o Pata Larga e a Tasca D’Juromenha.  A importância da vila e o sentimento identitário que as pessoas têm em relação à mesma continua presente nos dias de hoje, em exemplos como a poesia popular. \n\nA Vila de Juromenha integra a Reserva DarkSky Alqueva. ",
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
                ],
              ),
            ),
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
          Uri.parse("https://audioguia.s3.eu-west-3.amazonaws.com/Audios/Juromenha.mp3"),
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
                          builder: (context) => JuromenhaES()),
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
                          builder: (context) => JuromenhaES()),
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
