col = 2
row = 7

define_grid(:columns => col, :rows => row, :gutter => 10)

grid(0,0).bounding_box do
	pad_top(5) {pdf.text "#{Prawn::Text::NBSP}" + @student.proper_name}
	pdf.image open(@student.newbarcode.to_s), :width => 250, :position => (7)
	stroke_bounds
end

