import 'package:flutter/material.dart';

class FAQDisplay extends StatefulWidget {
  static const routeName = '/FAQDisplay';

  @override
  _FAQDisplayState createState() => _FAQDisplayState();
}

final List<String> faqHeader = [
  'APPOINTMENTS', //1
  'DOCTORS', //2
  'REPORTS', //3
  'REMINDERS', //4
  'FEEDBACK', //5
  'MY ACCOUNT', //6
  'MEDICINE', //7
];

class _FAQDisplayState extends State<FAQDisplay> {
  final List<String> faqQuestion = [
    '1.	How can I book an appointment?', //a1
    '2. How can I cancel my appointment?', //a2
    '3. I did not receive any appointment confirmation message.', //a3
    '4. I want to know the status of my appointment.', //a4
    '5. Is my preferred time for appointment available?', //a5
    '1. I am not able to find a doctor near my location.', //d6
    '2. How do I add a doctor to favorites?', //d7
    '1. I am unable to upload my Reports', //r8
    '2. How can I view My previous health reports?', //r9
    '1. Is my preferred time for appointment available?', //rem10
    '1. I want to share feedback for my recent doctor visit.', //f11
    '1. I want to change my registration email ID. What\'s the method?', //my12
    '2. I want to edit my personal details, what is the procedure?', //my13
    '1. How do I check if my medicine is authentic or not?', //med14
    '2. How can I set Medicine Reminders in my Citizen HealthCare App?', //med15
  ];

  final List<String> faqAnswer = [
    '''To book an appointment you can follow the steps mentioned below: -
  1. On the app, select the option “Book Appointment” on the home screen under the menu section.
  2. You can search by entering the doctor's name, specialty or hospital name in the search box or choose from the list of specialties
  3. You will find a list of doctors' profiles as per your selection
  4. Choose the doctor's profile you wish to book an appointment with and click the "Book" button for an in-clinic appointment
  5. Select the date and time slot at your convenience
  6. Click the "confirm" button and you will receive a confirmation dialogue box''', //1
    ''' To cancel the appointment, please follow these steps:
1. Log in to the app
2. Click the three bars appearing on the top left corner
3. Click “Appointments”, you'll be able to see all the scheduled appointments
4. Click the specific appointment that you want to cancel and select the delete icon to cancel your appointment.''', //2
    ''' 1. As soon as an appointment is booked a dialog box appears on the screen notifying you that the appointment has been booked.
2. In Case you missed the dialog box you can check by selecting the three bars on the top left corner on your Home Page then Select “Appointments”.
3. You will be able to see all the scheduled appointments.
4. Click the specific appointment and you will find the details of your appointment.''', //3
    ''' 1. To know the status of your appointment
2. Log in to the app
3. Click on the three bars on the top left corner on the Home Page 
4. Click Appointments. You will be able to see all the scheduled appointments.
5. Click the specific appointment and you will find the details of your appointment.''', //4
    ''' The time slots available are displayed on the screen when you go through the “Book an Appointment” procedure (refer Question 1 in Appointment FAQs).
Once a timeslot of a specific doctor is booked by one patient the same appointment time is not available for another Patient.
''', //5
    ''' If you are unable to find any doctors near your location the following can be possible: -
1. The pin code entered must be of 6 numerical digits.
2. Our app currently is not able to provide you with your preferred location.''', //6
    ''' To mark a doctor as favorite, please follow these steps:
1. Log in to the app
2. Click "Hospitals" on the home screen
3. Search the doctor that you are looking for by name/specialty
4. Select the doctor
5. The doctor’s profile page will open, below the profile there will be a star icon which you can select to mark that doctor as your favorite.''', //7
    ''' To upload your reports: -
1. Log in to the App
2. Click on the “My Reports” icon button.
3. Click on the plus icon button on the bottom right corner of the screen to upload reports.
4. Please check that the Reports should be in PDF, word Doc or JPEG form only.
5. Please check that the file size should not be more than 2MB.''', //8
    ''' You can find all your health reports in the “My Reports”. Follow these steps to find your reports: -
1. Login to the app
2. Click on the 3 bars appearing on the top left corner
3. Click on “My Reports” option.
4. You will be able to see all your past reports you have uploaded on the screen.''', //9
    '''You can Log into the Citizen HealthCare App and follow the steps below: -
1. Click on the “Reminders” Icon button on the Home Page or select the “Reminders” option from menu appearing from the three bars on the top left corner of your screen.
2. Click on the “+” icon button to add a new reminder.
3. After entering all the details of the reminder click “Set Reminder” ''', //10
    ''' To share the feedback, follow these steps: -
1. Log on to the app
2. On the top left corner click the three dots and select Appointments
3. Click the relevant appointment for which you wish to share the feedback
4. Click the doctor's name
5. Scroll down and click "give feedback"
6. You can fill all the details, and at the bottom, you have an option to share your experience in your own words.''', //11
    ''' If you wish to change your registered email ID, follow the step below:-
1. Log in to the app
2. Click on the 3 bars on the top left corner and go to ‘’View and Edit Profile”
3. Click on the delete icon button next to your email id and add the new email id you wish to register with.''', //12
    ''' If you wish to edit your personal details, follow the below steps:
1. Log in to the app
2. Click on the 3 bars on the top left corner and go to “View and Edit Profile'
3. Select the field you want to edit (for example: your date of birth (DD-MM-YYYY format), contact details, and blood group) make the necessary changes.''', //13
    ''' You can Log into the Citizen HealthCare App and follow the steps below: -
1. Click on the Medicine icon OR click on the three bars on the top left corner of the screen and select “Medicine” button
2. Under that click on “Authenticate Medicine”.
3. Enter the authentication id printed on the medicine and click on authenticate.
4. A dialog box will appear on the screen to inform you whether your medicine is authentic or not.''', //14
    ''' You can Log into the Citizen HealthCare App and follow the steps below: -
1. Click on the “Reminders” Icon button on the Home Page or select the “Reminders” option from menu appearing from the three bars on the top left corner of your screen.
2. Click on the “+” icon button to add a new reminder.
3. After entering all the details of the reminder click “Set Reminder”''' //15
  ];

  var _expandedH0 = false;

  Container answerLogic(int index) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Colors.black12,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Text(faqAnswer[index]));
  }

  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context).settings.arguments;
    int count;
    int ind = 0;
    if (args == 0) {
      count = 5;
      ind = 0;
    } else if (args == 1) {
      count = 2;
      ind = 5;
    } else if (args == 2) {
      count = 2;
      ind = 7;
    } else if (args == 3) {
      count = 1;
      ind = 8;
    } else if (args == 4) {
      count = 1;
      ind = 9;
    } else if (args == 5) {
      count = 2;
      ind = 11;
    } else if (args == 6) {
      count = 2;
      ind = 13;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(faqHeader[args]),
      ),
      body: Card(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(faqQuestion[index + ind]),
                    tileColor: _expandedH0
                        ? Theme.of(context).accentColor
                        : Colors.amber,
                    trailing: IconButton(
                      icon: Icon(
                          _expandedH0 ? Icons.expand_less : Icons.expand_more),
                      onPressed: () {
                        setState(
                          () {
                            _expandedH0 = !_expandedH0;
                          },
                        );
                      },
                    ),
                  ),
                  if (_expandedH0)
                    Column(
                      children: [
                        answerLogic(index + ind),
                      ],
                    ),
                  Divider(),
                ],
              );
            },
            itemCount: count,
          )),
    );
  }
}
