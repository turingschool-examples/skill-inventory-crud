TEST := test/features/*_test.rb test/models/*_test.rb

.PHONY : test

test :
	ruby -Itest -e 'ARGV.each { |f| require "./#{f}" }' $(TEST)
