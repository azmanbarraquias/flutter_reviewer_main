import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyPage());
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final _ratedPowerFocusNote = FocusNode();
  final _hoursDailyUsageFocusNote = FocusNode();
  final _powerRatedFocusNote = FocusNode();

  var _isValid = false;

  var _editedBills =
      ElectricBill(ratedPower: 0, hoursDailyUsage: 0, powerRated: 0);

  final _ratedPowerController = TextEditingController();
  final _hoursDailyUsageController = TextEditingController();
  final _powerRatedController = TextEditingController();

  final _form = GlobalKey<FormState>();

  void _computeBill() {
    final isValid = _form.currentState?.validate();
    _isValid = isValid!;

    if (!isValid) {
      return;
    }

    setState(() {
      _editedBills = ElectricBill(
        ratedPower: _editedBills._ratedPower,
        hoursDailyUsage: _editedBills._hoursDailyUsage,
        powerRated: _editedBills._powerRate,
      );
    });
    FocusScope.of(context).requestFocus(null);
    _form.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    final inputFieldDecoration = InputDecoration(
      hintStyle: const TextStyle(
        color: Colors.black12,
      ),
      contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.yellow, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.pinkAccent, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.indigo, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Electric Bill Calculator',
            style: TextStyle(color: Colors.indigo),
          ),
          elevation: 3,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(10).copyWith(bottom: 0),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                            blurRadius: 4),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                textAlign: TextAlign.center,
                                'Rated Power',
                              )),
                          Expanded(
                            child: Text(
                              'x',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(
                                textAlign: TextAlign.center,
                                'Monthly Usage',
                              )),
                          Expanded(
                            child: Text(
                              'x',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Flexible(
                              flex: 2,
                              child: Text(
                                textAlign: TextAlign.center,
                                'Power Rate',
                              )),
                          Expanded(
                            child: Text(
                              '=',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                textAlign: TextAlign.center,
                                'Cost of Operation',
                              )),
                        ])),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                          blurRadius: 4),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                      key: _form,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            TextFormField(
                              // decoration: ,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_hoursDailyUsageFocusNote);
                              },
                              focusNode: _ratedPowerFocusNote,
                              decoration: inputFieldDecoration.copyWith(
                                  hintText: 'Rated Power'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a value';
                                }
                                if (num.tryParse(value) == null) {
                                  return 'Please enter valid number';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editedBills = ElectricBill(
                                    ratedPower: num.parse(value!),
                                    hoursDailyUsage:
                                        _editedBills._hoursDailyUsage,
                                    powerRated: _editedBills._powerRate);
                              },
                            ),
                            const Gap(10),
                            TextFormField(
                              decoration: inputFieldDecoration.copyWith(
                                  hintText: 'Hours Daily Usage'),
                              textInputAction: TextInputAction.next,
                              focusNode: _hoursDailyUsageFocusNote,
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_powerRatedFocusNote);
                              },
                              onSaved: (value) {
                                _editedBills = ElectricBill(
                                    ratedPower: _editedBills._ratedPower,
                                    hoursDailyUsage: num.parse(value!),
                                    powerRated: _editedBills._powerRate);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a value';
                                }
                                if (num.tryParse(value) == null) {
                                  return 'Please enter valid number';
                                }
                                return null;
                              },
                            ),
                            const Gap(10),
                            TextFormField(
                              decoration: inputFieldDecoration.copyWith(
                                  hintText: 'Power Rated'),
                              keyboardType: TextInputType.number,
                              focusNode: _powerRatedFocusNote,
                              onFieldSubmitted: (_) {
                                _computeBill();
                              },
                              onSaved: (value) {
                                _editedBills = ElectricBill(
                                    ratedPower: _editedBills._ratedPower,
                                    hoursDailyUsage:
                                        _editedBills._hoursDailyUsage,
                                    powerRated: num.parse(value!));
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a value';
                                }
                                if (num.tryParse(value) == null) {
                                  return 'Please enter valid number';
                                }
                                return null;
                              },
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {
                                        _form.currentState?.reset();
                                        _hoursDailyUsageController.clear();
                                        _ratedPowerController.clear();
                                        _powerRatedController.clear();
                                        FocusScope.of(context)
                                            .requestFocus(_ratedPowerFocusNote);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size(44, 44),
                                        // Set this
                                        padding: EdgeInsets.zero,
                                        //
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        side: const BorderSide(
                                            width: 1, color: Colors.grey),
                                      ),
                                      child: const Text('Clear')),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {
                                        _computeBill();
                                      },
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            0, 175, 180, 1),
                                        minimumSize: const Size(44, 44),
                                        // Set this
                                        padding: EdgeInsets.zero,
                                        //

                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        side: BorderSide.none,
                                      ),
                                      child: const Text(
                                        'Compute',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                Visibility(
                    visible: _isValid,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                              blurRadius: 4),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: BillsDetails(
                        electricBill: _editedBills,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}

class BillsDetails extends StatelessWidget {
  const BillsDetails({super.key, required this.electricBill});

  final ElectricBill electricBill;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
                child: Text(
              'Bill per month:',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
            Expanded(
                child: Text(
                    '₱ ${electricBill.billPerMonth().toStringAsFixed(2)}')),
            const Icon(Icons.calendar_month_outlined)
          ],
        ),
        Row(
          children: [
            const Expanded(
                child: Text('70% efficient:',
                    style: TextStyle(fontWeight: FontWeight.w500))),
            Expanded(
                child: Text(
                    '₱ ${electricBill.getBillPerMonthEfficient(0.70).toStringAsFixed(2)}')),
            const Icon(Icons.percent_outlined)
          ],
        ),
        Row(
          children: [
            const Expanded(
                child: Text('Per day',
                    style: TextStyle(fontWeight: FontWeight.w500))),
            Expanded(
                child:
                    Text('₱ ${electricBill.billPerDay().toStringAsFixed(2)}')),
            const Icon(Icons.today_outlined)
          ],
        ),
        Row(
          children: [
            const Expanded(
                child: Text('Per hour',
                    style: TextStyle(fontWeight: FontWeight.w500))),
            Expanded(
                child: Text(
                    '₱ ${electricBill.usagePerHour().toStringAsFixed(2)}')),
            const Icon(Icons.access_time)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text('Bill per ${electricBill._hoursDailyUsage}hrs Usage:',
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ),
            Expanded(
                child: Text(
              '₱ ${electricBill.yourUsageHour().toStringAsFixed(2)}',
            )),
            const Icon(Icons.timer_sharp)
          ],
        ),
      ],
    );
  }
}

class ElectricBill {
  final num _ratedPower;
  final num _hoursDailyUsage;
  final num _powerRate;

  num get hoursDailyUsage => _hoursDailyUsage;

  num get powerRate => _powerRate;

  final num _days = 30;

  ElectricBill(
      {required num ratedPower,
      required num hoursDailyUsage,
      required num powerRated})
      : _ratedPower = ratedPower,
        _hoursDailyUsage = hoursDailyUsage,
        _powerRate = powerRated;

  num ratedPowerKiloWattsHours() {
    return _ratedPower / 1000;
  }

  num billPerMonth() {
    return ratedPowerKiloWattsHours() * (_days * hoursDailyUsage) * powerRate;
  }

  num billPerDay() {
    return billPerMonth() / _days;
  }

  num usagePerHour() {
    return billPerDay() / 24;
  }

  num yourUsageHour() {
    return usagePerHour() * hoursDailyUsage;
  }

  num getBillPerMonthEfficient(double efficientPerc) {
    return billPerMonth() * efficientPerc;
  }
}
