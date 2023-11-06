import 'package:flutter/material.dart';

class HotelInformationPage extends StatefulWidget {
  static const ROUTE_NAME = "/hotel_information_page";

  const HotelInformationPage({Key? key}) : super(key: key);

  @override
  State<HotelInformationPage> createState() => _HotelInformationPageState();
}

class _HotelInformationPageState extends State<HotelInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images3.alphacoders.com/866/866032.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Card(
              margin: EdgeInsets.all(30),
              child: Container(
                width: 400,
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hotel Grandatma',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF222F3E),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Color(0xFFE67E22), size: 30),
                        Icon(Icons.star, color: Color(0xFFE67E22), size: 30),
                        Icon(Icons.star, color: Color(0xFFE67E22), size: 30),
                        Icon(Icons.star, color: Color(0xFFE67E22), size: 30),
                        Icon(Icons.star, color: Color(0xFFE67E22), size: 30),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Hotel Bintang 5',
                      style: TextStyle(
                        color: Color(0xFF718093),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Fasilitas',
                      style: TextStyle(
                        color: Color(0xFF222F3E),
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kolam Renang',
                          style: TextStyle(
                            color: Color(0xFF57606F),
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Restoran Mewah',
                          style: TextStyle(
                            color: Color(0xFF57606F),
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Spa & Pusat Kecantikan',
                          style: TextStyle(
                            color: Color(0xFF57606F),
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Kolam Air Panas',
                          style: TextStyle(
                            color: Color(0xFF57606F),
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Wifi Gratis',
                          style: TextStyle(
                            color: Color(0xFF57606F),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Tentang Kami',
                      style: TextStyle(
                        color: Color(0xFF222F3E),
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Hotel Grandatma menawarkan pengalaman menginap yang luar biasa dengan pemandangan spektakuler dan pelayanan berkualitas tinggi.',
                      style: TextStyle(
                        color: Color(0xFF718093),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
