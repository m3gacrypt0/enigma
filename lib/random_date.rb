class RandomDate

def initialize(date_supplied)

end

def self.generate(date_supplied)
  random_date = RandomDate.new(date_supplied)
  return Date.today.strftime('%d%m%y') unless date_supplied
  (Time.at(rand * Time.now.to_i)).to_date.strftime('%d%m%y')
end

end
