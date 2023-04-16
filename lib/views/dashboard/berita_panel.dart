import 'package:apkega/providers/berita_panel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeritaPanel extends StatelessWidget {
  const BeritaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BeritaPanelProvider>().muatdata();

    return Scaffold(
      appBar: AppBar(
        title: Text('Berita'),
      ),
      body: Consumer<BeritaPanelProvider>(
        builder: (context, Provider, Widget) {
          return ListView(
            children: [
              for(final data in Provider.data)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${data['title']}'),
                  Image.network(
                    data['image'] ?? '',
                    errorBuilder: (context, Error, StackTrace){
                      return Image.asset('assets/Logo.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 300,);
                    }
                  ),
                  Text('${data['description']}')
                ],
              )
            ],
          );
        }
      )
    );
  }
}