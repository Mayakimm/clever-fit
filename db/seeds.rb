# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

WorkoutExercise.destroy_all
Workout.destroy_all
Exercise.destroy_all
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
                   { name: 'Push-up', video_url: 'https://youtu.be/0pkjOk0EiAk?si=MzN0X159QPBp0b3L', description: 'A basic push-up exercise', instruction: 'Keep your body straight', equipment: 'None', muscle_group: 'Chest', met_value: 8.0 },
                   { name: 'Squat', video_url: 'https://youtu.be/xqvCmoLULNY?si=ZFzMf9lKKr6IHdsG', description: 'A basic squat exercise', instruction: 'Keep your back straight', equipment: 'None', muscle_group: 'Quadriceps', met_value: 7.5 },
                   { name: 'Pull-up', video_url: 'https://youtu.be/HRV5YKKaeVw?si=AbS4APZYRg-qqhQ0', description: 'A basic pull-up exercise', instruction: 'Pull yourself up', equipment: 'Pull-up bar', muscle_group: 'Back', met_value: 9.0 },
                   { name: 'Bicep Curl', video_url: 'https://youtu.be/ykJmrZ5v0Oo?si=-TSm_mbEaqY6SZkb', description: 'A basic bicep curl exercise', instruction: 'Curl the dumbbells', equipment: 'Dumbbells', muscle_group: 'Arms', met_value: 6.0 },
                   { name: 'Bench Press', video_url: 'https://youtu.be/SCVCLChPQFY?si=-3dZtikmwYos8ILy', description: 'A basic bench press exercise', instruction: 'Press the barbell', equipment: 'Barbell', muscle_group: 'Chest', met_value: 9.5 }
                 ])

GroupClass.create!([
                     { name: 'Yoga Class', address: 'Studio 1, London, UK', date: '2024-07-20', time: '10:00', limit_of_students: 20, description: 'A relaxing yoga class', contact: 'contact@yoga.com', user: User.first },
                     { name: 'HIIT Class', address: 'Gym B, Paris, France', date: '2024-07-21', time: '11:00', limit_of_students: 15, description: 'High-intensity interval training', contact: 'contact@hiit.com', user: User.second },
                     { name: 'Pilates Class', address: 'Fitness Center, Berlin, Germany', date: '2024-07-22', time: '12:00', limit_of_students: 10, description: 'A core-strengthening pilates class', contact: 'contact@pilates.com', user: User.third },
                     { name: 'Spin Class', address: 'Cycling Studio, Rome, Italy', date: '2024-07-23', time: '13:00', limit_of_students: 25, description: 'An energetic spin class', contact: 'contact@spin.com', user: User.fourth },
                     { name: 'Zumba Class', address: 'Dance Hall, New York, USA', date: '2024-07-24', time: '14:00', limit_of_students: 30, description: 'A fun Zumba dance class', contact: 'contact@zumba.com', user: User.fifth }
                   ])

Workout.create!([
                  { name: 'Morning Routine', workout_type: 'Cardio', user: User.first },
                  { name: 'Strength Training', workout_type: 'Strength', user: User.second },
                  { name: 'Evening Yoga', workout_type: 'Flexibility', user: User.third },
                  { name: 'Full Body Workout', workout_type: 'Mixed', user: User.fourth },
                  { name: 'HIIT Session', workout_type: 'HIIT', user: User.fifth }
                ])

WorkoutExercise.create!([
                          { kg: 0, set: 3, time: '00:30:00', calories: 150, exercise: Exercise.first, workout: Workout.first },
                          { kg: 20, set: 4, time: '00:45:00', calories: 200, exercise: Exercise.second, workout: Workout.second },
                          { kg: 0, set: 2, time: '01:00:00', calories: 100, exercise: Exercise.third, workout: Workout.third },
                          { kg: 10, set: 5, time: '00:35:00', calories: 250, exercise: Exercise.fourth, workout: Workout.fourth },
                          { kg: 30, set: 3, time: '00:25:00', calories: 300, exercise: Exercise.fifth, workout: Workout.fifth }
                        ])
