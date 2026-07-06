import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Day123AutofillGroup extends StatefulWidget {
  const Day123AutofillGroup({super.key});

  @override
  State<Day123AutofillGroup> createState() => _Day123AutofillGroupState();
}

class _Day123AutofillGroupState extends State<Day123AutofillGroup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Tells the OS "this autofill session is done" — so the password
    // manager knows to offer saving these credentials.
    TextInput.finishAutofillContext();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Logged in! (demo only)")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 123 - AutofillGroup')),
      // SingleChildScrollView lets this screen scroll instead of
      // overflowing when the keyboard opens and shrinks the screen.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Info Card ──────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                '🔐 AutofillGroup tells the device "these fields belong to one '
                'form" — so the OS keyboard and password manager can '
                'suggest saved emails and passwords automatically.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── Login Form ───────────────────────────────────────────
            // Wrapping related fields in AutofillGroup lets the OS treat
            // them as one login form instead of unrelated text fields.
            AutofillGroup(
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // This hint tells the OS "this field expects an email".
                    autofillHints: const [AutofillHints.email],
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _login(),
                    // This hint tells the OS "this field expects a password",
                    // which is what triggers the password manager popup.
                    autofillHints: const [AutofillHints.password],
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Log In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),

            _tipRow(
              Icons.smartphone_outlined,
              "On a real device, your keyboard will now suggest saved "
              "emails and offer to save this password.",
            ),

            // Fixed spacing instead of Spacer(), since Spacer() can't be
            // used inside a scrollable Column (unbounded height).
            const SizedBox(height: 24),

            const Text(
              "Tip: autofillHints only trigger real suggestions on physical\n"
              "devices with saved credentials — not always in emulators.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black45,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _tipRow(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6366F1), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
