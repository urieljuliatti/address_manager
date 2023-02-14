require 'erb'

class Template

  attr_reader :erb_template

  def initialize(file)
    template_letter = File.read(file)
    @erb_template = ERB.new template_letter
  end
end
