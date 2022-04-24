import '../Providers/reviews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReview extends StatefulWidget {
  static const routeName = '/addReview';
  @override
  _AddReviewState createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  String dropdownValue = 'Mr.';
  final _form = GlobalKey<FormState>();
  var _newReview = ReviewList(null, '', DateTime.now());
  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    Provider.of<Reviews>(context, listen: false).addReview(_newReview);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add A Review'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: EdgeInsets.only(left: 8, top: 4),
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 12, right: 14),
                  child: DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    dropdownColor: Colors.purple[20],
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Mr.', 'Ms.', 'Mrs.']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    validator: (value) {
                      final isDigitsOnly = int.tryParse(value);
                      if (value.isEmpty) {
                        return 'Please Enter Your Name';
                      } else if (isDigitsOnly != null) {
                        return 'Please Enter Only Character Values';
                      } else if (value.length < 4) {
                        return 'Name must be atleast 4 words long';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _newReview = ReviewList(
                        newValue, _newReview.rData, _newReview.dateTime),
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                onSaved: (newValue) => _newReview =
                    ReviewList(_newReview.rId, newValue, _newReview.dateTime),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Your Review';
                  } else if (value.length < 40) {
                    return 'Review must be atleast 40 words long';
                  }
                  return null;
                },
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Your Review',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 220,
        margin: EdgeInsets.only(bottom: 30),
        child: FloatingActionButton.extended(
          icon: Icon(Icons.verified_user),
          backgroundColor: Theme.of(context).primaryColor,
          label: Text(
            'Submit Review',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: _saveForm,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
