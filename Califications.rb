require "mysql2"
# Incorrect MySQL client library version! This gem was compiled for 10.8.8 but the client library is 3.3.8

connect = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "", :database => "ruby_school")
result = connect.query("SELECT * FROM students")
result.each {  |x| puts x }