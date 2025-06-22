import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:koidio_ble/widgets/colors.dart';
import 'package:koidio_ble/widgets/my_signature.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      final name = "${_firstNameController.text} ${_lastNameController.text}";
      final email = _emailController.text;
      final phone = _phoneController.text;
      final message = _messageController.text;

      final subject = 'Message from $name (via BLEK)';
      final body =
          'Name: $name\nEmail: $email\nPhone: ${phone.isNotEmpty ? phone : 'Not provided'}\n\nMessage:\n$message';

      if (kIsWeb) {
        // Web-specific implementation
        final uri = Uri(
          scheme: 'https',
          host: 'mail.google.com',
          path: '/mail/u/0/',
          queryParameters: {
            'view': 'cm',
            'fs': '1',
            'to': 'koidioble@gmail.com',
            'su': subject,
            'body': body,
          },
        );

        try {
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            _showWebEmailFallbackDialog(subject, body);
          }
        } catch (e) {
          _showWebEmailFallbackDialog(subject, body);
        }
      } else {
        // Mobile implementation
        final uri = Uri(
          scheme: 'mailto',
          path: 'koidioble@gmail.com',
          queryParameters: {'cc': '', 'subject': subject, 'body': body},
        );

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch email client')),
          );
        }
      }
    }
  }

  void _showWebEmailFallbackDialog(String subject, String body) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Email Client Not Found'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please copy this information and send it manually to:',
                ),
                const SizedBox(height: 8),
                const SelectableText('koidioble@gmail.com'),
                const SizedBox(height: 16),
                const Text('Subject:'),
                SelectableText(subject),
                const SizedBox(height: 16),
                const Text('Message:'),
                SelectableText(body),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: lightOlive),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Send Me a Message", style: TextStyle(color: lightOlive)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            InkWell(
              hoverColor: lightOlive,
              onTap: () {},
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                ),
                elevation: 9.0,
                color: white,
                child: Container(
                  height: 699.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30.0),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  hoverColor: lightSeaGreen,
                                  focusColor: oliveDrab,
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      controller: _firstNameController,
                                      style: TextStyle(color: lightGreen100),
                                      decoration: InputDecoration(
                                        labelText: 'First Name',
                                        labelStyle: TextStyle(
                                          color: lightGreen100,
                                        ),
                                        filled: true,
                                        fillColor: midOlive,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            9.0,
                                          ),
                                          borderSide: BorderSide(
                                            color: lightGreen100,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            9.0,
                                          ),
                                          borderSide: BorderSide(
                                            color: lightGreen100,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            9.0,
                                          ),
                                          borderSide: BorderSide(
                                            color: lightOlive,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your first name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 9.0),
                              Expanded(
                                child: InkWell(
                                  hoverColor: lightSeaGreen,
                                  focusColor: oliveDrab,
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      controller: _lastNameController,
                                      style: TextStyle(color: lightGreen100),
                                      decoration: InputDecoration(
                                        labelText: 'Last Name',
                                        labelStyle: TextStyle(
                                          color: lightGreen100,
                                        ),
                                        filled: true,
                                        fillColor: midOlive,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            9.0,
                                          ),
                                          borderSide: BorderSide(
                                            color: lightGreen100,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            9.0,
                                          ),
                                          borderSide: BorderSide(
                                            color: lightGreen100,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            9.0,
                                          ),
                                          borderSide: BorderSide(
                                            color: lightOlive,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your last name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          InkWell(
                            hoverColor: lightSeaGreen,
                            focusColor: oliveDrab,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: TextFormField(
                                controller: _emailController,
                                style: TextStyle(color: lightGreen100),
                                decoration: InputDecoration(
                                  labelText: 'Email*',
                                  labelStyle: TextStyle(color: lightGreen100),
                                  filled: true,
                                  fillColor: midOlive,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(
                                      color: lightGreen100,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(
                                      color: lightGreen100,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(color: lightOlive),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  ).hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          InkWell(
                            hoverColor: lightSeaGreen,
                            focusColor: oliveDrab,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: TextFormField(
                                controller: _phoneController,
                                style: TextStyle(color: lightGreen100),
                                decoration: InputDecoration(
                                  labelText: 'Phone (optional)',
                                  labelStyle: TextStyle(color: lightGreen100),
                                  filled: true,
                                  fillColor: midOlive,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(
                                      color: lightGreen100,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(
                                      color: lightGreen100,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(color: lightOlive),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          InkWell(
                            hoverColor: lightSeaGreen,
                            focusColor: oliveDrab,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: TextFormField(
                                controller: _messageController,
                                style: TextStyle(color: lightGreen100),
                                decoration: InputDecoration(
                                  labelText: 'Message*',
                                  labelStyle: TextStyle(color: lightGreen100),
                                  filled: true,
                                  fillColor: midOlive,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(
                                      color: lightGreen100,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(
                                      color: lightGreen100,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                    borderSide: BorderSide(color: lightOlive),
                                  ),
                                  alignLabelWithHint: true,
                                ),
                                maxLines: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a message';
                                  }
                                  if (value.length < 10.0) {
                                    return 'Message should be at least 10 characters';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 23.0),
                          ElevatedButton(
                            onPressed: _sendEmail,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: oliveDrab,
                              minimumSize: const Size(double.infinity, 60.0),
                            ),
                            child: Text(
                              'Send Message',
                              style: TextStyle(color: white, fontSize: 19.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const MySignature(),
          ],
        ),
      ),
    );
  }
}
