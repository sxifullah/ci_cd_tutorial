//Name: Saif Ullah Khan
//Matric: Number: 213877

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ActivationPage(),
    );
  }
}

class ActivationPage extends StatefulWidget {
  const ActivationPage({Key? key}) : super(key: key);

  @override
  _ActivationPageState createState() => _ActivationPageState();
}

class _ActivationPageState extends State<ActivationPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(254, 254, 251, 253),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/upm_logo.jpg', // Replace with your logo image asset path
                  width: 175, // Adjust as needed
                  height: 175, // Adjust as needed
                ),
                const Text(
                  'Welcome !',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 380.0,
              height: 440.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(254, 254, 217, 216),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // shadow color
                    spreadRadius: 5, // spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Label with image to the right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Enter your mobile number to activate your account.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/info_icon.png'), // Make sure you have this image in your assets folder
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Add the image
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/mAsia_flag.png'), // Make sure you have this image in your assets folder
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        // Country code
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '+60',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        // Phone number input
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Checkbox and label
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                        const Flexible(
                          child: Text('I agree to the terms & conditions'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Button
                    ElevatedButton(
                      onPressed: _isChecked
                          ? () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const OtpPage(),
                                ),
                              );
                            }
                          : null,
                      child: const Text('Get Activation Code'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 20.0), // Add some space below the main container
          Center(
            child: TextButton(
              onPressed: () {
                launch('https://upm.edu.my/');
              },
              child: const Text(
                'Disclaimer | Privacy Statement',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Center(
            child: const Text(
              'Copyright UPM & Kejuruteraan Minyak Sawit\n CCS Sdn. Bhd.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();
  int _otpLength = 0;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(_updateOtpLength);
  }

  void _updateOtpLength() {
    setState(() {
      _otpLength = _otpController.text.length;
    });
  }

  @override
  void dispose() {
    _otpController.removeListener(_updateOtpLength);
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(254, 254, 251, 253),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/upm_logo.jpg', // Replace with your logo image asset path
                  width: 175, // Adjust as needed
                  height: 175, // Adjust as needed
                ),
                const Text(
                  'Welcome !',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 380.0,
              height: 440.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // shadow color
                    spreadRadius: 5, // spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Label with image to the right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Enter the activation code you received via SMS.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/info_icon.png'), // Make sure you have this image in your assets folder
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _otpController,
                            decoration: InputDecoration(
                              labelText: 'OTP',
                              labelStyle: TextStyle(
                                fontSize: 16.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: EdgeInsets.only(left: 160.0),
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            maxLength: 6,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't receive? ",
                        ),
                        GestureDetector(
                          onTap: () {
                            launch('https://upm.edu.my/');
                          },
                          child: const Text(
                            "Tap here",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const DashboardPage(),
                          ),
                        );
                      },
                      child: const Text('Activate'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 20.0), // Add some space below the main container
          Center(
            child: TextButton(
              onPressed: () {
                launch('https://upm.edu.my/');
              },
              child: const Text(
                'Disclaimer | Privacy Statement',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Center(
            child: const Text(
              'Copyright UPM & Kejuruteraan Minyak Sawit\n CCS Sdn. Bhd.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  List<bool> isSelected = [true, false];
  int _selectedFactory = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EngineerPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationPage()),
      );
    }
  }

  void _onTogglePressed(int index) {
    setState(() {
      _selectedFactory = index + 1;
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  Widget _buildContainer(int imageNumber, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8),
          Image.asset(
            'images/image_$imageNumber.png',
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(213, 241, 241, 241),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Factory $_selectedFactory",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            )),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('images/settings_icon.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              width: 380.0,
              height: 460.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(237, 237, 238, 237),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // shadow color
                    spreadRadius: 5, // spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  _selectedFactory == 1
                      ? Text(
                          '1549.7kW',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        )
                      : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.warning_outlined,
                                  color: Color.fromARGB(
                                      255, 255, 208, 18)), // Add the error icon
                              SizedBox(
                                  width:
                                      5), // Add some space between the icon and the text
                              Text(
                                'ABD1234 IS UNREACHABLE !',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        List<int> imageNumbers;
                        List<String> titles;
                        if (_selectedFactory == 1) {
                          // For Factory 1
                          imageNumbers = [1, 2, 3, 4];
                          titles = [
                            "Steam Pressure",
                            "Steam Flow",
                            "Water Level",
                            "Power Frequency"
                          ];
                        } else {
                          // For Factory 2
                          imageNumbers = [5, 6, 7, 8];
                          titles = [
                            "Steam Pressure",
                            "Steam Flow",
                            "Water Level",
                            "Power Frequency"
                          ];
                        }
                        return _buildContainer(
                            imageNumbers[index], titles[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${DateTime.now()}",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(213, 241, 241, 241),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected[1]
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.blue.withOpacity(0.35), // shadow color
                        spreadRadius: 5, // spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => _onTogglePressed(0),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/factory_icon.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Factory 1",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 25.0), // Add gap between the two buttons
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(213, 241, 241, 241),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected[0]
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.blue.withOpacity(0.35), // shadow color
                        spreadRadius: 5, // spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => _onTogglePressed(1),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/factory_icon.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Factory 2",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/user_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/home_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/settings_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class EngineerPage extends StatefulWidget {
  const EngineerPage({super.key});

  @override
  State<EngineerPage> createState() => _EngineerPageState();
}

class _EngineerPageState extends State<EngineerPage> {
  int _selectedIndex = 0;
  List<bool> isSelected = [true, false];
  int _selectedFactory = 1;

  List<String> engineersFactory1 = [
    "John Doe - +60123456789",
    "Jane Smith - +60987654321",
    "Alice Brown - +6023456-7890"
  ];

  List<String> engineersFactory2 = [
    "Bob Johnson - +60111111111",
    "Emily Davis - +60222222222",
    "David Wilson - +60333333333"
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EngineerPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationPage()),
      );
    }
  }

  void _onTogglePressed(int index) {
    setState(() {
      _selectedFactory = index + 1;
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  Widget _buildContactContainer(String name, String contactNumber) {
    return Column(
      children: [
        Container(
          width: 400.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // shadow color
                spreadRadius: 3, // spread radius
                blurRadius: 5, // blur radius
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                "• $contactNumber",
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0), // Adjust the height of the SizedBox as needed
      ],
    );
  }

  List<Widget> _buildEngineerList(List<String> engineers) {
    return engineers.map((engineer) {
      List<String> details = engineer.split(" - ");
      return _buildContactContainer(details[0], details[1]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 231, 230, 230),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Factory $_selectedFactory",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            )),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('images/settings_icon.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Stack(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  width: 380.0, // Adjusted width
                  height: 420.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // shadow color
                        spreadRadius: 5, // spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _selectedFactory == 1
                        ? _buildEngineerList(engineersFactory1)
                        : _buildEngineerList(engineersFactory2),
                  ),
                ),
                // Inside the Stack's Positioned widget
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (_selectedFactory == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const InvitationPage(factoryNumber: 1),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const InvitationPage(factoryNumber: 2),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(233, 233, 220, 254),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 33, 0, 92),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(213, 241, 241, 241),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected[1]
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.blue.withOpacity(0.35), // shadow color
                        spreadRadius: 5, // spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => _onTogglePressed(0),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/factory_icon.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Factory 1",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 25.0), // Add gap between the two buttons
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(213, 241, 241, 241),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected[0]
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.blue.withOpacity(0.35), // shadow color
                        spreadRadius: 5, // spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => _onTogglePressed(1),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/factory_icon.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Factory 2",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/user_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/home_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/settings_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class InvitationPage extends StatelessWidget {
  final int factoryNumber;

  const InvitationPage({Key? key, required this.factoryNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 231, 230, 230),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Factory $factoryNumber",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Row 1 (with title)
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Center(
                child: Text(
                  'Invitation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Row 2 (Invite users)
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Center(
                child: Text(
                  'Invite users',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            // Row 3 (Owner's Name)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Owner\'s Name',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
            // Row 4 (Text field)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Type here',
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ),
            // Row 5 (Owner's Phone Number)
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
              child: Text(
                'Owner\'s Phone Number',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
            // Row 6 (Phone Number Input)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/mAsia_flag.png'), // Make sure you have this image in your assets folder
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '+60',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Your Phone Number',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            // Row 7 (Submit Button)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const EngineerPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // Change the color here
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 0;
  List<bool> isSelected = [true, false];
  int _selectedFactory = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EngineerPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationPage()),
      );
    }
  }

  void _onTogglePressed(int index) {
    setState(() {
      _selectedFactory = index + 1;
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  Widget _buildContainer(String title, String value, String unit) {
    return Column(
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 150.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 243, 242, 242),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Container(
                width: 2, // Adjust the width to make the line visible
                height: 24, // Height of the line
                color: Colors.black, // Color of the line
              ),
              SizedBox(width: 4),
              Flexible(
                child: Text(
                  unit,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 231, 230, 230),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Factory $_selectedFactory",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            )),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('images/settings_icon.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              width: 380.0,
              height: 440.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 242, 242),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Minimum Threshold',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                'images/info_icon.png'), // Make sure you have this image in your assets folder
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () {
                          //do nothing
                        },
                        child: Container(
                          width: 55.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 214, 237),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 65, 1, 87),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 3 / 2,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        List<String> titles = [
                          "Steam Pressure",
                          "Steam Flow",
                          "Water Level",
                          "Power Frequency"
                        ];
                        List<String> values = ["29", "22", "53", "48"];
                        List<String> units = ["bar", "T/H", "%", "Hz"];
                        return _buildContainer(
                            titles[index], values[index], units[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(213, 241, 241, 241),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected[1]
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.blue.withOpacity(0.35), // shadow color
                        spreadRadius: 5, // spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => _onTogglePressed(0),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/factory_icon.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Factory 1",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 25.0), // Add gap between the two buttons
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(213, 241, 241, 241),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected[0]
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.blue.withOpacity(0.35), // shadow color
                        spreadRadius: 5, // spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => _onTogglePressed(1),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/factory_icon.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Factory 2",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/user_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/home_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/settings_icon.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
