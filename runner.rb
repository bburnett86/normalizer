# ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin16]

require_relative 'car'

# Return normalized data using the car class.
def normalize_data(input)
  c = Car.new(input[:year], input[:make], input[:model], input[:trim])
  c.normalize_data
end

examples = [
  [{ :year => '2018', :make => 'fo', :model => 'focus', :trim => 'blank' },
   { :year => 2018, :make => 'Ford', :model => 'Focus', :trim => nil }],
  [{ :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' },
   { :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' }],
  [{ :year => '2019', :make => 'Chev', :model => 'IMPALA', :trim => 'st' },
   { :year => 2019, :make => 'Chevrolet', :model => 'Impala', :trim => 'ST' }],
  [{ :year => '2000', :make => 'ford', :model => 'focus se', :trim => '' },
   { :year => 2000, :make => 'Ford', :model => 'Focus', :trim => 'SE' }]
]

examples.each_with_index do |(input, expected_output), index|
  if (output = normalize_data(input)) == expected_output
    puts "Example #{index + 1} passed!"
  else
    puts "Example #{index + 1} failed,
          Expected: #{expected_output.inspect}
          Got:      #{output.inspect}"
  end
end