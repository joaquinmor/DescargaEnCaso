import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text('Tab 1')),
          Center(child: Text('Tab 2')),
          Center(
              child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Center(child: Text('Tab 1')),
              Center(child: Text('Tab 2')),
              Tab3(),
            ],
          )),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.looks_one)),
            Tab(icon: Icon(Icons.looks_two)),
            Tab(icon: Icon(Icons.looks_3)),
          ],
        ),
      ),
    );
  }
}

class Tab3 extends StatefulWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  DateTime _selectedTime = DateTime.now();
  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text('Button'),
              onPressed: () {
                // Button pressed
              },
            ),
          ),
          SizedBox(height: 16),
          TimePickerSpinner(
            is24HourMode: false,
            normalTextStyle: TextStyle(fontSize: 24, color: Colors.deepOrange),
            highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.yellow),
            spacing: 50,
            itemHeight: 80,
            isForce2Digits: true,
            onTimeChange: (time) {
              setState(() {
                _selectedTime = time;
              });
            },
          ),
          SizedBox(height: 16),
          Expanded(
            child: Text(
                'Selected time: ${_selectedTime.hour}:${_selectedTime.minute}'),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Checkbox(
              value: _checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxValue = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
