module ApplicationHelper
  def muscle_group_image(muscle_group)
    muscle_group_name = muscle_group.downcase.gsub(' ', '_')
    image_tag("#{muscle_group_name}.png", alt: "Muscle Group: #{muscle_group}")
  end
end
