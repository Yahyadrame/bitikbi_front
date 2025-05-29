import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/../core/constants/colors.dart';
import '/../core/constants/strings.dart';
import '/../core/utils/logger.dart';
import '/../main.dart';
import 'package:bitik_bi/l10n/app_localizations.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isOtpSent = false;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _sendOtp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiBaseUrl}/auth/send-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': _phoneController.text}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _isOtpSent = true;
        });
      } else {
        setState(() {
          _errorMessage = 'Erreur lors de l\'envoi du code OTP';
        });
      }
    } catch (e) {
      Logger.log('Error sending OTP: $e');
      setState(() {
        _errorMessage = 'Erreur de connexion au serveur';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _verifyOtp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiBaseUrl}/api/auth/verify'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phone': _phoneController.text,
          'otp': _otpController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Navigate to main screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        setState(() {
          _errorMessage = 'Code OTP invalide';
        });
      }
    } catch (e) {
      Logger.log('Error verifying OTP: $e');
      setState(() {
        _errorMessage = 'Erreur de connexion au serveur';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName),
        backgroundColor: AppColors.bangladeshGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.welcome,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: l10n.loginPhoneLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            if (_isOtpSent) ...[
              const SizedBox(height: 16),
              TextField(
                controller: _otpController,
                decoration: InputDecoration(
                  labelText: l10n.otpLabel,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _isOtpSent ? _verifyOtp : _sendOtp,
                    child: Text(
                      _isOtpSent ? l10n.verifyOtpButton : l10n.sendOtpButton,
                    ),
                  ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }
}