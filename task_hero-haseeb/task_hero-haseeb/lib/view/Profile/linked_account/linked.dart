import 'package:flutter/material.dart';
import 'package:cocoon/res/constants/imports.dart';

class LinkedAccountsScreen extends StatefulWidget {
  @override
  _LinkedAccountsScreenState createState() => _LinkedAccountsScreenState();
}

class _LinkedAccountsScreenState extends State<LinkedAccountsScreen> {
  bool _rememberMe = true;
  bool _biometricId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: 'Linked accounts',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  _buildSwitchTile('Remember me', _rememberMe, (value) {
                    setState(() {
                      _rememberMe = value;
                    });
                  }),
                  SizedBox(height: 16),
                  _buildSwitchTile('Biometric ID', _biometricId, (value) {
                    setState(() {
                      _biometricId = value;
                    });
                  }),
                  SizedBox(height: 16),
                  _buildListTile('Google Authenticator', () {}),
                  _buildListTile('PIN', () {}),
                ],
              ),
            ),
          ),
          Center(
            child: AppButton.primary(title: "Apply", width: 200),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            height: 1.4,
            letterSpacing: 0.2,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildListTile(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Gellix',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 1.4,
          letterSpacing: 0.2,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
      onTap: onTap,
    );
  }
}
