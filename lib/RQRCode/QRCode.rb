require "rqrcode"
require "chunky_png"

module RQRCode
  class QRCode

    # to_image
    #
    # the size parameter indicates the width and height in pixels for each module
    def to_image(size)
      image = ChunkyPNG::Image.new(size * @modules.size, size * @modules.size,
              ChunkyPNG::Color::WHITE)

      @modules.each_index do |x|
        @modules.each_index do |y|
          if (self.dark?(x,y))
            image.rect(x * size, y * size, (x * size) + size, (y * size) + size, 
                       ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)
          end
        end
      end

      image
    end
  end
end