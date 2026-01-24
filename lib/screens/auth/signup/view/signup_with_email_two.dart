import 'package:flutter/material.dart';
import 'package:rishta_app/api_services/api_services.dart';
import '../../../../api_services/token_services.dart';
import '../../../../model/user_model.dart';
import '../../../home/home_page.dart';
import 'signup_controller.dart';

class SignUpStep2 extends StatefulWidget {
  final SignupController controller;

  const SignUpStep2({super.key, required this.controller});

  @override
  State<SignUpStep2> createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  final _formKey = GlobalKey<FormState>();
  final Color primaryColor = Colors.red.shade900;
  bool _loading = false;

  final List<String> genders = ["Male", "Female"];
  final List<String> religions = ["Islam", "Hindu", "Christian", "Other"];
  final List<String> communities = ["Community A", "Community B"];
  final List<String> livingIn = ["City A", "City B", "City C"];

  final _api = ApiServices();
  final _tokenService = TokenService();

  @override
  void initState() {
    super.initState();
    widget.controller.mobile.addListener(() => setState(() {}));
  }

  InputDecoration _dropdownDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor, width: 1.5),
      ),
    );
  }

  bool get isFormValid {
    final c = widget.controller;
    return c.gender != null &&
        c.religion != null &&
        c.community != null &&
        c.livingIn != null &&
        c.mobile.text.trim().length >= 10;
  }

  /// ✅ Register user and save in DB
  /// ✅ Register user and save in DB (without UserModel.fromController)
  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final res = await _api.register(
        name: widget.controller.firstName.text.trim(),
        email: widget.controller.email.text.trim(),
        password: widget.controller.password.text,
        gender: widget.controller.gender,
        religion: widget.controller.religion,
        community: widget.controller.community,
        livingIn: widget.controller.livingIn,
        mobile: widget.controller.mobile.text.trim(),
      );

      if (res?['success'] == true) {
        // Save token
        await _tokenService.saveToken(res?['token']);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Welcome, ${widget.controller.firstName.text}!'),
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res?['message'] ?? 'Registration failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: primaryColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Profile Details",
            style: TextStyle(
              color: primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              onChanged: () => setState(() {}),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _customDropdown(
                    label: "Gender",
                    hint: "Select Gender",
                    value: widget.controller.gender,
                    items: genders,
                    onChanged: (v) {
                      setState(() => widget.controller.gender = v);
                      debugPrint("Selected Gender: $v");
                    },
                  ),
                  const SizedBox(height: 20),
                  _customDropdown(
                    label: "Religion",
                    hint: "Select Religion",
                    value: widget.controller.religion,
                    items: religions,
                    onChanged: (v) {
                      setState(() => widget.controller.religion = v);
                      debugPrint("Selected Religion: $v");
                    },
                  ),
                  const SizedBox(height: 20),
                  _customDropdown(
                    label: "Community",
                    hint: "Select Community",
                    value: widget.controller.community,
                    items: communities,
                    onChanged: (v) {
                      setState(() => widget.controller.community = v);
                      debugPrint("Selected Community: $v");
                    },
                  ),
                  const SizedBox(height: 20),
                  _customDropdown(
                    label: "Living In",
                    hint: "Select City",
                    value: widget.controller.livingIn,
                    items: livingIn,
                    onChanged: (v) {
                      setState(() => widget.controller.livingIn = v);
                      debugPrint("Selected Living In: $v");
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Mobile",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: widget.controller.mobile,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.phone,
                    decoration: _dropdownDecoration("Mobile Number"),
                    onChanged: (v) {
                      debugPrint("Selected Gender: $v");
                    },
                    validator: (v) =>
                        v == null || v.length < 10 ? "Invalid number" : null,
                  ),
                  const SizedBox(height: 90),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isFormValid && !_loading ? _register : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFormValid
                            ? primaryColor
                            : Colors.grey.shade400,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: _loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customDropdown({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: _dropdownDecoration(hint),
          icon: Icon(Icons.keyboard_arrow_down, color: primaryColor),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          validator: (v) => v == null ? "Required" : null,
        ),
      ],
    );
  }
}
