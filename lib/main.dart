import 'package:flutter/material.dart';
import 'package:prodel_shop/ui/screen/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://pprklkrcyqnhjrukxuhq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBwcmtsa3JjeXFuaGpydWt4dWhxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzg3OTI0MDUsImV4cCI6MTk5NDM2ODQwNX0.Atb5wiUHyOmXWaLSbhPcpfMRxY1AKI4mhuClGy2rYao',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PRODEL Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
