import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/Animation/FadeAnimation.dart';

class SlideTile extends StatelessWidget {
  final String image;
  final bool activePage;
  final int id;
  final String nombre;

  const SlideTile({Key key, this.image, this.activePage, this.id, this.nombre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = this.activePage ? 50 : 150;
    final double blur = this.activePage ? 20 : 0;
    final double offset = this.activePage ? 5 : 0;

    return InkWell(
      onTap: () {
        if (id == 0) {
          Get.toNamed('/registro/cliente');
        }
        if (id == 1) {
          Get.toNamed('/registro/funcionario');
        }
        if (id == 2) {
          Get.toNamed('/registro/lote');
        }
      },
      child: FadeAnimation(
        0.2,
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeOutQuint,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              nombre,
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(offset, offset),
                  ),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.only(
            top: top,
            bottom: 100,
            right: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(this.image),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(28, 90, 92, 1),
                blurRadius: blur,
                offset: Offset(offset, offset),
              )
            ],
          ),
        ),
      ),
    );
  }
}
