# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


WorkoutExercise.destroy_all
Exercise.destroy_all
Workout.destroy_all
GroupClass.destroy_all
DaySummary.destroy_all
Profile.destroy_all
User.destroy_all

puts "starting seed"

Achievement.create!([
  { name: 'Pushups Noob', description: 'Logged 100 pushups', image_url: 'push_ups.png' },
  { name: 'Squat Noob', description: 'Logged 100 squats', image_url: 'squat.png' },
  { name: 'Pull up Noob', description: 'Logged 100 pull ups', image_url: 'pull_ups.png' },
  { name: 'Bench Press Noob', description: 'Logged 100 bench press reps', image_url: 'bench_press.png' }
])

User.create!([
  { email: 'john.doe@example.com', password: 'password1', admin: false },
  { email: 'jane.smith@example.com', password: 'password2', admin: false },
  { email: 'alice.jones@example.com', password: 'password3', admin: false },
  { email: 'bob.brown@example.com', password: 'password4', admin: true },
  { email: 'charlie.wilson@example.com', password: 'password5', admin: false }
])

Profile.create!([
  { name: 'John Doe', gender: 'Male', age: 30, goal: 'Weight Loss', address: '123 Main St, London, UK', city: 'London', user: User.first, weight: 80.5, height: 175.0,
    experience_points: Profile.calculate_xp(0, 0), level: 1, profile_picture: 'male_1.png' },
  { name: 'Jane Smith', gender: 'Female', age: 25, goal: 'Muscle Gain', address: '456 Elm St, Paris, France', city: 'Paris', user: User.second, weight: 65.0, height: 165.0,
    experience_points: Profile.calculate_xp(0, 0), level: 2, profile_picture: 'female_1.png' },
  { name: 'Alice Jones', gender: 'Female', age: 28, goal: 'Maintain Fitness', address: '789 Oak St, Berlin, Germany', city: 'Berlin', user: User.third, weight: 70.0, height: 170.0,
    experience_points: Profile.calculate_xp(0, 0), level: 1, profile_picture: 'female_2.png' },
  { name: 'Bob Brown', gender: 'Male', age: 35, goal: 'Cardio Fitness', address: '101 Pine St, Rome, Italy', city: 'Rome', user: User.fourth, weight: 85.0, height: 180.0,
    experience_points: Profile.calculate_xp(0, 0), level: 3, profile_picture: 'male_2.png' },
  { name: 'Charlie Wilson', gender: 'Male', age: 40, goal: 'General Health', address: '202 Maple St, New York, USA', city: 'New York', user: User.fifth, weight: 90.0, height: 175.0,
    experience_points: Profile.calculate_xp(750, 270), level: 2, profile_picture: 'male_3.png' }
])

Exercise.create!([

# Push Exercises
  { name: 'Push-up', video_url: 'https://www.youtube.com/embed/0pkjOk0EiAk?si=QeuXmjDJSqsFLPE1', image_url: 'https://img.freepik.com/free-photo/woman-working-out-gym_23-2148111535.jpg?t=st=1721250925~exp=1721254525~hmac=16c745062a6fbdbc1221a6ef48555fb4e0358207d4bd0f59df925da9595f0e86&w=1060', description: 'A basic push-up exercise', instruction: 'Start with low-intensity warm-up exercises and gradually increase the intensity to avoid straining cold muscles.', equipment: 'None', muscle_group: 'Chest', met_value: 8.0 },
  { name: 'Bench Press', video_url: 'https://www.youtube.com/embed/SCVCLChPQFY?si=RvVCM9znWXsMqgGI', image_url: 'https://img.freepik.com/free-photo/fitness-gym-weightlifting_144627-31104.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A basic bench press exercise', instruction: 'Lie down on the bench and pull your shoulder blades together. Slightly arch your back and grab the bar slightly wider than the width of your shoulder. Inhale and exhale to lift the bar from the rack. Lower the bar carefully until it touches your chest, close to your sternum. Push the bar to the starting position as you exhale. Repeat.', equipment: 'Barbell', muscle_group: 'Chest', met_value: 9.5 },
  { name: 'Overhead Press', video_url: 'https://www.youtube.com/embed/F3QY5vMz_6I?si=QIa3d4xvxZoiRqPm', image_url: 'https://img.freepik.com/free-photo/handsome-man-is-engaged-gym_1157-21926.jpg?t=st=1721251246~exp=1721254846~hmac=488613e93a86c501fd5a669ce9df13c0a7b2daa7ca5f9f6458b5757320797b34&w=1800', description: 'A basic overhead press exercise', instruction: 'Place a barbell at about chest height. Grip the bar wider than shoulder width and step close to it. Inhale and raise the bar so it is resting on your collarbone. Press the bar up until your arms are straight while exhaling. Inhale at the top and lower the bar carefully to your shoulders. Repeat.', equipment: 'Barbell', muscle_group: 'Shoulders', met_value: 8.5 },
  { name: 'Tricep Dip', video_url: 'https://www.youtube.com/embed/6kALZikXxLc?si=QWl3OifOp-QZLhJ3', image_url: 'https://img.freepik.com/premium-photo/fit-woman-workout-triceps-lifting-weights-gym_136403-913.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A basic tricep dip exercise', instruction: 'Lie down on a flat bench with your head near the edge. Grip a barbell and lift it over yourself with a straight arm. Lower the barbell behind your head as you exhale. Reverse the motion bringing the bar back over yourself while extending your arms again. Repeat.', equipment: 'Parallel Bars', muscle_group: 'Triceps', met_value: 7.0 },
  { name: 'Incline Bench Press', video_url: 'https://www.youtube.com/embed/dtNXLavPFo0?si=26HOqC6d1jF6x-1h', image_url: 'https://img.freepik.com/free-photo/young-man-trains-his-body-stay-fit-have-defined-muscles_1328-5306.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'An incline bench press exercise', instruction: 'Press the barbell at an incline', equipment: 'Barbell', muscle_group: 'Upper_Chest', met_value: 8.5 },

  # Pull Exercises
  { name: 'Pull-up', video_url: 'https://www.youtube.com/embed/HRV5YKKaeVw?si=xxLED6edMeBTAfHU', image_url: 'https://img.freepik.com/free-photo/gym-handsome-man-workout_144627-6229.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A basic pull-up exercise', instruction: 'Pull yourself up', equipment: 'Pull-up bar', muscle_group: 'Back', met_value: 9.0 },
  { name: 'Deadlift', video_url: 'https://www.youtube.com/embed/r4MzxtBKyNE?si=WDcw8XwAx9BAvuH9', image_url: 'https://img.freepik.com/free-photo/muscular-build-man-making-effort-while-weightlifting-cross-training-gym_637285-2488.jpg?ga=GA1.1.2040644916.1721225651&semt=sph'  ,description: 'A basic deadlift exercise', instruction: 'Lift the barbell from the ground', equipment: 'Barbell', muscle_group: 'Back', met_value: 9.5 },
  { name: 'Bent-over Row', video_url: 'https://www.youtube.com/embed/VV4CzMdVxng?si=Ozi-xuNu6OquKpCP', image_url: 'https://img.freepik.com/free-photo/side-view-young-woman-lifting-weight-fitness-center_23-2147827509.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A basic bent-over row exercise', instruction: 'Row the barbell', equipment: 'Barbell', muscle_group: 'Back', met_value: 8.0 },
  { name: 'Lat Pulldown', video_url: 'https://www.youtube.com/embed/CAwf7n6Luuc?si=iEKHfDTTonamALAr', image_url: 'https://img.freepik.com/free-photo/beautiful-sexy-athletic-young-brunette-sportswear-working-out-training-pumping-up-back-lats-muscles-gym_613910-4691.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user' ,description: 'A lat pulldown exercise', instruction: 'Pull the bar down', equipment: 'Pulley Machine', muscle_group: 'Back', met_value: 7.5 },
  { name: 'Face Pull', video_url: 'https://www.youtube.com/embed/rep-qVOkqgk?si=0_2jMFGSkF1et2Gk', image_url: 'https://img.freepik.com/free-photo/middle-age-man-doing-fitness-workouts-home_613910-14253.jpg?ga=GA1.1.2040644916.1721225651' ,description: 'A face pull exercise', instruction: 'Pull the rope towards your face', equipment: 'Pulley Machine', muscle_group: 'Shoulders', met_value: 7.0 },

  # Legs Exercises
  { name: 'Squat', video_url: 'https://www.youtube.com/embed/xqvCmoLULNY?si=rAqKHWsUVhDuVDrn', image_url: 'https://img.freepik.com/free-photo/sporty-athletic-woman-squatting-doing-sit-ups-gym-isolated-white-wall_231208-1726.jpg?ga=GA1.1.2040644916.1721225651&semt=sph', description: 'A basic squat exercise', instruction: 'Keep your back straight', equipment: 'None', muscle_group: 'Quadriceps', met_value: 7.5 },
  { name: 'Leg Press', video_url: 'https://www.youtube.com/embed/p5dCqF7wWUw?si=jSIaA_huTWFOS0N9', image_url: 'https://img.freepik.com/premium-photo/athletic-man-doing-legs-press_274689-33577.jpg?ga=GA1.1.2040644916.1721225651', description: 'A leg press exercise', instruction: 'Press the platform', equipment: 'Leg Press Machine', muscle_group: 'Quadriceps', met_value: 7.0 },
  { name: 'Lunge', video_url: 'https://www.youtube.com/embed/QOVaHwm-Q6U?si=jZYtCJYQU0ZVBuE_', image_url: 'https://img.freepik.com/free-photo/woman-stretching_23-2149374673.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A basic lunge exercise', instruction: 'Step forward and lower your body', equipment: 'None', muscle_group: 'Quadriceps', met_value: 6.5 },
  { name: 'Leg Curl', video_url: 'https://www.youtube.com/embed/1Tq3QdYUuHs?si=3W-pOfRZIMpNq7f-', image_url: 'https://img.freepik.com/free-photo/beautiful-woman-doing-back-exercise_23-2147789637.jpg?ga=GA1.1.2040644916.1721225651', description: 'A leg curl exercise', instruction: 'Curl your legs', equipment: 'Leg Curl Machine', muscle_group: 'Hamstrings', met_value: 6.0 },
  { name: 'Calf Raise', video_url: 'https://www.youtube.com/embed/-M4-G8p8fmc?si=40Kx-kSCnvx_gPmO', image_url: 'https://img.freepik.com/premium-photo/muscular-man-calves_600776-36424.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user' ,description: 'A calf raise exercise', instruction: 'Raise your heels', equipment: 'None', muscle_group: 'Calves', met_value: 5.5 },

  # Cardio Exercises
  { name: 'Running', video_url: 'https://www.youtube.com/embed/_kGESn8ArrU?si=00H_QGqdEgtrMEq-', image_url: 'https://img.freepik.com/free-photo/young-happy-sportswoman-running-road-morning-copy-space_637285-3758.jpg?ga=GA1.1.2040644916.1721225651&semt=sph'  ,description: 'A basic running exercise', instruction: 'Run at a steady pace', equipment: 'None', muscle_group: 'Cardio', met_value: 9.0 },
  { name: 'Cycling', video_url: 'https://www.youtube.com/embed/S0nRkf5wU5U?si=qnSSLKYF7eEGsGVK', image_url: 'https://img.freepik.com/free-photo/side-view-women-riding-bike-outdoors_23-2150880468.jpg?ga=GA1.1.2040644916.1721225651&semt=sph' ,description: 'A basic cycling exercise', instruction: 'Cycle at a steady pace', equipment: 'Stationary Bike', muscle_group: 'Cardio', met_value: 8.5 },
  { name: 'Jump Rope', video_url: 'https://www.youtube.com/embed/OziWs_f6zmc?si=pzdVNobdeiLMcJEh', image_url: 'https://img.freepik.com/free-photo/woman-doing-sport-exercises_23-2148656593.jpg?ga=GA1.1.2040644916.1721225651&semt=ais_user' ,description: 'A basic jump rope exercise', instruction: 'Jump over the rope', equipment: 'Jump Rope', muscle_group: 'Cardio', met_value: 10.0 },
  { name: 'Rowing', video_url: 'https://www.youtube.com/embed/6_eLpWiNijE?si=HCVy8gVginnTbz7A', image_url: 'https://img.freepik.com/free-photo/kayaking-man-paddling-kayak-canoeing-paddling_654080-27.jpg?ga=GA1.1.2040644916.1721225651&semt=sph'   ,description: 'A basic rowing exercise', instruction: 'Row at a steady pace', equipment: 'Rowing Machine', muscle_group: 'Cardio', met_value: 8.0 },
  { name: 'Swimming', video_url: 'https://www.youtube.com/embed/4_GAi41UXiM?si=OA0oLlGT_ZiEpFbg', image_url: 'https://img.freepik.com/free-photo/side-view-female-swimmer-with-cap-goggles-swimming-water_23-2148687600.jpg?ga=GA1.1.2040644916.1721225651&semt=sph'  ,description: 'A basic swimming exercise', instruction: 'Swim at a steady pace', equipment: 'None', muscle_group: 'Cardio', met_value: 10.5 },

  # core exercises
  { name: 'Plank', video_url: 'https://www.youtube.com/embed/pvIjsG5Svck?si=WwQq5ebNrH6xoTb5', image_url: 'https://img.freepik.com/free-photo/happy-fitness-girl-with-loose-hair-planking-outdoors_23-2147678026.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user'  ,description: 'A core strengthening exercise that targets the abdominal muscles', instruction: 'Hold the position for 30-60 seconds', equipment: 'None', muscle_group: 'Core', met_value: 4.0 },
  { name: 'Russian Twists', video_url: 'https://www.youtube.com/embed/wkD8rjkodUI?si=NDFbKXERVrmhMwZJ', image_url: 'https://img.freepik.com/free-photo/woman-with-pink-leggings-doing-crunches_23-2148285009.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'An exercise that works the obliques and strengthens the core.', instruction: 'Perform twists to each side for 30 seconds.', equipment: 'None', muscle_group: 'Core', met_value: 5.0},
  { name: 'Bicycle Crunches',video_url: 'https://www.youtube.com/embed/9FGilxCbdz8', image_url: 'https://img.freepik.com/free-photo/practicing-floor-sportive-young-woman-have-fitness-day-gym-morning-time_146671-16019.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A dynamic exercise that engages multiple core muscles and improves coordination.', instruction: 'Perform for 30-60 seconds, alternating legs.', equipment: 'None', muscle_group: 'Core', met_value: 6.0},
  { name: 'Leg Raises', video_url: 'https://www.youtube.com/embed/Jk2V7mgJ1Mc', image_url: 'https://img.freepik.com/free-photo/woman-stretching-preparing-exercise-outdoors_23-2149676900.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user',description: 'A core exercise that targets the lower abdominal muscles.',instruction: 'Perform 10-15 repetitions.',equipment: 'None',muscle_group: 'Core',met_value: 4.5},

  # Stretching exercises
  { name: 'Neck Stretch', video_url: 'https://www.youtube.com/embed/avQ0FbaW3rc?si=JllW9kKg6bAMyDRC', image_url: 'https://img.freepik.com/free-photo/expressive-young-woman-posing-studio_176474-35461.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A simple stretch to release tension in the neck muscles.', instruction: 'Tilt your head to one side, bringing your ear towards your shoulder. Hold for 20-30 seconds. Repeat on the other side.', equipment: 'None', muscle_group: 'Neck', met_value: 2.0 },
  { name: 'Shoulder Stretch', video_url: 'https://www.youtube.com/embed/4e_6MviR74g?si=5R1dTslk4z3NpgEp', image_url: 'https://img.freepik.com/free-photo/sporty-woman-stretching-urban-environment_23-2147988164.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to improve shoulder flexibility and relieve tension.', instruction: 'Bring one arm across your chest and use the opposite hand to gently pull it closer. Hold for 20-30 seconds. Switch arms.', equipment: 'None', muscle_group: 'Shoulders', met_value: 2.5 },
  { name: 'Triceps Stretch', video_url: 'https://www.youtube.com/embed/yoSVydDAx-s?si=7iRUL5pMnR6kUKd2', image_url: 'https://img.freepik.com/free-photo/woman-practicing-advanced-yoga-against-dark-urban-wall_1157-35873.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to target the triceps and improve upper arm flexibility.', instruction: 'Raise one arm overhead, bend the elbow, and use the opposite hand to gently push the elbow down. Hold for 20-30 seconds. Switch arms.', equipment: 'None', muscle_group: 'Triceps', met_value: 2.5 },
  { name: 'Chest Stretch', video_url: 'https://www.youtube.com/embed/vQvw4KiNno4?si=zPSH-jcxCrT4_XRi', image_url: 'https://img.freepik.com/free-photo/young-woman-practicing-yoga-her-body-balance_23-2149163254.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to open up the chest and improve flexibility in the upper body.', instruction: 'Stand in a doorway, place your arms on the doorframe, and gently lean forward to stretch the chest muscles. Hold for 20-30 seconds.', equipment: 'None', muscle_group: 'Chest', met_value: 2.5 },
  { name: 'Side Stretch', video_url: 'https://www.youtube.com/embed/BjByq3Bopvs?si=6gGOU7fnzEZc4FOg', image_url: 'https://img.freepik.com/free-photo/woman-cobra-position_23-2147670190.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to improve flexibility in the sides of the torso and the obliques.', instruction: 'Stand with feet shoulder-width apart, reach one arm overhead, and lean to the opposite side. Hold for 20-30 seconds. Switch sides.', equipment: 'None', muscle_group: 'Obliques, Sides', met_value: 2.5 },
  { name: 'Hamstring Stretch', video_url: 'https://www.youtube.com/embed/YsOT4S4T2dA?si=KoW3qdfh93vjQieF', image_url: 'https://img.freepik.com/free-photo/flexible-sporty-girl-makes-different-poses-while-doing-sport-exercises_273609-28265.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to improve flexibility in the hamstrings and lower back.', instruction: 'Sit on the floor with one leg extended straight and the other bent, reach towards your toes on the extended leg. Hold for 20-30 seconds. Switch legs.', equipment: 'None', muscle_group: 'Hamstrings, Lower Back', met_value: 3.0 },
  { name: 'Calf Stretch', video_url: 'https://www.youtube.com/embed/NHv8r1ZYlLU?si=clo1_kjLmy56ClLA', image_url: 'https://img.freepik.com/premium-photo/young-attractive-woman-doing-exercise-working-out-outdoors_81340-7356.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to target the calf muscles and improve ankle flexibility.', instruction: 'Stand facing a wall, place one foot behind you, and press the heel towards the ground. Hold for 20-30 seconds. Switch legs.', equipment: 'None', muscle_group: 'Calves', met_value: 3.0 },
  { name: 'Hip Flexor Stretch', video_url: 'https://www.youtube.com/embed/xu9cUgB96hw?si=5IgD6E_dz5_yJDCJ', image_url: 'https://img.freepik.com/free-photo/beautiful-healthy-young-asian-woman-doing-stretching-exercise-before-playing-sport_1150-13303.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to improve flexibility in the hip flexors and quads.', instruction: 'Kneel on one knee, with the other foot in front, and gently push your hips forward. Hold for 20-30 seconds. Switch sides.', equipment: 'None', muscle_group: 'Hip Flexors, Quads', met_value: 3.0 },
  { name: 'Lower Back Stretch', video_url: 'https://www.youtube.com/embed/b1NgI5w5lDM?si=XUgQ7FDZmW0J-E1S', image_url: 'https://img.freepik.com/free-photo/young-attractive-woman-balasana-pose-white-studio-background_1163-2317.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to relieve tension and improve flexibility in the lower back.', instruction: 'Lie on your back, pull your knees towards your chest, and gently rock side to side. Hold for 20-30 seconds.', equipment: 'None', muscle_group: 'Lower Back', met_value: 3.0 },
  { name: 'Glute Stretch', video_url: 'https://www.youtube.com/embed/n2DNivd_TVY?si=8a5qsfLv9dl-NUNd', image_url: 'https://img.freepik.com/free-photo/close-up-woman-sitting-floor_23-2148877053.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to target the glutes and improve hip flexibility.', instruction: 'Lie on your back, cross one ankle over the opposite knee, and pull the lower leg towards your chest. Hold for 20-30 seconds. Switch sides.', equipment: 'None', muscle_group: 'Glutes, Hips', met_value: 3.0 },


  #Mobility exercises
    { name: 'Cat-Cow Stretch', video_url: 'https://www.youtube.com/embed/kpZhZAr1cQU', image_url: 'https://media1.popsugar-assets.com/files/thumbor/zMElxXuIZGRmZd3pGXLrA-ajmPI=/fit-in/792x792/filters:format_auto():upscale()/2021/12/02/674/n/1922729/tmp_tdb0lt_63abb2d201fb98ce_Cat-Cow.jpeg ', description: 'A dynamic stretch to improve spinal flexibility and relieve back tension.', instruction: 'Start on all fours, arch your back (Cat), then drop your belly and lift your head (Cow). Repeat for 10-15 reps.', equipment: 'None', muscle_group: 'Spine, Back', met_value: 2.5 },
    { name: 'World’s Greatest Stretch', video_url: 'https://www.youtube.com/embed/Lrz9N2aDQy0', image_url: 'https://img.freepik.com/free-photo/woman-doing-yoga-roof-skyscraper-big-city_1153-4895.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A full-body stretch to improve hip, hamstring, and upper body mobility.', instruction: 'Start in a lunge, bring both hands down inside the front foot, twist towards the front knee. Repeat on the other side.', equipment: 'None', muscle_group: 'Hips, Hamstrings, Upper Body', met_value: 3.5 },
    { name: 'Hip Circles', video_url: 'https://www.youtube.com/embed/O0fGe3jGm-M', image_url: 'https://img.freepik.com/free-photo/workout-home_144627-44308.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A movement to improve hip mobility and range of motion.', instruction: 'Stand with feet hip-width apart, hands on hips. Make circles with your hips, first in one direction, then the other. Repeat for 10-15 reps.', equipment: 'None', muscle_group: 'Hips', met_value: 2.5 },
    { name: 'Shoulder Pass-Throughs', video_url: 'https://www.youtube.com/embed/Tyxkq0mjfX0', image_url: 'https://img.freepik.com/free-photo/back-view-man-working-out-with-red-stretching-band_23-2148605636.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A movement to increase shoulder mobility and flexibility.', instruction: 'Hold a band or stick with a wide grip, pass it over your head and back down behind you. Repeat for 10-15 reps.', equipment: 'Band or Stick', muscle_group: 'Shoulders', met_value: 2.5 },
    { name: 'Thoracic Spine Rotations', video_url: 'https://www.youtube.com/embed/8_i03NIXoEw', image_url: 'https://img.freepik.com/free-photo/caucasian-woman-practicing-yoga-home_158595-5422.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A movement to improve mobility in the upper back and spine.', instruction: 'Start on all fours, place one hand behind your head, rotate your torso to bring the elbow towards the ceiling. Repeat for 10-15 reps each side.', equipment: 'None', muscle_group: 'Thoracic Spine, Upper Back', met_value: 2.5 },
    { name: 'Ankle Circles', video_url: 'https://www.youtube.com/embed/qTaJkqJtMyg', image_url: 'https://img.freepik.com/free-photo/woman-doing-sport-exercises_23-2148656557.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A movement to improve ankle mobility and range of motion.', instruction: 'Sit or stand, lift one foot off the ground, make circles with your ankle in one direction, then the other. Repeat for 10-15 reps each ankle.', equipment: 'None', muscle_group: 'Ankles', met_value: 2.0 },
    { name: 'Hip Flexor Mobilization', video_url: 'https://www.youtube.com/embed/xu9cUgB96hw', image_url: 'https://img.freepik.com/free-photo/woman-stretching_23-2149374662.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A movement to improve hip flexor mobility and relieve tightness.', instruction: 'Start in a lunge position, gently pulse your hips forward and back. Repeat for 10-15 reps each side.', equipment: 'None', muscle_group: 'Hip Flexors', met_value: 3.0 },
    { name: 'Scapular Wall Slides', video_url: 'https://www.youtube.com/embed/Tyh39bBst_4', image_url: 'https://img.freepik.com/free-photo/back-view-man-doing-leg-exercises_23-2147775418.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A movement to improve shoulder blade mobility and posture.', instruction: 'Stand with your back against a wall, arms in a W position. Slide your arms up and down the wall. Repeat for 10-15 reps.', equipment: 'None', muscle_group: 'Scapula, Shoulders', met_value: 2.5 },
    { name: 'Kneeling Adductor Stretch', video_url: 'https://www.youtube.com/embed/wlx6lDYy-9c', image_url: 'https://img.freepik.com/free-photo/practicing-yoga-sport-home_23-2148644098.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A stretch to improve mobility in the inner thighs and hips.', instruction: 'Start on all fours, extend one leg out to the side, gently rock back and forth. Repeat for 10-15 reps each side.', equipment: 'None', muscle_group: 'Adductors, Hips', met_value: 3.0 },
    { name: 'Arm Circles', video_url: 'https://www.youtube.com/embed/eFGnBcSzTDE', image_url: 'https://img.freepik.com/free-photo/young-woman-with-short-hair-stretching-outdoors_23-2148291318.jpg?uid=R156501570&ga=GA1.1.2040644916.1721225651&semt=ais_user', description: 'A movement to improve shoulder mobility and warm up the upper body.', instruction: 'Extend your arms out to the sides, make small circles forward and then backward. Repeat for 10-15 reps each direction.', equipment: 'None', muscle_group: 'Shoulders, Arms', met_value: 2.0 }
])


GroupClass.create!([
  { name: 'Hot Yoga', address: 'Studio 1, London, UK', city: 'London', date: '2024-07-20', time: '10:00', limit_of_students: 20, description: 'Join us for a relaxing hot yoga session where you will be guided through a series of stretches and poses designed to improve flexibility and reduce stress. Suitable for all levels, our experienced instructor, Sarah, will ensure you leave feeling refreshed and rejuvenated.', contact: 'contact@yoga.com', user: User.first, level: 'Beginner', image_url:"https://images.pexels.com/photos/3822672/pexels-photo-3822672.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" },
  { name: 'Power HIIT', address: 'Gym B, Paris, France', city: 'Paris', date: '2024-07-21', time: '11:00', limit_of_students: 15, description: 'Experience a high-intensity interval training (HIIT) session that will push you to your limits. This class is designed to burn maximum calories in a short amount of time through intense bursts of exercise followed by short recovery periods. Perfect for those looking to increase their fitness level. Led by our expert trainer, John.', contact: 'contact@hiit.com', user: User.second, level: 'All-level', image_url:"https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL2ZsNDk0ODg2MzUyMDgtaW1hZ2UuanBn.jpg" },
  { name: 'Reformer Pilates', address: 'Fitness Center, Berlin, Germany', city: 'Berlin', date: '2024-07-22', time: '12:00', limit_of_students: 10, description: 'Strengthen your core and improve your overall fitness with our reformer pilates class. This session focuses on controlled movements and breathing techniques to enhance your physical strength, flexibility, and posture. Ideal for individuals seeking a balanced and low-impact workout. Your instructor, Emily, is highly skilled in pilates techniques.', contact: 'contact@pilates.com', user: User.third, level: 'Expert', image_url:"https://live.staticflickr.com/4297/35762302210_fec660cf36_b.jpg" },
  { name: 'Endurance Spin', address: 'Cycling Studio, Rome, Italy', city: 'Rome', date: '2024-07-23', time: '13:00', limit_of_students: 25, description: 'Get ready for an energetic spin class that will leave you feeling exhilarated. Our dynamic instructor, Mark, will lead you through a series of high-energy cycling routines set to motivating music. This class is designed to boost your cardiovascular fitness and endurance.', contact: 'contact@spin.com', user: User.fourth, level: 'Beginner', image_url:"https://live.staticflickr.com/7337/16271170627_b480d85074_b.jpg" },
  { name: 'Latin Zumba', address: 'Dance Hall, New York, USA', city: 'New York', date: '2024-07-24', time: '14:00', limit_of_students: 30, description: 'Join our fun and lively Latin Zumba dance class where you can dance your way to fitness. This session combines Latin and international music with dance moves to create an exciting and effective workout. Perfect for anyone who loves to dance and wants to stay in shape. Our talented instructor, Maria, will ensure you have a blast.', contact: 'contact@zumba.com', user: User.fifth, level: 'Intermediate', image_url:"https://live.staticflickr.com/1491/26478105075_134c8fa5f6_b.jpg" },
  { name: 'Aerial Yoga for Men', address: 'Studio 2, London, UK', city: 'London', date: '2024-07-25', time: '15:00', limit_of_students: 20, description: 'Experience the unique sensation of aerial yoga where you will perform traditional yoga poses while suspended in the air. This class is led by our expert aerial yoga instructor, Alice, who will help you enhance your flexibility and strength.', contact: 'contact@aerialyoga.com', user: User.first, level: 'Intermediate', image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuuMf604Z3j0mQTk6eF3bX0QUlUW57a0TUbA&s" },
  { name: 'Advanced HIIT', address: 'Gym C, London, UK', city: 'London', date: '2024-07-26', time: '16:00', limit_of_students: 15, description: 'Push your limits with our advanced HIIT class designed for those who are ready to take their fitness to the next level. Our experienced trainer, David, will guide you through high-intensity intervals for a maximum calorie burn.', contact: 'contact@advancedhiit.com', user: User.second, level: 'Expert', image_url:"https://live.staticflickr.com/31337/51500222677_61e1379d97_b.jpg" },
  { name: 'Pilates for Beginners', address: 'Fitness Center, London, UK', city: 'London', date: '2024-07-27', time: '17:00', limit_of_students: 10, description: 'Perfect for those new to pilates, this class focuses on the fundamentals of pilates to build a strong foundation. Our instructor, Lisa, has years of experience and will ensure you learn the correct techniques and postures.', contact: 'contact@pilatesbeginners.com', user: User.third, level: 'Beginner', image_url:"https://img.goodfon.com/original/4500x3000/3/42/pilates-smile-women-workout.jpg" },
  { name: 'Cardio Spin', address: 'Cycling Studio, London, UK', city: 'London', date: '2024-07-28', time: '18:00', limit_of_students: 25, description: 'Join our cardio spin class for an intense workout that focuses on building cardiovascular endurance. Led by our enthusiastic instructor, Paul, this class is perfect for those looking to get their heart rate up and burn calories.', contact: 'contact@cardiospin.com', user: User.fourth, level: 'All-level', image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8sVwX6vxRceJD7tT6yUZTiVzt3DUFYmUBiA&s" },
  ])

Workout.create!([
  { name: 'Push', workout_type: 'Push', icon: '<i class="fa-solid fa-dumbbell icon-blue"></i>' ,user: User.fifth, start_time: '2024-07-20 08:00:00', muscle_group: 'chest, triceps, sholders',  end_time: '2024-07-20 09:00:00'  },
  { name: 'Pull', workout_type: 'Pull', icon: '<i class="fa-solid fa-people-pulling icon-blue"></i>',user: User.fifth, start_time: '2024-07-21 08:00:00', muscle_group: 'back, biceps, forearms', end_time: '2024-07-21 09:00:00' },
  { name: 'Legs', workout_type: 'Legs', icon: '<i class="fa-solid fa-drumstick-bite icon-blue"></i>',user: User.fifth, start_time: '2024-07-22 08:00:00', muscle_group: 'quadriceps, glutes, hamstrings', end_time: '2024-07-22 09:00:00' },
  { name: 'Cardio', workout_type: 'Cardio', icon: '<i class="fa-solid fa-person-running icon-blue"></i>',user: User.fifth, start_time: '2024-07-23 08:00:00', muscle_group: 'full body', end_time: '2024-07-23 09:00:00' },
  { name: 'Freestyle', workout_type: 'Freestyle', icon: '<i class="fa-solid fa-fire icon-blue"></i>' ,user: User.fifth, start_time: '2024-07-24 08:00:00',end_time: '2024-07-24 09:00:00' },
  { name: 'Core', workout_type: 'Core', icon: '<i class="fa-solid fa-table icon-blue"></i>',user: User.fifth, start_time: '2024-07-25 08:00:00', muscle_group: 'abdominals, obliques', end_time: '2024-07-25 09:00:00' },
  { name: 'Stretching', workout_type: 'Stretching', icon: '<i class="fa-solid fa-align-center icon-blue"></i>',user: User.fifth, start_time: '2024-07-26 08:00:00', muscle_group: 'full body', end_time: '2024-07-26 09:00:00' },
  { name: 'Mobility', workout_type: 'Mobility', icon: '<i class="fa-solid fa-person-biking icon-blue"></i>',user: User.fifth, start_time: '2024-07-27 08:00:00', muscle_group: 'joints, connective tissue', end_time: '2024-07-27 09:00:00' }
])

WorkoutExercise.create!([
  # Push Workout Exercises
  { kg: Workout.find_by(name: 'Push').user.profile.weight, set: 3, time: '00:30:00', calories: 150, volume: 25, exercise: Exercise.find_by(name: 'Push-up'), workout: Workout.find_by(name: 'Push') },
  { kg: 60, set: 3, time: '00:45:00', calories: 200, volume: 8, exercise: Exercise.find_by(name: 'Bench Press'), workout: Workout.find_by(name: 'Push') },
  { kg: 30, set: 3, time: '00:45:00', calories: 220, volume: 8, exercise: Exercise.find_by(name: 'Overhead Press'), workout: Workout.find_by(name: 'Push') },
  { kg: Workout.find_by(name: 'Push').user.profile.weight, set: 3, time: '00:30:00', calories: 12, volume: 25, exercise: Exercise.find_by(name: 'Tricep Dip'), workout: Workout.find_by(name: 'Push') },
  { kg: 60, set: 3, time: '00:35:00', calories: 210, volume: 6, exercise: Exercise.find_by(name: 'Incline Bench Press'), workout: Workout.find_by(name: 'Push') },

  # Pull Workout Exercises
  { kg: Workout.find_by(name: 'Pull').user.profile.weight, set: 3, time: '00:30:00', calories: 150, volume: 6, exercise: Exercise.find_by(name: 'Pull-up'), workout: Workout.find_by(name: 'Pull') },
  { kg: 100, set: 3, time: '00:45:00', calories: 250, volume: 6, exercise: Exercise.find_by(name: 'Deadlift'), workout: Workout.find_by(name: 'Pull') },
  { kg: 40, set: 3, time: '00:45:00', calories: 230, volume: 8, exercise: Exercise.find_by(name: 'Bent-over Row'), workout: Workout.find_by(name: 'Pull') },
  { kg: 45, set: 3, time: '00:30:00', calories: 180, volume: 8, exercise: Exercise.find_by(name: 'Lat Pulldown'), workout: Workout.find_by(name: 'Pull') },
  { kg: 20, set: 3, time: '00:35:00', calories: 200, volume: 10, exercise: Exercise.find_by(name: 'Face Pull'), workout: Workout.find_by(name: 'Pull') },

  # Legs Workout Exercises
  { kg: 80, set: 3, time: '00:45:00', calories: 250, volume: 10, exercise: Exercise.find_by(name: 'Squat'), workout: Workout.find_by(name: 'Legs') },
  { kg: 80, set: 3, time: '00:45:00', calories: 300, volume: 10, exercise: Exercise.find_by(name: 'Leg Press'), workout: Workout.find_by(name: 'Legs') },
  { kg: 15, set: 3, time: '00:30:00', calories: 150, volume: 20, exercise: Exercise.find_by(name: 'Lunge'), workout: Workout.find_by(name: 'Legs') },
  { kg: 25, set: 3, time: '00:35:00', calories: 180, volume: 10, exercise: Exercise.find_by(name: 'Leg Curl'), workout: Workout.find_by(name: 'Legs') },
  { kg: 45, set: 3, time: '00:25:00', calories: 100, volume: 12, exercise: Exercise.find_by(name: 'Calf Raise'), workout: Workout.find_by(name: 'Legs') },

  # Cardio Workout Exercises
  { kg: 0, set: 1, time: '00:30:00', calories: 300, volume: 0, exercise: Exercise.find_by(name: 'Running'), workout: Workout.find_by(name: 'Cardio') },
  { kg: 0, set: 1, time: '00:45:00', calories: 400, volume: 0, exercise: Exercise.find_by(name: 'Cycling'), workout: Workout.find_by(name: 'Cardio') },
  { kg: 0, set: 1, time: '00:20:00', calories: 200, volume: 0, exercise: Exercise.find_by(name: 'Jump Rope'), workout: Workout.find_by(name: 'Cardio') },
  { kg: 0, set: 1, time: '00:45:00', calories: 350, volume: 0, exercise: Exercise.find_by(name: 'Rowing'), workout: Workout.find_by(name: 'Cardio') },
  { kg: 0, set: 1, time: '01:00:00', calories: 500, volume: 0, exercise: Exercise.find_by(name: 'Swimming'), workout: Workout.find_by(name: 'Cardio') },

  # Core Workout Exercises
  { kg: 0, set: 3, time: '00:30:00', calories: 300, volume: 0, exercise: Exercise.find_by(name: 'Plank'), workout: Workout.find_by(name: 'Core') },
  { kg: 0, set: 4, time: '00:20:00', calories: 200, volume: 0, exercise: Exercise.find_by(name: 'Russian Twists'), workout: Workout.find_by(name: 'Core') },
  { kg: 0, set: 3, time: '00:25:00', calories: 250, volume: 0, exercise: Exercise.find_by(name: 'Bicycle Crunches'), workout: Workout.find_by(name: 'Core') },
  { kg: 0, set: 4, time: '00:15:00', calories: 150, volume: 0, exercise: Exercise.find_by(name: 'Leg Raises'), workout: Workout.find_by(name: 'Core') },
  { kg: 0, set: 5, time: '00:20:00', calories: 200, volume: 0, exercise: Exercise.find_by(name: 'Leg Raises'), workout: Workout.find_by(name: 'Core') },

  # Stretching Workout Exercises
  { kg: 0, set: 1, time: '00:05:00', calories: 50, volume: 0, exercise: Exercise.find_by(name: 'Neck Stretch'), workout: Workout.find_by(name: 'Stretching') },
  { kg: 0, set: 1, time: '00:05:00', calories: 50, volume: 0, exercise: Exercise.find_by(name: 'Shoulder Stretch'), workout: Workout.find_by(name: 'Stretching') },
  { kg: 0, set: 1, time: '00:05:00', calories: 50, volume: 0, exercise: Exercise.find_by(name: 'Triceps Stretch'), workout: Workout.find_by(name: 'Stretching') },
  { kg: 0, set: 1, time: '00:05:00', calories: 50, volume: 0, exercise: Exercise.find_by(name: 'Chest Stretch'), workout: Workout.find_by(name: 'Stretching') },
  { kg: 0, set: 1, time: '00:05:00', calories: 50, volume: 0, exercise: Exercise.find_by(name: 'Side Stretch'), workout: Workout.find_by(name: 'Stretching') },

  # Mobility Workout Exercises
  { kg: 0, set: 3, time: '00:10:00', calories: 100, volume: 0, exercise: Exercise.find_by(name: 'Cat-Cow Stretch'), workout: Workout.find_by(name: 'Mobility') },
  { kg: 0, set: 3, time: '00:15:00', calories: 150, volume: 0, exercise: Exercise.find_by(name: 'World’s Greatest Stretch'), workout: Workout.find_by(name: 'Mobility') },
  { kg: 0, set: 4, time: '00:12:00', calories: 120, volume: 0, exercise: Exercise.find_by(name: 'Hip Circles'), workout: Workout.find_by(name: 'Mobility') },
  { kg: 0, set: 3, time: '00:10:00', calories: 100, volume: 0, exercise: Exercise.find_by(name: 'Shoulder Pass-Throughs'), workout: Workout.find_by(name: 'Mobility') },
  { kg: 0, set: 4, time: '00:15:00', calories: 150, volume: 0, exercise: Exercise.find_by(name: 'Thoracic Spine Rotations'), workout: Workout.find_by(name: 'Mobility') }
])

puts "seed finished"
