import 'package:flutter/material.dart';
import 'package:ts/features/training/presentation/widgets/cart_widget.dart';

class Stretching extends StatelessWidget {
  const Stretching({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'TRAINING',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.7,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.calendar_today_outlined, color: Colors.white),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.pink,
            indicatorWeight: 3,
            dividerColor: Colors.grey.shade800,
            dividerHeight: 3,
            padding: EdgeInsets.all(13),
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.grey.shade800,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            tabs: [
              Tab(text: 'STRETCHING'),
              Tab(text: 'FUNCTIONAL'),
              Tab(text: 'BODY MIND'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildCardList([
              CardWidget(
                image: 'assets/images/person.png',
                title: 'SPLIT SCHOOL',
                isLocked: false,
              ),
              CardWidget(
                image: 'assets/images/person.png',
                title: 'HEALTHY BACK',
                isLocked: true,
              ),
              CardWidget(
                image: 'assets/images/person.png',
                title: 'STRETCHING',
                isLocked: true,
              ),
            ]),
            buildCardList([
              CardWidget(
                image: 'assets/images/person.png',
                title: 'ISOLATION',
                isLocked: false,
              ),
              CardWidget(
                image: 'assets/images/person.png',
                title: 'HIIT',
                isLocked: true,
              ),
            ]),
            buildCardList([
              CardWidget(
                image: 'assets/images/person.png',
                title: 'YOGA & PILATES',
                isLocked: false,
              ),
              CardWidget(
                image: 'assets/images/person.png',
                title: 'RELAXATION',
                isLocked: true,
              ),
              CardWidget(
                image: 'assets/images/person.png',
                title: 'FACEBUILDING',
                isLocked: true,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildCardList(List<CardWidget> items) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CardWidget(
          image: item.image,
          title: item.title,
          isLocked: item.isLocked,
        );
      },
    );
  }
}
