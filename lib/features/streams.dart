import 'dart:async';

class myStream {
  late String url = '';

  set urls(String urlImage) {
    url = urlImage;
    _controller.add(url);
  }

  final StreamController<String> _controller = StreamController.broadcast();

  Stream<String> get strims => _controller.stream;
}

class myStreamAnim {
  late double count = 0;

  set counts(double cou) {
    count = cou;
    _controller.add(count);
  }

  final StreamController<double> _controller = StreamController.broadcast();

  Stream<double> get strims => _controller.stream;
}
