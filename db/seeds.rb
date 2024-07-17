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

Profile.create!([
  { name: 'John Doe', gender: 'Male', age: 30, goal: 'Weight Loss', address: '123 Main St, London, UK', user: User.first, weight: 80.5, height: 175.0 },
  { name: 'Jane Smith', gender: 'Female', age: 25, goal: 'Muscle Gain', address: '456 Elm St, Paris, France', user: User.second, weight: 65.0, height: 165.0 },
  { name: 'Alice Jones', gender: 'Female', age: 28, goal: 'Maintain Fitness', address: '789 Oak St, Berlin, Germany', user: User.third, weight: 70.0, height: 170.0 },
  { name: 'Bob Brown', gender: 'Male', age: 35, goal: 'Cardio Fitness', address: '101 Pine St, Rome, Italy', user: User.fourth, weight: 85.0, height: 180.0 },
  { name: 'Charlie Wilson', gender: 'Male', age: 40, goal: 'General Health', address: '202 Maple St, New York, USA', user: User.fifth, weight: 90.0, height: 175.0 }
])

Exercise.create!([
  # Push Exercises
  { name: 'Push-up', video_url: 'https://youtu.be/0pkjOk0EiAk?si=MzN0X159QPBp0b3L', description: 'A basic push-up exercise', instruction: 'Keep your body straight', equipment: 'None', muscle_group: 'Chest', met_value: 8.0 },
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
  { name: 'Yoga Class', address: 'Studio 1, London, UK', date: '2024-07-20', time: '10:00', limit_of_students: 20, description: 'A relaxing yoga class', contact: 'contact@yoga.com', user: User.first },
  { name: 'HIIT Class', address: 'Gym B, Paris, France', date: '2024-07-21', time: '11:00', limit_of_students: 15, description: 'High-intensity interval training', contact: 'contact@hiit.com', user: User.second },
  { name: 'Pilates Class', address: 'Fitness Center, Berlin, Germany', date: '2024-07-22', time: '12:00', limit_of_students: 10, description: 'A core-strengthening pilates class', contact: 'contact@pilates.com', user: User.third },
  { name: 'Spin Class', address: 'Cycling Studio, Rome, Italy', date: '2024-07-23', time: '13:00', limit_of_students: 25, description: 'An energetic spin class', contact: 'contact@spin.com', user: User.fourth },
  { name: 'Zumba Class', address: 'Dance Hall, New York, USA', date: '2024-07-24', time: '14:00', limit_of_students: 30, description: 'A fun Zumba dance class', contact: 'contact@zumba.com', user: User.fifth }
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
  { kg: 0, set: 3, time: '00:30:00', calories: 150, volume: 0, exercise: Exercise.find_by(name: 'Push-up'), workout: Workout.find_by(name: 'Push') },
  { kg: 20, set: 4, time: '00:45:00', calories: 200, volume: 80, exercise: Exercise.find_by(name: 'Bench Press'), workout: Workout.find_by(name: 'Push') },
  { kg: 30, set: 4, time: '00:45:00', calories: 220, volume: 120, exercise: Exercise.find_by(name: 'Overhead Press'), workout: Workout.find_by(name: 'Push') },
  { kg: 0, set: 3, time: '00:30:00', calories: 100, volume: 0, exercise: Exercise.find_by(name: 'Tricep Dip'), workout: Workout.find_by(name: 'Push') },
  { kg: 25, set: 4, time: '00:35:00', calories: 210, volume: 100, exercise: Exercise.find_by(name: 'Incline Bench Press'), workout: Workout.find_by(name: 'Push') },

  # Pull Workout Exercises
  { kg: 0, set: 3, time: '00:30:00', calories: 150, volume: 0, exercise: Exercise.find_by(name: 'Pull-up'), workout: Workout.find_by(name: 'Pull') },
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
