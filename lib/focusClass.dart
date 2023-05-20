class FocusClass {
  int? indexBox;
  int? indexChar;
  static int cmop = 0;

  static void cmop1() {
    cmop = 20;
  }

  static void cmop2() {
    cmop = 30;
  }

  static void cmop3() {
    cmop = 40;
  }

  setData(int indexBox, int indexChar) {
    this.indexBox = indexBox;
    this.indexChar = indexChar;
  }

  focusOn(int indexBox, int indexChar) {
    return this.indexBox == indexBox && this.indexChar == indexChar;
  }
}
