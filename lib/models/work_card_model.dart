import 'package:equatable/equatable.dart';

class CardWorkModel extends Equatable {
  final int id;
  final String name;

  final String date;
  final String agentName;
  final int agentNumber;
  final String address;
  final String job_type;
  const CardWorkModel({
    this.id,
    this.name,
    this.date,
    this.agentName,
    this.agentNumber,
    this.address,
    this.job_type,
  });
  @override
  List<Object> get props => [
        id,
        name,
        date,
        agentName,
        agentNumber,
        address,
        job_type,
      ];
}
