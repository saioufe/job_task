import 'package:flutter/material.dart';
import 'package:job_task/models/work_card_model.dart';
import 'dart:math' as math;

class WorkCardWidget extends StatelessWidget {
  final CardWorkModel cardWork;
  const WorkCardWidget({
    Key key,
    @required this.cardWork,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        //flex: 7,
                        child: Text(
                          cardWork.date,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.only(right: 10),
                          child: Text(
                            "اسم الموظف : " + cardWork.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                          )),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      "اسم الوكيل : " + cardWork.agentName,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      "رقم الوكيل : " + cardWork.agentNumber.toString(),
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      "العنوان  : " + cardWork.address,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                Container(
                  width: double.infinity,
                  child: const Divider(
                    // indent: 85,
                    thickness: 0.5,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Expanded(
                          //flex: 7,
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: IconButton(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.redAccent,
                                icon: Transform.rotate(
                                  angle: -math.pi / 1.0,
                                  child: Icon(
                                    Icons.double_arrow_rounded,
                                    size: 30,
                                  ),
                                ),
                                onPressed: () {}),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: IconButton(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.green,
                                icon: Icon(Icons.double_arrow_outlined),
                                onPressed: () {}),
                          ),
                        ],
                      )),
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "نوع العمل : " + cardWork.job_type,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
