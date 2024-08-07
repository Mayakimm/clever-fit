class GroupClassesController < ApplicationController
  def show
    @group_class = GroupClass.find(params[:id])
    @img_sources = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUkUalpMEX6rmV97y5I_7K-fGHKkNlJ83Hug&s",
      "https://i0.pickpik.com/photos/426/559/606/sport-fitness-training-sporty-preview.jpg",
      "https://img.goodfon.com/original/2560x1707/7/81/poza-figura-fitnes-shtanga-trenirovka-vorkaut-workout-fitn-2.jpg",
      "https://cdn10.picryl.com/photo/1981/09/03/a-recruit-from-the-physical-conditioning-platoon-does-weight-lifting-exercises-390008-1024.jpg"]
    @rand_img = @img_sources.sample
  end
end
