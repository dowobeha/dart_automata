// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}


class State {
  
}

class Label {
  final List<String> value;

  Label(this.value);

  Label.fromInput(String inputWord) : value = [inputWord];

  Label.fromPair(String inputWord, String outputWord) : value = [inputWord, outputWord];
}

class LogProbability {
  final double value;

  LogProbability(this.value);

  static final multiplicative_identity = LogProbability(0.0);  // zero
  static final additive_identity = LogProbability(-1.0 / 0.0); // -inf

  LogProbability.probabilityOne() : value = 0.0;
  
  LogProbability operator +(LogProbability other) {
    if (this.value >= other.value) {
      return LogProbability(this.value);
    } else {
      return LogProbability(other.value);
    }
  }

  LogProbability operator *(LogProbability other) {
    return LogProbability(this.value + other.value);
  }
}

class Transition {

  final Label label;
  final LogProbability weight;
  final State target;
  
  Transition(this.label, this.weight, this.target);
}

class FST {

}
