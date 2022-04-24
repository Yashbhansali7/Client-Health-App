import '../Widgets/app_drawer.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemindersScreen extends StatefulWidget {
  static const routeName = '/Reminders';

  @override
  _RemindersScreenState createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  String enteredTitle = '';
  final _titleController = TextEditingController();
  DateTime _selectedFDate;
  DateTime _selectedLDate;
  bool _morning = false;
  bool _afternoon = false;
  bool _night = false;

  void _submiAction() async {
    enteredTitle = _titleController.text;

    if (_selectedFDate == null ||
        _selectedLDate == null ||
        enteredTitle.isEmpty ||
        (_morning == false && _afternoon == false && _night == false)) return;

    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    FirebaseFirestore.instance.collection('reminders').add({
      'medicineName': enteredTitle.toUpperCase(),
      'timeStamp': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()['username'],
      'startDate': _selectedFDate,
      'lastDate': _selectedLDate,
      'morning': _morning,
      'afternoon': _afternoon,
      'night': _night,
    });
    _titleController.clear();
    _morning = false;
    _afternoon = false;
    _night = false;
    _selectedFDate = null;
    _selectedLDate = null;
    Navigator.of(context).pop();
  }

  void _showFirstDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    ).then((value) {
      if (value == null) {
        return;
      }
      _selectedFDate = value;
    });
  }

  void _showLastDate() {
    showDatePicker(
      context: context,
      initialDate: _selectedFDate.add(Duration(days: 1)),
      firstDate: _selectedFDate.add(Duration(days: 1)),
      lastDate: _selectedFDate.add(Duration(days: 30)),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedLDate = value;
      });
    });
  }

  void _openNewReminder(BuildContext ctx) {
    // function which which open the sheet
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        context: ctx,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: SingleChildScrollView(
                child: Card(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 10,
                      left: 10,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Medicine Name: '),
                          controller: _titleController,
                          onSubmitted: (value) =>
                              FocusScope.of(context).unfocus(),
                          //sending data entered by user to function
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Column(
                          children: [
                            CheckboxListTile(
                              secondary: const Icon(Icons.alarm),
                              title: const Text('Morning Reminder'),
                              subtitle: Text('Rings at 9:00 AM every day'),
                              value: _morning,
                              onChanged: (bool value) {
                                state(() {
                                  _morning = value;
                                });
                              },
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              secondary: const Icon(Icons.alarm),
                              title: const Text('Afternoon Reminder'),
                              subtitle: Text('Rings at 2:00 PM every day'),
                              value: this._afternoon,
                              onChanged: (bool value) {
                                state(() {
                                  this._afternoon = value;
                                });
                              },
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              secondary: const Icon(Icons.alarm),
                              title: const Text('Night Reminder'),
                              subtitle: Text('Rings at 8:00 PM every day'),
                              value: this._night,
                              onChanged: (bool value) {
                                state(() {
                                  this._night = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _selectedFDate == null
                                    ? 'No Date Chosen!!'
                                    : DateFormat.yMMMEd()
                                        .format(_selectedFDate),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: _showFirstDate,
                                child: Text(
                                  'Choose Start Date',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _selectedLDate == null
                                    ? 'No Date Chosen!!'
                                    : DateFormat.yMMMEd()
                                        .format(_selectedLDate),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: _showLastDate,
                                child: Text(
                                  'Choose End Date',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _submiAction,
                          child: const Text('Add Reminder',
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //getting data from tf_trans to give it to _addnewtrans function
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          'User Reminders',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: const NetworkImage(
                'https://wallpapercave.com/wp/wp8741206.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final chatDocs = snapshot.data.docs;
            final user = FirebaseAuth.instance.currentUser;
            return ListView.builder(
              padding: EdgeInsets.only(top: 80, right: 8, left: 8),
              itemCount: chatDocs.length,
              itemBuilder: (context, index) {
                return chatDocs[index].data()['userId'] == user.uid
                    ? Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        child: ListTile(
                          minVerticalPadding: 10,
                          title: Text(
                            chatDocs[index].data()['medicineName'],
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    DateFormat.MMMEd().format(
                                      chatDocs[index]
                                          .data()['startDate']
                                          .toDate(),
                                    ),
                                  ),
                                  Text(' - '),
                                  Text(
                                    DateFormat.MMMEd().format(
                                      chatDocs[index]
                                          .data()['lastDate']
                                          .toDate(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.check),
                                  Text((() {
                                    if (chatDocs[index].data()['morning'] ==
                                            true &&
                                        chatDocs[index].data()['afternoon'] ==
                                            true &&
                                        chatDocs[index].data()['night'] ==
                                            true) {
                                      return 'Morning, Afternoon and Night';
                                    } else if (chatDocs[index]
                                                .data()['morning'] ==
                                            true &&
                                        chatDocs[index].data()['afternoon'] ==
                                            true) {
                                      return ' Morning and Afternoon';
                                    } else if (chatDocs[index]
                                                .data()['morning'] ==
                                            true &&
                                        chatDocs[index].data()['night'] ==
                                            true) {
                                      return ' Morning and Night';
                                    } else if (chatDocs[index]
                                                .data()['afternoon'] ==
                                            true &&
                                        chatDocs[index].data()['night'] ==
                                            true) {
                                      return ' Afternoon and Night';
                                    } else if (chatDocs[index]
                                            .data()['morning'] ==
                                        true) {
                                      return ' Morning';
                                    } else if (chatDocs[index]
                                            .data()['afternoon'] ==
                                        true) {
                                      return ' Afternoon';
                                    } else {
                                      return ' Night';
                                    }
                                  }())),
                                ],
                              ),
                            ],
                          ),
                          leading: Icon(
                            Icons.add_alarm,
                            color: Colors.deepPurple,
                            size: 30,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () async =>
                                await FirebaseFirestore.instance.runTransaction(
                                    (Transaction myTransaction) async {
                              myTransaction.delete(chatDocs[index].reference);
                            }),
                          ),
                        ),
                      )
                    : null;
              },
            );
          },
          stream: FirebaseFirestore.instance
              .collection('reminders')
              .orderBy('timeStamp', descending: true)
              .snapshots(),
        ),
      ),
      drawer: AppDrawer(),
      floatingActionButton: Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.all(15),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.deepPurple,
          label: Text(
            'Add Reminders',
            style: TextStyle(fontSize: 16),
          ),
          icon: Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () => _openNewReminder(context),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
