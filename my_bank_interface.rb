require_relative "client"

array_of_clients = []


puts "Welcome to Le Wagon's Bank."
puts 'Please insert your client code:'

client_typed_code = gets.chomp

if client_typed_code.match(/^0\d{2}/)
  puts "Welcome VIP CLIENT"

  puts 'Please insert your name:'
  client_name = gets.chomp

  puts 'How much for your first deposit?'
  client_first_deposit = gets.chomp.to_i

  puts 'Now please set your password:'
  client_password = gets.chomp

  generic_credit_card = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '5', '5', '4', '4'].shuffle.join()

  puts "You receive the #{generic_credit_card} as your credit card number. Store it in a safe place."

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

else
  puts 'Please insert your name:'
  client_name = gets.chomp

  puts 'How much for your first deposit?'
  client_first_deposit = gets.chomp.to_i

  puts 'Now please set your password:'
  client_password = gets.chomp

  generic_credit_card = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '5', '5', '4', '4'].shuffle.join()

  puts "You receive the #{generic_credit_card} as your credit card number. Store it in a safe place."
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
