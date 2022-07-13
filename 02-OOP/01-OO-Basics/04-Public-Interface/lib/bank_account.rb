# This is how you define your own custom exception classes
require_relative "transaction"
class DepositError < StandardError
end

class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  attr_reader :name, :balance

  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)

  MIN_DEPOSIT = 100

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    add_transaction(-amount)
    return "You've withdrawed #{amount}"
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
  end

  def deposit(amount)
    add_transaction(amount)
    return "You've deposit #{amount}"
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
  end

  def transactions_history(args = {})
    if args.empty?
      "no password given"
    elsif args[:password] == @password
      @transactions.join(", ")
    else
      "wrong password"
    end
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    @iban.gsub(/(-\w{4}){5}-/, "*")
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    return "Owner: #{@name} - IBAN: #{iban} - Balance: #{@balance} euros"
    # =>  Owner: John Lennon - IBAN: FR14**************606 - Balance: 200 euros
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
  end

  private

  def add_transaction(amount)
    @transactions << Transaction.new(amount)
    @balance += amount
    # TODO: add the amount in the transactions array
    # TODO: update the current balance (which represents the balance of the account)
  end
end
