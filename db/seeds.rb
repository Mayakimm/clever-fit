# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Exercise.destroy_all
WorkoutExercise.destroy_all
Workout.destroy_all
GroupClass.destroy_all
Profile.destroy_all
User.destroy_all

User.create!([
  { email: 'john.doe@example.com', password: 'password1', admin: false },
  { email: 'jane.smith@example.com', password: 'password2', admin: false },
  { email: 'alice.jones@example.com', password: 'password3', admin: false },
  { email: 'bob.brown@example.com', password: 'password4', admin: true },
  { email: 'charlie.wilson@example.com', password: 'password5', admin: false }
])

def calculate_xp(total_kg_lifted, duration_minutes)
  xp_per_kg = 2.5
  xp_per_minute = 1
  total_xp = (total_kg_lifted * xp_per_kg) + (duration_minutes * xp_per_minute)
  total_xp.round
end

Profile.create!([
  { name: 'John Doe', gender: 'Male', age: 30, goal: 'Weight Loss', address: '123 Main St, London, UK', user: User.first, weight: 80.5, height: 175.0,
    experience_points: calculate_xp(335, 180), level: 1 },
  { name: 'Jane Smith', gender: 'Female', age: 25, goal: 'Muscle Gain', address: '456 Elm St, Paris, France', user: User.second, weight: 65.0, height: 165.0,
    experience_points: calculate_xp(790, 240), level: 2 },
  { name: 'Alice Jones', gender: 'Female', age: 28, goal: 'Maintain Fitness', address: '789 Oak St, Berlin, Germany', user: User.third, weight: 70.0, height: 170.0,
    experience_points: calculate_xp(510, 200), level: 1 },
  { name: 'Bob Brown', gender: 'Male', age: 35, goal: 'Cardio Fitness', address: '101 Pine St, Rome, Italy', user: User.fourth, weight: 85.0, height: 180.0,
    experience_points: calculate_xp(1010, 300), level: 3 },
  { name: 'Charlie Wilson', gender: 'Male', age: 40, goal: 'General Health', address: '202 Maple St, New York, USA', user: User.fifth, weight: 90.0, height: 175.0,
    experience_points: calculate_xp(750, 270), level: 2 }
])

Exercise.create!([
  # Push Exercises
  { name: 'Push-up', video_url: 'https://youtu.be/0pkjOk0EiAk?si=MzN0X159QPBp0b3L',  description: 'A basic push-up exercise', instruction: 'Keep your body straight', equipment: 'None', muscle_group: 'Chest', met_value: 8.0 },
  { name: 'Bench Press', video_url: 'https://youtu.be/SCVCLChPQFY?si=-3dZtikmwYos8ILy', description: 'A basic bench press exercise', instruction: 'Press the barbell', equipment: 'Barbell', muscle_group: 'Chest', met_value: 9.5 },
  { name: 'Overhead Press', video_url: 'https://youtu.be/F3QY5vMz_6I?si=NHISwEMyZB8a5Bl3', description: 'A basic overhead press exercise', instruction: 'Press the barbell overhead', equipment: 'Barbell', muscle_group: 'Shoulders', met_value: 8.5 },
  { name: 'Tricep Dip', video_url: 'https://youtu.be/6kALZikXxLc?si=fhXaQxZdvN4-uZbb', description: 'A basic tricep dip exercise', instruction: 'Lower your body', equipment: 'Parallel Bars', muscle_group: 'Triceps', met_value: 7.0 },
  { name: 'Incline Bench Press', video_url: 'https://youtu.be/SQutODglAHQ?si=w63K5KDhhtOoQdKi', description: 'An incline bench press exercise', instruction: 'Press the barbell at an incline', equipment: 'Barbell', muscle_group: 'Upper_Chest', met_value: 8.5 },

  # Pull Exercises
  { name: 'Pull-up', video_url: 'https://youtu.be/HRV5YKKaeVw?si=AbS4APZYRg-qqhQ0', description: 'A basic pull-up exercise', instruction: 'Pull yourself up', equipment: 'Pull-up bar', muscle_group: 'Back', met_value: 9.0 },
  { name: 'Deadlift', video_url: 'https://youtu.be/r4MzxtBKyNE?si=JqezkZRbZ9JxQZnD', description: 'A basic deadlift exercise', instruction: 'Lift the barbell from the ground', equipment: 'Barbell', muscle_group: 'Back', met_value: 9.5 },
  { name: 'Bent-over Row', video_url: 'https://youtu.be/7c9QNNinEKw?si=9ayt8DUZwZoHRFZT', description: 'A basic bent-over row exercise', instruction: 'Row the barbell', equipment: 'Barbell', muscle_group: 'Back', met_value: 8.0 },
  { name: 'Lat Pulldown', video_url: 'https://youtu.be/CAwf7n6Luuc?si=7_aKwQwLQXOhuxm1', description: 'A lat pulldown exercise', instruction: 'Pull the bar down', equipment: 'Pulley Machine', muscle_group: 'Back', met_value: 7.5 },
  { name: 'Face Pull', video_url: 'https://youtu.be/rep-qVOkqgk?si=ESqSyA8AnLTbHxe3', description: 'A face pull exercise', instruction: 'Pull the rope towards your face', equipment: 'Pulley Machine', muscle_group: 'Shoulders', met_value: 7.0 },

  # Legs Exercises
  { name: 'Squat', video_url: 'https://youtu.be/xqvCmoLULNY?si=ZFzMf9lKKr6IHdsG', description: 'A basic squat exercise', instruction: 'Keep your back straight', equipment: 'None', muscle_group: 'Quadriceps', met_value: 7.5 },
  { name: 'Leg Press', video_url: 'https://youtu.be/U7nC2u2IR08?si=Jf3Fv9OoYby-xyuF', description: 'A leg press exercise', instruction: 'Press the platform', equipment: 'Leg Press Machine', muscle_group: 'Quadriceps', met_value: 7.0 },
  { name: 'Lunge', video_url: 'https://youtu.be/QOVaHwm-Q6U?si=6vZhLCsBaot89Gzp', description: 'A basic lunge exercise', instruction: 'Step forward and lower your body', equipment: 'None', muscle_group: 'Quadriceps', met_value: 6.5 },
  { name: 'Leg Curl', video_url: 'https://youtu.be/1Tq3QdYUuHs?si=3HqRNuRHCsPv9quL', description: 'A leg curl exercise', instruction: 'Curl your legs', equipment: 'Leg Curl Machine', muscle_group: 'Hamstrings', met_value: 6.0 },
  { name: 'Calf Raise', video_url: 'https://youtu.be/-M4-G8p8fmc?si=1q2fXeX0jE_LS3yk', description: 'A calf raise exercise', instruction: 'Raise your heels', equipment: 'None', muscle_group: 'Calves', met_value: 5.5 },

  # Cardio Exercises
  { name: 'Running', video_url: 'https://youtu.be/BXCqQRm-WCU?si=H7Pf8eANjzCJFxO-', description: 'A basic running exercise', instruction: 'Run at a steady pace', equipment: 'None', muscle_group: 'Cardio', met_value: 9.0 },
  { name: 'Cycling', video_url: 'https://youtu.be/ok7V1pWtRzs?si=1OFxwSCf9vJjE6q4', description: 'A basic cycling exercise', instruction: 'Cycle at a steady pace', equipment: 'Stationary Bike', muscle_group: 'Cardio', met_value: 8.5 },
  { name: 'Jump Rope', video_url: 'https://youtu.be/CE_A3sw13Gg?si=B1RhC5X1WouUlfiM', description: 'A basic jump rope exercise', instruction: 'Jump over the rope', equipment: 'Jump Rope', muscle_group: 'Cardio', met_value: 10.0 },
  { name: 'Rowing', video_url: 'https://youtu.be/GZgfFkJNR0Q?si=44BQnTTPLtRSd6Jf', description: 'A basic rowing exercise', instruction: 'Row at a steady pace', equipment: 'Rowing Machine', muscle_group: 'Cardio', met_value: 8.0 },
  { name: 'Swimming', video_url: 'https://youtu.be/GYuwxcT57mQ?si=h9_v8x43f7EnV9hU', description: 'A basic swimming exercise', instruction: 'Swim at a steady pace', equipment: 'None', muscle_group: 'Cardio', met_value: 10.5 }
])

GroupClass.create!([
  { name: 'Hot Yoga', address: 'Studio 1, London, UK', city: 'London', date: '2024-07-20', time: '10:00', limit_of_students: 20, description: 'Join us for a relaxing hot yoga session where you will be guided through a series of stretches and poses designed to improve flexibility and reduce stress. Suitable for all levels, our experienced instructor, Sarah, will ensure you leave feeling refreshed and rejuvenated.', contact: 'contact@yoga.com', user: User.first, level: 'Beginner' },
  { name: 'Power HIIT', address: 'Gym B, Paris, France', city: 'Paris', date: '2024-07-21', time: '11:00', limit_of_students: 15, description: 'Experience a high-intensity interval training (HIIT) session that will push you to your limits. This class is designed to burn maximum calories in a short amount of time through intense bursts of exercise followed by short recovery periods. Perfect for those looking to increase their fitness level. Led by our expert trainer, John.', contact: 'contact@hiit.com', user: User.second, level: 'All-level' },
  { name: 'Reformer Pilates', address: 'Fitness Center, Berlin, Germany', city: 'Berlin', date: '2024-07-22', time: '12:00', limit_of_students: 10, description: 'Strengthen your core and improve your overall fitness with our reformer pilates class. This session focuses on controlled movements and breathing techniques to enhance your physical strength, flexibility, and posture. Ideal for individuals seeking a balanced and low-impact workout. Your instructor, Emily, is highly skilled in pilates techniques.', contact: 'contact@pilates.com', user: User.third, level: 'Expert' },
  { name: 'Endurance Spin', address: 'Cycling Studio, Rome, Italy', city: 'Rome', date: '2024-07-23', time: '13:00', limit_of_students: 25, description: 'Get ready for an energetic spin class that will leave you feeling exhilarated. Our dynamic instructor, Mark, will lead you through a series of high-energy cycling routines set to motivating music. This class is designed to boost your cardiovascular fitness and endurance.', contact: 'contact@spin.com', user: User.fourth, level: 'Beginner' },
  { name: 'Latin Zumba', address: 'Dance Hall, New York, USA', city: 'New York', date: '2024-07-24', time: '14:00', limit_of_students: 30, description: 'Join our fun and lively Latin Zumba dance class where you can dance your way to fitness. This session combines Latin and international music with dance moves to create an exciting and effective workout. Perfect for anyone who loves to dance and wants to stay in shape. Our talented instructor, Maria, will ensure you have a blast.', contact: 'contact@zumba.com', user: User.fifth, level: 'Intermediate' },
  { name: 'Aerial Yoga', address: 'Studio 2, London, UK', city: 'London', date: '2024-07-25', time: '15:00', limit_of_students: 20, description: 'Experience the unique sensation of aerial yoga where you will perform traditional yoga poses while suspended in the air. This class is led by our expert aerial yoga instructor, Alice, who will help you enhance your flexibility and strength.', contact: 'contact@aerialyoga.com', user: User.first, level: 'Intermediate' },
  { name: 'Advanced HIIT', address: 'Gym C, London, UK', city: 'London', date: '2024-07-26', time: '16:00', limit_of_students: 15, description: 'Push your limits with our advanced HIIT class designed for those who are ready to take their fitness to the next level. Our experienced trainer, David, will guide you through high-intensity intervals for a maximum calorie burn.', contact: 'contact@advancedhiit.com', user: User.second, level: 'Expert' },
  { name: 'Pilates for Beginners', address: 'Fitness Center, London, UK', city: 'London', date: '2024-07-27', time: '17:00', limit_of_students: 10, description: 'Perfect for those new to pilates, this class focuses on the fundamentals of pilates to build a strong foundation. Our instructor, Lisa, has years of experience and will ensure you learn the correct techniques and postures.', contact: 'contact@pilatesbeginners.com', user: User.third, level: 'Beginner' },
  { name: 'Cardio Spin', address: 'Cycling Studio, London, UK', city: 'London', date: '2024-07-28', time: '18:00', limit_of_students: 25, description: 'Join our cardio spin class for an intense workout that focuses on building cardiovascular endurance. Led by our enthusiastic instructor, Paul, this class is perfect for those looking to get their heart rate up and burn calories.', contact: 'contact@cardiospin.com', user: User.fourth, level: 'All-level' },
  ])

Workout.create!([
  { name: 'Push', workout_type: 'Push', user: User.first, start_time: '2024-07-20 08:00:00', end_time: '2024-07-20 09:00:00' },
  { name: 'Pull', workout_type: 'Pull', user: User.second, start_time: '2024-07-21 08:00:00', end_time: '2024-07-21 09:00:00' },
  { name: 'Legs', workout_type: 'Legs', user: User.third, start_time: '2024-07-22 08:00:00', end_time: '2024-07-22 09:00:00' },
  { name: 'Cardio', workout_type: 'Cardio', user: User.fourth, start_time: '2024-07-23 08:00:00', end_time: '2024-07-23 09:00:00' },
  { name: 'Freestyle', workout_type: 'Freestyle', user: User.fifth, start_time: '2024-07-24 08:00:00', end_time: '2024-07-24 09:00:00' }
])

WorkoutExercise.create!([
  # Push Workout Exercises
  { kg: 0, set: 3, time: '00:30:00', calories: 150, volume: 25, exercise: Exercise.find_by(name: 'Push-up'), workout: Workout.find_by(name: 'Push') },
  { kg: 20, set: 4, time: '00:45:00', calories: 200, volume: 80, exercise: Exercise.find_by(name: 'Bench Press'), workout: Workout.find_by(name: 'Push') },
  { kg: 30, set: 4, time: '00:45:00', calories: 220, volume: 120, exercise: Exercise.find_by(name: 'Overhead Press'), workout: Workout.find_by(name: 'Push') },
  { kg: 0, set: 3, time: '00:30:00', calories: 100, volume: 25, exercise: Exercise.find_by(name: 'Tricep Dip'), workout: Workout.find_by(name: 'Push') },
  { kg: 25, set: 4, time: '00:35:00', calories: 210, volume: 100, exercise: Exercise.find_by(name: 'Incline Bench Press'), workout: Workout.find_by(name: 'Push') },

  # Pull Workout Exercises
  { kg: 0, set: 3, time: '00:30:00', calories: 150, volume: 10, exercise: Exercise.find_by(name: 'Pull-up'), workout: Workout.find_by(name: 'Pull') },
  { kg: 50, set: 4, time: '00:45:00', calories: 250, volume: 200, exercise: Exercise.find_by(name: 'Deadlift'), workout: Workout.find_by(name: 'Pull') },
  { kg: 40, set: 4, time: '00:45:00', calories: 230, volume: 160, exercise: Exercise.find_by(name: 'Bent-over Row'), workout: Workout.find_by(name: 'Pull') },
  { kg: 30, set: 3, time: '00:30:00', calories: 180, volume: 90, exercise: Exercise.find_by(name: 'Lat Pulldown'), workout: Workout.find_by(name: 'Pull') },
  { kg: 20, set: 4, time: '00:35:00', calories: 200, volume: 80, exercise: Exercise.find_by(name: 'Face Pull'), workout: Workout.find_by(name: 'Pull') },

  # Legs Workout Exercises
  { kg: 20, set: 4, time: '00:45:00', calories: 250, volume: 80, exercise: Exercise.find_by(name: 'Squat'), workout: Workout.find_by(name: 'Legs') },
  { kg: 60, set: 4, time: '00:45:00', calories: 300, volume: 240, exercise: Exercise.find_by(name: 'Leg Press'), workout: Workout.find_by(name: 'Legs') },
  { kg: 15, set: 3, time: '00:30:00', calories: 150, volume: 45, exercise: Exercise.find_by(name: 'Lunge'), workout: Workout.find_by(name: 'Legs') },
  { kg: 25, set: 4, time: '00:35:00', calories: 180, volume: 100, exercise: Exercise.find_by(name: 'Leg Curl'), workout: Workout.find_by(name: 'Legs') },
  { kg: 10, set: 3, time: '00:25:00', calories: 100, volume: 30, exercise: Exercise.find_by(name: 'Calf Raise'), workout: Workout.find_by(name: 'Legs') },

  # Cardio Workout Exercises
  { kg: 0, set: 1, time: '00:30:00', calories: 300, volume: 0, exercise: Exercise.find_by(name: 'Running'), workout: Workout.find_by(name: 'Cardio') },
  { kg: 0, set: 1, time: '00:45:00', calories: 400, volume: 0, exercise: Exercise.find_by(name: 'Cycling'), workout: Workout.find_by(name: 'Cardio') },
  { kg: 0, set: 1, time: '00:20:00', calories: 200, volume: 0, exercise: Exercise.find_by(name: 'Jump Rope'), workout: Workout.find_by(name: 'Cardio') },
  { kg: 0, set: 1, time: '00:45:00', calories: 350, volume: 0, exercise: Exercise.find_by(name: 'Rowing'), workout: Workout.find_by(name: 'Cardio') },
  { kg: 0, set: 1, time: '01:00:00', calories: 500, volume: 0, exercise: Exercise.find_by(name: 'Swimming'), workout: Workout.find_by(name: 'Cardio') }
])
