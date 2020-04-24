#!/usr/bin/env ruby
#### Script to add or multiply complex numbers

class ComplexNumber

	attr_reader :real, :imag

	@@counts = {
		"add_count" => 0,
		"mult_count" => 0,
		"bulk_add_count" => 0,
		"bulk_mult_count" => 0
	}

	def initialize(real, imag)
		@real = real
		@imag = imag
	end

	def +(cn)
		real_sum = self.real + cn.real
		imag_sum = self.imag + cn.imag
		@@counts["add_count"] += 1
		# puts "(#{self.real} + #{self.imag}i) + (#{cn.real} + #{cn.imag}i) = #{real_sum} + #{imag_sum}i"
		return ComplexNumber.new(real_sum, imag_sum)
	end

	def *(cn)
		real_mult = (self.real * cn.real) - (self.imag * cn.imag)
		imag_mult = (self.real * cn.imag) + (self.imag * cn.real)
		@@counts["mult_count"] += 1
		# puts "(#{self.real} + #{self.imag}i) * (#{cn.real} + #{cn.imag}i) = #{real_mult} + #{imag_mult}i"

		return ComplexNumber.new(real_mult, imag_mult)
	end

	def self.bulk_add(cns)
		if not cns.empty?
			complex = cns[0]

			i = 1
			while i < cns.count
				complex += cns[i]
				i += 1
			end

			@@counts["bulk_add_count"] += 1

			puts "Bulk Add of your array is (#{complex.real} + #{complex.imag}i)"

			return complex
		else
			puts "Your array is empty"
		end
	end

	def self.bulk_multiply(cns)
		if not cns.empty?
			complex = cns[0]

			i = 1
			while i < cns.count
				complex *= cns[i]
				i += 1
			end

			@@counts["bulk_mult_count"] += 1

			puts "Bulk Add of your array is (#{complex.real} + #{complex.imag}i)"

			return complex
		else
			puts "Your array is empty"
		end
	end

	def to_s
		return "Your result is (#{self.real} + #{self.imag}i)"
	end

	def get_stats
		puts "You used multiply #{@@counts['mult_count']} times \nYou used add #{@@counts['add_count']} times\nYou used bulk add #{@@counts['bulk_add_count']} times\nYou used bulk multiply #{@@counts['bulk_mult_count']} times"
	end
end

complex = ComplexNumber.new(3, 2)
complex2 = ComplexNumber.new(1, 7)

complex_arr = [complex, complex2, complex]

add_complex = complex + complex2

puts add_complex.to_s

mult_complex = complex * complex2

puts mult_complex.to_s
ComplexNumber.bulk_add(complex_arr)
ComplexNumber.bulk_multiply(complex_arr)

complex.get_stats
