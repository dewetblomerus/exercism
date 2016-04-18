class Prime
  def self.nth(n)
    raise ArgumentError if n == 0
    i = 1
    c = 0
    until c == n
      i += 1
      c += 1 if Prime.prime?(i)
    end
    i
  end

  def self.prime?(n)
    for i in 2..(n/2)
      return false if n % i == 0
    end
    true
  end
end
