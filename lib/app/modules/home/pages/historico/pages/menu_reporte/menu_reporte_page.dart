import 'package:flutter/material.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/widget/menu_reporte_slide_tile.dart';

class MenuReportePage extends StatefulWidget {
  const MenuReportePage({Key key}) : super(key: key);

  @override
  _MenuReportePageState createState() => _MenuReportePageState();
}

class _MenuReportePageState extends State<MenuReportePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  var _listSlide = [
    {'id': 0, 'image': 'assets/registros/cliente.png', 'nombre': 'Clientes'},
    {
      'id': 1,
      'image': 'assets/registros/funcionario.jpg',
      'nombre': 'Funcionarios'
    },
    {'id': 2, 'image': 'assets/registros/lote.jpg', 'nombre': 'Lotes'},
    {'id': 3, 'image': 'assets/registros/ventas.jpg', 'nombre': 'Ventas'},
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
                    return MenuReporteSlideTile(
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
