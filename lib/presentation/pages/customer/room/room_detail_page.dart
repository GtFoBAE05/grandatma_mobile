import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/room/get_room_detail/get_room_detail_bloc.dart';

class RoomDetailPage extends StatefulWidget {
  static const ROUTE_NAME = "/room_detail_page";

  const RoomDetailPage({super.key});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  int? roomId;
  int? roomTypeId;
  String? startDate;
  String? endDate;
  int? price;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    roomId = args['roomId'];
    print(roomId);
    roomTypeId = args['roomTypeId'];
    startDate = args['startDate'];
    endDate = args['endDate'];
    price = args['price'];
    context.read<GetRoomDetailBloc>().add(GetRoomDetail(id: roomTypeId!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Room Detail',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<GetRoomDetailBloc, GetRoomDetailState>(
        builder: (context, state) {
          if (state is GetRoomDetailInitial || state is GetRoomDetailLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetRoomDetailSuccess) {
            return Center(
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Room Name: ${state.roomDetail.namaTipe}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple, // Ganti warna sesuai selera
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Bed: ${state.roomDetail.pilihanTempatTidur}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800], // Ganti warna sesuai selera
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Room Facility: ${state.roomDetail.fasilitas}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800], // Ganti warna sesuai selera
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Room Description: ${state.roomDetail.deskripsi}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800], // Ganti warna sesuai selera
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Room Detail: ${state.roomDetail.rincianKamar}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800], // Ganti warna sesuai selera
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple, // Ganti warna sesuai selera
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                "/add_reservation_page",
                                arguments: {
                                  "startDate": startDate,
                                  "endDate": endDate,
                                  "roomId": roomId,
                                  "roomTypeId": roomTypeId,
                                  "roomTypeName": state.roomDetail.namaTipe,
                                  "bedType": state.roomDetail.pilihanTempatTidur,
                                  "price": price,
                                },
                              );
                            },
                            child: Text("Book Room"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is GetRoomDetailError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red), // Ganti warna sesuai selera
              ),
            );
          } else {
            return Center(
              child: Text("Unknown state"),
            );
          }
        },
      ),
    );
  }

}
