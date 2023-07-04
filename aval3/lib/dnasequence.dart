class DNASequence {
  final String sequence;

  DNASequence._(this.sequence);

  static int _getRandomInt(int max) {
    return DateTime.now().microsecondsSinceEpoch % max;
  }

  static bool _isValidNucleotide(String nucleotide) {
    return ['A', 'T', 'C', 'G'].contains(nucleotide);
  }

  DNASequence.normal({required this.sequence}) {
    if (!_isValidNucleotide(sequence)) {
      throw ArgumentError('invalid nucleotide : $sequence');
    }
  }

  factory DNASequence.random(int lenght) {
    String nucleotides = 'ATCG';

    String randomSequence = '';
    for (int i = 0; i < lenght; i++) {
      int randomIndex = _getRandomInt(nucleotides.length);
      randomSequence += nucleotides[randomIndex];
    }
    return DNASequence._(randomSequence);
  }

  @override
  String toString() {
    return sequence;
  }

  DNASequence get reversed {
    String reversedSequence = sequence.split('').reversed.join();
    return DNASequence._(reversedSequence);
  }

  DNASequence get complement {
    Map<String, String> complementMap = {
      'A': 'T',
      'T': 'A',
      'C': 'G',
      'G': 'C'
    };
    String complementSequence = '';
    for (String char in sequence.split('')) {
      complementSequence += complementMap[char]!;
    }
    return DNASequence._(complementSequence);
  }

  int countNucleotide(String nucleotide) {
    if (nucleotide.length != 1 || !_isValidNucleotide(nucleotide)) {
      throw ArgumentError('invalid nucleotide : $nucleotide');
    }

    return sequence.split(nucleotide).length - 1;
  }
}
