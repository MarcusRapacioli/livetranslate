arr = ("A".."X").to_a

val = [8, 8, 8]
results = [];

val.each do |num|
  result = arr.slice(0, num)
  arr -= result
  results.push(result)
end

p results;
