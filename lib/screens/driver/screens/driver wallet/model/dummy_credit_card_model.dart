class CreditCard {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  CreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });
}

List<CreditCard> creditCards = [
  CreditCard(
    cardNumber: '4111 1111 1111 1111',
    expiryDate: '04/26',
    cardHolderName: 'John Doe',
    cvvCode: '123',
  ),
  CreditCard(
    cardNumber: '5500 0000 0000 0004',
    expiryDate: '12/25',
    cardHolderName: 'Alice Smith',
    cvvCode: '456',
  ),
  CreditCard(
    cardNumber: '5500 0000 0000 0004',
    expiryDate: '12/25',
    cardHolderName: 'Alice Smith',
    cvvCode: '456',
  ),
  CreditCard(
    cardNumber: '5500 0000 0000 0004',
    expiryDate: '12/25',
    cardHolderName: 'Alice Smith',
    cvvCode: '456',
  ),
];
