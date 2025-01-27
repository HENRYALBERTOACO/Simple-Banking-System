-- Simple Banking System

-- Table to hold all the accounts
local accounts = {}

-- Function to create a new account
function create_account(name)
    if accounts[name] then
        print("Account already exists for " .. name)
    else
        accounts[name] = {
            balance = 0,
            transactions = {}
        }
        print("Account created for " .. name)
    end
end

-- Function to deposit money into an account
function deposit(name, amount)
    if accounts[name] then
        if amount > 0 then
            accounts[name].balance = accounts[name].balance + amount
            table.insert(accounts[name].transactions, "Deposited $" .. amount)
            print("Deposited $" .. amount .. " to " .. name .. "'s account.")
        else
            print("Amount must be greater than zero.")
        end
    else
        print("Account does not exist.")
    end
end

-- Function to withdraw money from an account
function withdraw(name, amount)
    if accounts[name] then
        if amount <= accounts[name].balance and amount > 0 then
            accounts[name].balance = accounts[name].balance - amount
            table.insert(accounts[name].transactions, "Withdrew $" .. amount)
            print("Withdrew $" .. amount .. " from " .. name .. "'s account.")
        elseif amount > accounts[name].balance then
            print("Insufficient funds.")
        else
            print("Amount must be greater than zero.")
        end
    else
        print("Account does not exist.")
    end
end

-- Function to check the balance of an account
function check_balance(name)
    if accounts[name] then
        print(name .. "'s balance: $" .. accounts[name].balance)
    else
        print("Account does not exist.")
    end
end

-- Function to view account transaction history
function view_transactions(name)
    if accounts[name] then
        print(name .. "'s transaction history:")
        for i, transaction in ipairs(accounts[name].transactions) do
            print(i .. ". " .. transaction)
        end
    else
        print("Account does not exist.")
    end
end

-- Main program loop
while true do
    print("Welcome to the Simple Banking System!")
    print("Choose an option:")
    print("1. Create Account")
    print("2. Deposit Money")
    print("3. Withdraw Money")
    print("4. Check Balance")
    print("5. View Transactions")
    print("6. Exit")
    local choice = tonumber(io.read())

    if choice == 1 then
        print("Enter the name for the new account:")
        local name = io.read()
        create_account(name)
    elseif choice == 2 then
        print("Enter account name:")
        local name = io.read()
        print("Enter amount to deposit:")
        local amount = tonumber(io.read())
        deposit(name, amount)
    elseif choice == 3 then
        print("Enter account name:")
        local name = io.read()
        print("Enter amount to withdraw:")
        local amount = tonumber(io.read())
        withdraw(name, amount)
    elseif choice == 4 then
        print("Enter account name:")
        local name = io.read()
        check_balance(name)
    elseif choice == 5 then
        print("Enter account name:")
        local name = io.read()
        view_transactions(name)
    elseif choice == 6 then
        print("Thank you for using the Simple Banking System. Goodbye!")
        break
    else
        print("Invalid option. Please try again.")
    end
end
