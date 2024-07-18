Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

// FOR THE XP AND LEVEL SYSTEM
// ---------------------------
// first you need the feature to actually do a workout,
// when the user has completed a workout, then you can increase his xp and make him level

// THE LOGIC;
// ------------------------------------------
// set default experience point to 0 so level 0, do this in the profile.rb
// set a xp = level method up to level 55 -- (level) 1 => 100 (xp)
// set xp value -- 1 kg lifted = 2.5 xp, 1 minute = 1 xp, strenght training (PPLF) = 50 xp, cardio = 100xp
// create method to get exercises done and time spent then add to profile total xp
//  def calculate_xp
      xp = 0

      xp += workouts.sum(:total_volume) * 2.5

      xp += achievements.sum(:points)

      update(experience_points: xp)
    end

// FOR THE TOTAL VOLUME
// ------------------------------------------
// check the data base for the total amount of KGs logged

// FOR THE TOTAL TIME IN GYM
// ------------------------------------------
// check the data base for the total amount of time logged

// FOR THE TOTAL WORKOUTS
// ------------------------------------------
// check the data base for the total amount of workouts logged

// GET HELP FOR IMAGE
// ------------------------------------------

// LOGOUT BUTTON
// ------------------------------------------
// 
