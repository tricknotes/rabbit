proc_name = "title-background"

if @title_background_image.nil?
  raise "must specify @title_background_image!!"
end

match(TitleSlide) do |slides|
  loader = ImageLoader.new(search_file(@title_background_image))
  resized = false

  slides.delete_pre_draw_proc_by_name(proc_name)

  slides.add_pre_draw_proc(proc_name) do |slide, canvas, x, y, w, h, simulation|
    unless simulation
      unless loader.nil?
        unless resized
          loader.resize(canvas.width, canvas.height)
          resized = true
        end
        canvas.draw_pixbuf(loader.pixbuf, 0, 0)
      end
    end
    [x, y, w, h]
  end
end
