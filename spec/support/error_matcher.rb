RSpec::Matchers.define :have_error do |expected, options|
  match do |page|
    page.find_field(options[:on]).parent.should have_css(".error", text: expected)
  end
end
