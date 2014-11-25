module ApplicationHelper

  def stat_input(f, name, is_academic=false)
    f.simple_fields_for :stats, f.object.stats.where(name: name).first || Stat.new do |sf|
      sf.input(:name, as: :hidden, input_html: {value: name}) +
      sf.input(:value, label: name, placeholder: name) +
      sf.input(:academic, as: :hidden, input_html: {value: is_academic})
    end
  end

end
