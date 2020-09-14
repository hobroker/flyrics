import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/modules/provider/injection.dart';

T useInjection<T>() => Provider.get<T>(useContext());
