require 'csv'
require "csv_coordinate_accessor/version"

module CSVCoordinateAccessor
  CODES = ('A'..'Z')
  CODES_SIZE = CODES.to_a.size

  def get(cord)
    r,c = cord2index(cord)
    self[r][c]
  end

  def set(cord,value)
    r,c = cord2index(cord)
    self[r][c] = value.to_s
    value.to_s
  end

  def cord2index(cord)
    m = cord.match(/(?<codes>[A-Za-z]+)(?<nums>\d+)/) \
        || cord.match(/(?<nums>\d+)(?<codes>[A-Za-z]+)/)

    raise ArgumentError, "#{cord} is invalid" unless m

    p m

    r = m['nums'].to_i - 1
    c = code2index(m['codes'])
    [r, c]
  end

  private

  def index2code(n)
    num = n
    chars = []
    codes = CODES.to_a

    begin
      num -= 1 unless n == num
      chars << codes[num % CODES_SIZE]
      num = num / CODES_SIZE
    end while num > 0

    chars.reverse.join
  end

  def code2index(code)
    chars = code.upcase.split('')
    num = 0
    chars.each.with_index do |c, i|
      n = c.ord - CODES.first.ord
      n += 1 if i < code.length - 1
      num = num * CODES_SIZE + n
    end
    num
  end
end

