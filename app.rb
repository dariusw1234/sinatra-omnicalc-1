require "sinatra"
require "sinatra/reloader"

#Square
get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @number = params.fetch("number").to_f
  @calc = @number * @number
  @result = @calc.to_f
  erb(:square_results)
end

#Square Root
get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @number = params.fetch("number").to_f
  @result = Math.sqrt(@number)
  erb(:square_root_results)
end

#Payment
get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @r = @apr / 100 / 12
  @years = params.fetch("years").to_i
  @n = @years * 12
  @principal = params.fetch("principal").to_f

  @numerator = @r * @principal
  @denominator = 1 - (1 + @r) ** -@n

  @result = @numerator / @denominator
  erb(:payment_results)
end

#Random
get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @range = rand(@min..@max)
  erb(:random_results)
end
