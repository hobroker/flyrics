import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/utils/fp.dart';

void useEffectOnce(void Function() effect) {
  useEffect(() {
    effect();

    return noop;
  }, []);
}
