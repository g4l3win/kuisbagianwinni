class QuizData {
  // Data untuk Pilihan Ganda
  static Map<String, List<int>> pilihanGandaData = {
    'Kuis 1': [0, 3, 2, 5],
    'Kuis 2': [0, 0, 5, 5],
    'Kuis 3': [2, 1, 1, 6],
  };

  // Data untuk Soal Isian
  static Map<String, List<int>> isianData = {
    'Kuis 1': [1, 2, 4, 3],
    'Kuis 2': [2, 3, 1, 4],
    'Kuis 3': [0, 1, 5, 4],
  };

  // Data untuk Benar/Salah
  static Map<String, List<int>> benarSalahData = {
    'Kuis 1': [2, 4, 2, 2],
    'Kuis 2': [3, 3, 2, 2],
    'Kuis 3': [1, 1, 4, 4],
  };
}
