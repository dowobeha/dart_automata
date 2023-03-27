// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}


class LogProb {
  final double value;

  LogProb(this.value);

  static final additive_identity = LogProb(0.0);  // zero
  static final multiplicative_identity = LogProb(-1.0 / 0.0); // -inf

  LogProb.probabilityOne() : value = 0.0;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is LogProb && this.value == other.value;
  }

  @override
  int get hashCode => this.value.hashCode;
  
  LogProb operator +(LogProb other) {
    if (this.value >= other.value) {
      return LogProb(this.value);
    } else {
      return LogProb(other.value);
    }
  }

  LogProb operator *(LogProb other) {
    return LogProb(this.value + other.value);
  }

  String toString() {
    return this.value.toString();
  }
  
}

class Label {

  final List<String> value;

  final LogProb logProb;

  Label(this.value, this.logProb);

}



/*
class State {
  
}

class Label {
  final List<String> value;

  Label(this.value);

  Label.fromInput(String inputWord) : value = [inputWord];

  Label.fromPair(String inputWord, String outputWord) : value = [inputWord, outputWord];
}


class Transition {

  final Label label;
  final LogProb weight;
  final State target;
  
  Transition(this.label, this.weight, this.target);
}

class FST {

}
*/
