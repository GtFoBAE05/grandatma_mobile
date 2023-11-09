import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/room/get_available_room/get_available_room_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/customer/room/room_detail_page.dart';

class RoomListPage extends StatefulWidget {
  static const ROUTE_NAME = "/room_list_page";
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  String? startDate;
  String? endDate;
  int? roomId;

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
          'Room List',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<GetAvailableRoomBloc, GetAvailableRoomState>(
        builder: (context, state) {
          if (state is GetAvailableRoomInitial ||
              state is GetAvailableRoomLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAvailableRoomSuccess) {
            return ListView.builder(
              itemCount: state.roomList.length,
              itemBuilder: (context, index) {
                final room = state.roomList[index];
                return ListTile(
                  title: Text("Nomor kamar: ${room.nomorKamar}"),
                  subtitle: Text("Tipe kamar: ${room.namaTipe} / Rp${room.tarif}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoomDetailPage.ROUTE_NAME,
                      arguments: {
                        'startDate' : startDate,
                        'endDate': endDate,
                        'roomTypeId': room.idTipeKamar,
                        'roomId' : room.id,
                        'price' : room.tarif
                      },
                    );
                  },
                );
              },
            );
          } else if (state is GetAvailableRoomError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text("Unknown state"),);
          }
        },
      )
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    startDate = args['startDate'];
    endDate = args['endDate'];
    roomId = args['roomId'];
    context.read<GetAvailableRoomBloc>().add(SearchAvailableRoom(startDate: startDate.toString(), endDate: endDate.toString()));
  }
}
