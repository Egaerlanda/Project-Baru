import 'package:apkega/providers/dashboard_provider.dart';
import 'package:apkega/views/dashboard/berita_panel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final panels = [
      DashboardPanel(),
      BeritaPanel(),
      SizedBox()
    ];
    return Consumer<DashboardProvider>(
      builder: (context, Provider, Widget) {
        return Scaffold(
          bottomNavigationBar: NavigatorBawah(),
          body: panels[Provider.indexTombol]
        );
      }
    ); 
  }
  }


class DashboardPanel extends StatelessWidget {
  const DashboardPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/Background3.jpg',
        width: double.infinity,
        fit: BoxFit.cover,
        height: 300,),
        InformasiPengguna(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              margin: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    
                    LabelBerita(),
                    ListBerita(),

                    SizedBox(height: 70,),

                    GridMenu()
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class GridMenu extends StatelessWidget {
  const GridMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
       TombolMenu(namaassets: 'assets/Icon1.png',),
       TombolMenu(namaassets: 'assets/Icon2.png',),
       TombolMenu(namaassets: 'assets/Icon3.png',),
      ],
    );
  }
}

class TombolMenu extends StatelessWidget {
  final String? namaassets;
  const TombolMenu({
    super.key,
   required this.namaassets
  });

  @override
  Widget build(BuildContext context) {
    return Card(
     elevation: 10,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(30)
     ),
     child: Padding(
       padding: EdgeInsets.all(20),
       child: Image.asset(namaassets!,
       width: 60,
       ),
     ),
    );
  }
}

class ListBerita extends StatelessWidget {
  const ListBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset('assets/Berita1.jpg', height: 120,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset('assets/Berita2.jpg', height: 120,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset('assets/Berita3.jpg', height: 120,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset('assets/Berita4.jpg', height: 120,),
            ),
             Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset('assets/No Image.jpg', height: 120,),
            ),
          ],
        ),
      ),
    );
  }
}

class LabelBerita extends StatelessWidget {
  const LabelBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft ,
        child: Text('Berita',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),)),
        );
  }
}

class NavigatorBawah extends StatelessWidget {
  const NavigatorBawah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final p = context.read<DashboardProvider>();

    return BottomNavigationBar(
      currentIndex: p.indexTombol,
      onTap: (value) {
        p.saatdiklik(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.house),
          label: 'Home'
        ),
         BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.newspaper),
          label: 'Berita'
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.gear),
          label: 'Pengaturan'
        ),
      ]);
  }
}

class InformasiPengguna extends StatelessWidget {
  const InformasiPengguna({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/ega.jpg',
           width: 60,),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi, Ega Erlanda',
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
                ),
              ),
              Text('egaerlando1222@gmail.com',
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
                ),
              ),
            ],
          ),
        ),
          Image.asset('assets/Bell.png', width: 40,)
        ],
      ),
    );
  }
}