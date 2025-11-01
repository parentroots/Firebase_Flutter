import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('football')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Matches')),

//
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: _usersStream,
      //   builder: (context, snapshot) {
      //
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //
      //     if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     }
      //
      //     if (!snapshot.hasData || snapshot.data == null) {
      //       return const Center(child: Text('No data found'));
      //     }
      //
      //     final docs = snapshot.data!.docs;
      //
      //     return ListView.builder(
      //       itemCount: docs.length,
      //       itemBuilder: (context, index) {
      //         var item = docs[index].data() as Map<String, dynamic>;
      //
      //         return SizedBox(
      //           height: 70,
      //           child: Card(
      //             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     Text(item['team1Name'] ?? "Unavailable"),
      //                     Text("VS"),
      //                     Text(item['team2Name'] ?? "Unavailable"),
      //                   ],
      //                 ),
      //
      //                 SizedBox(height: 10),
      //
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     Text(item['team1']?.toString() ?? "0"),
      //                     Text("VS"),
      //                     Text(item['team2']?.toString() ?? "0"),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //             // child: ListTile(
      //             //   title: Text(item['team1Name'] ?? 'No Team 1'),
      //             //   subtitle: Text(item['team2Name'] ?? 'No Team 2'),
      //             //   trailing: Text(item['team1']?.toString() ?? '0 - 0'),
      //             // ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
      
      
      // body: StreamBuilder(stream: _usersStream, builder: (context,snapshot){
      //   if (snapshot.hasError) {
      //     return const Center(
      //       child: Text("Something went wrong!"),
      //     );
      //   }
      //
      //   if (snapshot.connectionState == ConnectionState.waiting) {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }
      //
      //   if (!snapshot.hasData || snapshot.data == null) {
      //     return const Center(
      //       child: Text("No data available!"),
      //     );
      //   }
      //
      //
      //   final docs=snapshot.data!.docs;
      //   return ListView.builder(
      //      itemCount: docs.length,
      //       itemBuilder: (context,index){
      //     final data=docs[index].data() as Map<String,dynamic>;
      //
      //     debugPrint("data is : ${data.length.toString()}");
      //     return ListTile(
      //
      //       title: Text(data['team1']?.toString()??"no data found"),
      //
      //
      //     );
      //   });
      // }),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("football").snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context,index){
                  final data=snapshot.data?.docs[index];
                return Card(child: Text(data?['team1']?.toString()??"null"),);
              });
            }
          }),
    );
  }
}
