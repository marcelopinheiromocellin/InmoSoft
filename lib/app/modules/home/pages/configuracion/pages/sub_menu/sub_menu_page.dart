import 'package:flutter/material.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/widget/slide_lite_configuracion.dart';

class SubMenuPage extends StatefulWidget {
  SubMenuPage({Key key}) : super(key: key);

  @override
  _SubMenuPageState createState() => _SubMenuPageState();
}

class _SubMenuPageState extends State<SubMenuPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  var _listSlide = [
    {'id': 0, 'image': 'assets/registros/empresa.jpg', 'nombre': 'Empresa'},
    {
      'id': 1,
      'image': 'assets/registros/limpar.png',
      'nombre': 'Limpiar datos'
    },
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _listSlide.length,
                  itemBuilder: (_, currentIndex) {
                    bool activePage = currentIndex == _currentPage;
                    return SlideTileConfiguracion(
                      activePage: activePage,
                      id: _listSlide[currentIndex]['id'],
                      nombre: _listSlide[currentIndex]['nombre'],
                      image: _listSlide[currentIndex]['image'],
                    );
                  },
                ),
              ),
              _buildBullets()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((i) {
          return InkWell(
            onTap: () {
              setState(() {
                _pageController.jumpToPage(i['id']);
                _currentPage = i['id'];
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: _currentPage == i['id']
                    ? Color.fromRGBO(28, 90, 92, 1)
                    : Colors.grey[600],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
