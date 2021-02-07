class Client
  attr_reader :client_code, :name, :balance, :credit_card_number, :encripted_credit_card
  attr_accessor :deposit, :withdraw, :password

  # def initialize(client_code, name, balance, password, credit_card_number)
  #   @client_code = client_code
  #   @name = name
  #   @balance = balance
  #   @password = password
  #   @credit_card_number = credit_card_number
  # end

  def initialize(client_code, name, balance, password, credit_card_number)
    @client_code = client_code
    @name = name
    @balance = balance
    @password = password
    @credit_card_number = credit_card_number
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if amount < @balance
      @balance -= amount
    else
      "You don't have funds for that"
    end
  end

end

class VipClient < Client
  attr_reader :super_limit

  def initialize(args = {})
    super(
      args[:client_code],
      args[:name],
      args[:balance],
      args[:password],
      args[:credit_card_number]
      )
    # ou + @balance no lugar do args[:balance]
    @super_limit = args[:super_limit] + args[:balance]

  end

  def deposit(amount)
    @balance += amount
    @super_limit += amount
  end

  def withdraw(amount)
    if @balance < 0 && @super_limit <= 1000
      puts "Insuficient funds. You cant use your Super Limit if you have $ 1000 or less."
    elsif amount < @super_limit
      @balance -= amount
      @super_limit -= amount
    else
      "You don't have funds for that"
    end
  end

  # def encripted_credit_card(credit_card_number)
  #   credit_card_number.gsub(/\d{6}/, "*********" )
  # end

end

# p new_client = Client.new("001LeWagon", "John Doe", 1000, "123456", '4242-4242-4242-4242')

# puts new_client.balance
# puts new_client.deposit(300)
# puts new_client.client_code
# puts new_client.withdraw(4000)

# puts "======================="
# p new_vip_client = VipClient.new("002LeWagon", "Peyton Manning", 2000, "nfl123", '4545-4545-4545-4545', 1000)
# puts new_client.withdraw(2500)


