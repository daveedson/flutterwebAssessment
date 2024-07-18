// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transaction {
  final String transactionDate;
  final String description;
  final String amount;
  final String type;
  final String balance;

  Transaction({
    required this.transactionDate,
    required this.description,
    required this.amount,
    required this.type,
    required this.balance,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionDate: json['Transaction Date'],
      description: json['Description'],
      amount: json['Amount'],
      type: json['Type'],
      balance: json['Balance'],
    );
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;
  
    return 
      other.transactionDate == transactionDate &&
      other.description == description &&
      other.amount == amount &&
      other.type == type &&
      other.balance == balance;
  }

  @override
  int get hashCode {
    return transactionDate.hashCode ^
      description.hashCode ^
      amount.hashCode ^
      type.hashCode ^
      balance.hashCode;
  }

  @override
  String toString() {
    return 'Transaction(transactionDate: $transactionDate, description: $description, amount: $amount, type: $type, balance: $balance)';
  }
}
