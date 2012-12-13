#a and b are used to iterate through the columns properly.
a = b = 0

#For easy reference, DRY, etc.
col = 2
row = 7

define_grid(:columns => col, :rows => row, :gutter => 10)

if @attendees
	@attendees.each do |student|
		grid(a,b).bounding_box do
			pad_top(5) {pdf.text "#{Prawn::Text::NBSP}" + student.proper_name}
			pdf.image open(student.newbarcode.to_s), :width => 250, :position => (7)
			stroke_bounds
			a = a + 1
			if a.modulo(row) == 0
				a = 0
				if b == 0
					b = b +1 
				else
					start_new_page
					a = b = 0
				end
			end
		end
	end
end

if @absentees
	@absentees.each do |student|
		grid(a,b).bounding_box do
			pad_top(5) {pdf.text "#{Prawn::Text::NBSP}" + student.proper_name}
			pdf.image open(student.newbarcode.to_s), :width => 250, :position => (7)
			stroke_bounds
			a = a + 1
			if a.modulo(row) == 0
				a = 0
				if b == 0
					b = b +1 
				else
					start_new_page
					a = b = 0
				end
			end
		end
	end
end