import 'package:flutter/material.dart';
import 'package:jiranjigyo/model/student.dart';
import 'reservation.dart';
import 'complaint.dart';

int index = 0;
/*void TabMove(int index) {
  switch (index) {
    case 0:
      refresh();
      break;
    case 1:
      break;
    case 2:
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MyComplaint()));
      break;
    case 3:
      break;
  }
}

void TabIndex(int Tabindex) {
  setState(() {
    index = Tabindex;
  });
}*/

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: DetailCard(
          title: '세부사항',
          student: Student(id: '201801992', name: '김승민'),
          tableIndex: 3,
          time: DateTime.now(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          /*TabIndex(index);
          TabMove(index);*/
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "예약",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "예약확인"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "민원"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "퇴실"),
        ],
      ),
    );
  }
}

class DetailCard extends StatefulWidget {
  const DetailCard({
    super.key,
    required this.title,
    required this.student,
    required this.tableIndex,
    required this.time,
    this.students,
  });

  final String title;
  final Student student;
  final int tableIndex;
  final DateTime time;
  final List<Student>? students;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFC4C6D6),
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            opened = !opened;
          });
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: 370,
          child: Card(
            elevation: 0,
            color: const Color(0xFFC4C6D6),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(style: TextStyle(fontSize: 25), widget.title),
                      Text(
                          style: TextStyle(fontSize: 18),
                          '-------------------------------------'),
                      const SizedBox(height: 5.0),
                      Text(
                          style: TextStyle(fontSize: 18),
                          '학번: ${widget.student.id}'),
                      Text(
                          style: TextStyle(fontSize: 18),
                          '이름: ${widget.student.name}'),
                    ],
                  ),
                  if (opened)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: TextStyle(fontSize: 18),
                            '테이블: ${widget.tableIndex}'),
                        Text(
                            style: TextStyle(fontSize: 18),
                            '시간: ${widget.time}'),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
