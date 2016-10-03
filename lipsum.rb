#!/usr/bin/env ruby
require 'erb'
require 'shellwords'

lipsum_wanted = ARGV[0].to_s.downcase
number_wanted = ARGV[1].to_i

puts ARGV.inspect
puts lipsum_wanted.inspect
puts number_wanted.inspect

if number_wanted == 0
  number_wanted = 1
end

case lipsum_wanted
  when "slipsum"
    output = "Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass."
  when "hipsum"
    output = "Meditation offal iceland activated charcoal, franzen mumblecore artisan tbh brunch next level la croix letterpress cliche post-ironic knausgaard. Narwhal humblebrag cold-pressed chillwave air plant. Unicorn squid beard, plaid iPhone dreamcatcher fanny pack knausgaard gastropub. Helvetica tote bag hella coloring book single-origin coffee. Cold-pressed post-ironic unicorn kombucha paleo tilde. Thundercats chambray small batch, try-hard affogato vaporware hexagon. Enamel pin af banjo unicorn narwhal."
  when "fillerama"
    output = "I haven't felt much of anything since my guinea pig died. Uh, is the puppy mechanical in any way? Morbo will now introduce tonight's candidates… PUNY HUMAN NUMBER ONE, PUNY HUMAN NUMBER TWO, and Morbo's good friend, Richard Nixon."
  else
    puts "That's not an Ipsum I know. I can make 3 types: For Samuel L. Jackson, use \"slipsum\". For Hipster-ese, use \"hipsum\". For Futurama, use \"fillerama\". Tell me what kind of filler text you need, followed by the number of paragraphs. For example, \"slipsum 2\" will get you 2 paragraphs of Samuel L. Jackson."
end

if output
system ("echo #{(output * number_wanted).shellescape} | pbcopy")
new_file = File.open("./#{lipsum_wanted}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
end
