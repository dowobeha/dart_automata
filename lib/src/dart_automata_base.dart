// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

/// Log probability using the tropical semiring
class LogProb {

  /// Log probability value in the range \[-∞, 0.0\]
  final double value;

  /// Constructs a log probability from the provided floating point value.
  /// If the provided [value] is positive, the resuting [LogProb.value] will be [NaN].
  LogProb(double value) : value = (value > 0.0) ? NaN.value : value;

  /// Tropical semiring additive identity is `0.0`
  static final additive_identity = LogProb(0.0);

  /// Tropical semiring multiplicative identity is `-∞`
  static final multiplicative_identity = LogProb(-1.0 / 0.0);

  /// Not a number. If a positive number is provided to the [LogProb()] constructor, this is the resulting value.
  static final NaN = LogProb(0.0 / 0.0);
  
  /// Constructs a log probability equivalent to the probability `1.0`
  LogProb.probabilityOne() : value = 0.0;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is LogProb && this.value == other.value;
  }

  @override
  int get hashCode => this.value.hashCode;

  /// Returns the result of performing tropical addition,
  ///   which is `max()`
  LogProb operator +(LogProb other) {
    if (this.isNaN || other.isNaN) {
      return LogProb(NaN.value);
    } else if (this.value >= other.value) {
      return LogProb(this.value);
    } else {
      return LogProb(other.value);
    }
  }

  /// Returns the result of performing tropical multiplication,
  ///   which is floating point addition.
  LogProb operator *(LogProb other) {
    return LogProb(this.value + other.value);
  }

  /// Whether the [LogProb.value] is not a number
  bool get isNaN => this.value.isNaN;

  
  String toString() {
    if (this.value == LogProb.multiplicative_identity.value) {
      return "-∞";
    } else {
      return this.value.toString();
    }
  }
  
}

class Arc {

  final List<String> label;

  final LogProb logProb;

  Arc(this.label, this.logProb);

  Arc.acceptorArc(String label, [double? logProb])
  : label = [label]
  , logProb = (logProb == null) ? LogProb.probabilityOne() : LogProb(logProb!);
  
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
