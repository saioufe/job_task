import 'package:flutter/material.dart';
import 'package:job_task/models/work_card_model.dart';
import 'card_widget.dart';

class CardWorkWidget extends StatelessWidget {
  CardWorkWidget();

  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.05,
      //height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(right: 10, left: 10, top: 10),
          child: ListView(children: [
            WorkCardWidget(
              cardWork: CardWorkModel(
                id: 1,
                name: "حيدر خالد",
                agentName: "حيدر خالد",
                agentNumber: 123141,
                date: "12:30 م",
                address: "كرادة داخل - شارع 62",
                job_type: "تجيك لينك",
              ),
            ),
            WorkCardWidget(
              cardWork: CardWorkModel(
                id: 1,
                name: "حيدر خالد",
                agentName: "حيدر خالد",
                agentNumber: 123141,
                date: "12:30 م",
                address: "كرادة داخل - شارع 62",
                job_type: "تجيك لينك",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
