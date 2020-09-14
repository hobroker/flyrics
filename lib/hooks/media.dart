import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

MediaQueryData useMediaQuery() => MediaQuery.of(useContext());

Size useMediaSize() => useMediaQuery().size;
