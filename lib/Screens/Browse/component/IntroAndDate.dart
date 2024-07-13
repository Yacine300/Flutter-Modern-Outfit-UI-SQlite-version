import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class IntroAndDate extends StatefulWidget {
  const IntroAndDate();

  @override
  State<IntroAndDate> createState() => _IntroAndDateState();
}

class _IntroAndDateState extends State<IntroAndDate> {
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('d-M-y').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today Selection',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            formattedDate,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
