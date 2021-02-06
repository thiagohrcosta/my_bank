require_relative "client"

array_of_clients = []

puts "|==================================================================|"
puts "| Welcome to Le Wagon's Bank.                                      |"
puts "| Please insert your client code:                                  |"
puts "| [VIP account beggining with 0] [Normal Account beggining with 1] |"
puts "|==================================================================|"

client_typed_code = gets.chomp

if client_typed_code.match(/^0\d{2}\w*/)
  puts "Welcome VIP CLIENT"

  puts 'Please insert your name:'
  client_name = gets.chomp

  puts 'How much for your first deposit?'
  client_first_deposit = gets.chomp.to_i

  puts 'Now please set your password:'
  client_password = gets.chomp

  generic_credit_card = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '5', '5', '4', '4'].shuffle.join()

  puts "You received the #{generic_credit_card} as your credit card number. Store it in a safe place."

  new_client = VipClient.new(
    client_code: client_typed_code,
    name: client_name,
    balance: client_first_deposit,
    password: client_password,
    credit_card_number: generic_credit_card,
    super_limit: 2000
  )

  array_of_clients << new_client

  p array_of_clients


  puts "|==================================================================|"
  puts "| What would you like to do now #{new_client.name}"
  puts "| [1] Deposit | [2] Withdraw | [3] Balance and Card | [4] Exit     | "
  puts "|==================================================================|"

  client_choice = gets.chomp.to_i

  while client_choice != 4
    case client_choice
    when 1

      puts "How much would you like to deposit?"
      amount = gets.chomp.to_i
      new_client.deposit(amount)

      p array_of_clients

      puts "|==================================================================|"
      puts "| What would you like to do now #{new_client.name}"
      puts "| [1] Deposit | [2] Withdraw | [3] Balance and Card | [4] Exit     | "
      puts "|==================================================================|"
      client_choice = gets.chomp.to_i
    when 2

      puts "How much would you like to withdraw?"
      amount = gets.chomp.to_i
      new_client.withdraw(amount)

      p array_of_clients


      puts "|==================================================================|"
      puts "| What would you like to do now #{new_client.name}"
      puts "| [1] Deposit | [2] Withdraw | [3] Balance and Card | [4] Exit     | "
      puts "|==================================================================|"
      client_choice = gets.chomp.to_i
    when 3
      puts "|==================================================================|"
      puts "Your balance is : $ #{new_client.balance}"
      puts "Your Super Limit is : $ #{new_client.super_limit} "
      puts "Your credit card number is #{new_client.credit_card_number}"

      puts "|==================================================================|"
      puts "| What would you like to do now #{new_client.name}"
      puts "| [1] Deposit | [2] Withdraw | [3] Balance and Card | [4] Exit     | "
      puts "|==================================================================|"
      client_choice = gets.chomp.to_i
    else
      break
    end
  end

else
  puts "No normal accounts allowed at moment."
end


# puts "What do you whant to do now? [1] Deposit [2] Withdraw [3] Check my balance [4] See Credit card number [5] Exit"

# client_choice = gets.chomp.to_i

# while client_choice != 5
#   if client_choice == 1
#     puts "How  much you would like to deposit #{client_name}"
#     amount = gets.chomp.to_i
#     deposit(amount)
#   elsif client_choice == 2
#     puts "How much you would like to withdraw #{client_name}"
#     amount = gets.chomp.to_i

#     if amount > @balance
#       puts "You don't have this much to withdraw"
#     else
#       withdraw(amount)
#     end

#   else
#     puts "Erro"
#   end

# end
