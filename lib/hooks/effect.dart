import 'package:flutter_hooks/flutter_hooks.dart';

void useEffectOnce(void Function() effect) => useEffect(() {
      effect();

      return () => {};
    }, []);
