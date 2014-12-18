%w(analysis bless data dependencies khmer soap trinity).each do |file|
  require "txome-feeding-paper/#{file}"
end
