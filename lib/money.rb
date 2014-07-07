#Models money in rupees and paise
class Money
  attr_reader :rupee

  def initialize money_rupee, money_paise
    
    if money_rupee < 0
      money_paise *= -1
    end
    @rupee = money_rupee*100 + money_paise

  end

  def == money

    return true if self.object_id == money.object_id
    return false if money.nil?
    return false if self.class != money.class
    @rupee == money.rupee

  end

  def hash
    37 * @rupee.hash
  end

  def eql? other
    self == other
  end

  def + money
    amount = @rupee + money.rupee
    amount_rupee = @rupee%100
    amount_paise = amount - amount_rupee*100
    Money.new(amount_rupee, amount_paise)
  end

  def - money
    amount = @rupee - money.rupee
    amount_rupee = @rupee%100
    amount_paise = amount - amount_rupee*100
    Money.new(amount_rupee, amount_paise)
  end

end