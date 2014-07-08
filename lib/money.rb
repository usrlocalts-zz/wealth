#Models money in rupees and paise
class Money
  attr_reader :value

  include Comparable

  def initialize money_rupee, money_paise

    @value = money_rupee*100 + money_paise

  end

  def == money

     return true if self.object_id == money.object_id
     return false if money.nil?
     return false if self.class != money.class
     @value == money.value
  end

  def hash
    37 * @value.hash
  end

  def eql? other
    self == other
  end

  def + money
    amount = @value + money.value
    rupee, paise = denomination amount
    Money.new(rupee, paise)
  end

  def - money
    amount = @value - money.value
    rupee, paise = denomination amount
    Money.new(rupee, paise)
  end

  def to_s
    rupee, paise = denomination @value
    "#{rupee} Rs. #{paise} p."
  end

  def <=> other
    return nil if other.class != self.class
    @value <=> other.value
  end


  private
  def denomination amount
    [amount/100,  amount%100]
  end


end