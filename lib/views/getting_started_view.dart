import 'package:flutter/material.dart';
import 'login_view.dart';
import 'sign_up_view.dart';

class GettingStartedView extends StatefulWidget {
  const GettingStartedView({Key? key}) : super(key: key);

  @override
  _GettingStartedViewState createState() => _GettingStartedViewState();
}

class _GettingStartedViewState extends State<GettingStartedView> {
  bool _showInitialScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'EventHub',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Image.asset('lib/assets/images/eventhub_logo.png', height: 120),
              SizedBox(height: 16),
              Text(
                'Where Every Occasion Finds Its Perfect Pulse',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 32),
              if (_showInitialScreen) ...[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showInitialScreen = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // makes the button stretch
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Get Started', style: TextStyle(fontSize: 20)),
                ),
              ] else ...[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Log In', style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpView()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200],
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Sign Up', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showInitialScreen = true;
                    });
                  },
                  child: Text('Back', style: TextStyle(fontSize: 20)),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
