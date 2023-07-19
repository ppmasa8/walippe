class DivideAmount {
  int calculateAmountPerPerson(int amount, int numberOfPayees) {
    return (amount / numberOfPayees).ceil();
  }
}