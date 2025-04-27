import 'package:flutter/material.dart';
import 'package:wheather_app/views/search_view.dart';

import '../widgets/no_weather_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SearchView();
                },
              ));
            },
          ),
        ],
      ),
      body: NoWeatherBody(),
    );
  }
}
// state management
// 1- setState --> w d low level state management nst5dmha lma ykon
// el mot8yr aw el 7aga el htt8yr f el sf7a f nfs el mkan el fe a2rb build leha
// fa b el taly f el ttbe2 d msh hynf3 nst5dmha 3shan el mot8yr el byt8yr msh f
// f nfs el mkan ely el sf7a btt8yr feh fa lazm ndwr 3la bdayl a3la mnha

// hena b2a tzhr ahmyt el state management
// bloc and cubit
// hnbd2 el awl nshof el cubit w 3shan nst5dm el cubit 3ayzen n3rf el patter bta3o

// create states
//create cubit
//create functions
// provide cubit
//integrate cubit
//trigger cubit
