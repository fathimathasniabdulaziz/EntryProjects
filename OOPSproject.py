class Account:
    def __init__(self, account_number, name, balance, pin):
        self.account_number = account_number
        self.name = name
        self.balance = balance
        self.pin = pin
    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            return f"Deposited ${amount}. Updated balance: ${self.balance}"
        else:
            return "Invalid deposit amount."
    def withdraw(self, amount):
        if amount > 0 and amount <= self.balance:
            self.balance -= amount
            return f"Withdrew ${amount}. Updated balance: ${self.balance}"
        elif amount > self.balance:
            return "Insufficient balance."
        else:
            return "Invalid withdrawal amount."

    def __str__(self):
        return f"Account Number: {self.account_number}, Name: {self.name}, Balance: ${self.balance}"

class Bank:
    def __init__(self):
        self.accounts = {}

    def create_account(self, account_number, name, balance, pin):
        if account_number not in self.accounts:
            account = Account(account_number, name, balance, pin)
            self.accounts[account_number] = account
            return f"Account created successfully: {account}"
        else:
            return "Account with the same account number already exists."

    def authenticate(self, account_number, pin):
        if account_number in self.accounts:
            account = self.accounts[account_number]
            return account.pin == pin
        else:
            return False


def main():
    bank = Bank()

    while True:
        print("\nBanking System Menu:")
        print("1. Create Account")
        print("2. Login")
        print("3. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            account_number = input("Enter your account number: ")
            name = input("Enter your name: ")
            balance = float(input("Enter initial balance: "))
            pin = input("Enter PIN: ")

            result = bank.create_account(account_number, name, balance, pin)
            print(result)
        elif choice == '2':
            account_number = input("Enter your account number: ")
            pin = input("Enter your PIN: ")

            if bank.authenticate(account_number, pin):
                account = bank.accounts[account_number]
                print(f"Login successful! {account}")

                while True:
                    print("Account Menu:")
                    print("1. Deposit Money")
                    print("2. Withdraw Money")
                    print("3. Logout")

                    account_choice = input("Enter your choice: ")

                    if account_choice == '1':
                        amount = float(input("Enter the amount to deposit: "))
                        result = account.deposit(amount)
                        print(result)
                    elif account_choice == '2':
                        amount = float(input("Enter the amount to withdraw: "))
                        result = account.withdraw(amount)
                        print(result)
                    elif account_choice == '3':
                        print("Logged out.")
                        break
                    else:
                        print("Invalid choice. Please try again.")
            else:
                print("Login failed. Invalid account number or PIN.")
        elif choice == '3':
            print("Thank you for using the banking system.")
            break
        else:
            print("Invalid choice. Please try again.")


if __name__ == '__main__':
    main()
    class Account:
        def __init__(self,account_number,name,balance,pin):
            self.account_number=account_number
            self.name=name
            self.balance=balance
            self.name=name
            self.pin=pin

    def deposit(self,amount):
        if amount>0:
            self.balance += amount
            return f"deposited amount : {amount} and tbalance is {self.balance}"
        else:
            print("Invalid amount")

    def withdrawl(self,amount):
        if amount>0 and amount<=self.balance:
            self.balance -= amount
        elif amount>self.balance:
            return "Insufficient balance"
        else:
            return "Invalid withdrawl amount"





        