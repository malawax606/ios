import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl = 'https://intubuvndadrxutcpxnl.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImludHVidXZuZGFkcnh1dGNweG5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4ODAyNjcsImV4cCI6MjAxMDQ1NjI2N30.bFQEMlnOY848Q8ukX3ROsPX2wMIpDRSMOtDuCjITh3U';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
