import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/modules/injection.dart';

T useInjection<T>() => Injection.get<T>(useContext());
