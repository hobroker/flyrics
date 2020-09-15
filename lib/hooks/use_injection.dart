import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jab/jab.dart';

T useInjection<T>() => Jab.get<T>(useContext());
