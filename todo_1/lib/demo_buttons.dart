import 'package:flutter/cupertino.dart';

class DemoButtons extends StatefulWidget {
  @override
  State<DemoButtons> createState() {
    return _DemobuttonsState();
  }
}

  class _DemobuttonsState extends State<DemoButtons>{
    @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = false;
                    });
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = true;
                    });
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
            if (_isUnderstood) const Text('Awesome!'),],
    ):
  }
}
