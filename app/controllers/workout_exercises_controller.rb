# class WorkoutExercisesController < ApplicationController
#   before_action :set_workout_exercise, only: [:show, :stop]
#   def show
#     #for stopwatch and calories burnt
#     @profile = current_user.profile
#     @day_summary = @profile.day_summaries.find_by(date: Date.today)
#     @total_calories = @workout_exercise.calories
#     @duration = @workout_exercise.time.strftime("%M").to_f
#     @calories_burnt_per_second = (@total_calories / @duration) / 60


#     @current_workout_exercises = @workout_exercise.workout.workout_exercises
#     @current_index = @current_workout_exercises.find_index(@workout_exercise)
#     @current_exercise = @current_workout_exercises[@current_index].exercise
#     @max_index = @current_workout_exercises.count - 1

#     @workout = @workout_exercise.workout
#   end

#   def stop
#     @profile = current_user.profile
#     @day_summary = @profile.day_summaries.find_by(date: Date.today)
#     @day_summary.update(end_time: Time.current)

#     redirect_to summary_workout_path(@workout_exercise.workout)
#   end

#   def next_set
#     # render json: {data: 'test'}
#   end

#   private
#   def set_workout_exercise
#     @workout_exercise = WorkoutExercise.find(params[:id])
#   end

#   def day_summary_params
#     params.require(:day_summary).permit(:date, :start_time, :end_time, :goal, :city, :address, :height, :weight)
#   end
# end

class WorkoutExercisesController < ApplicationController
  before_action :set_workout_exercise, only: [:show, :stop, :update_last_time]

  def show
    @workout_exercise = WorkoutExercise.find(params[:id])
    @profile = current_user.profile
    @day_summary = @profile.day_summaries.find_or_create_by(date: Date.today)
    @total_calories = @workout_exercise.calories
    @duration = @workout_exercise.time.strftime("%M").to_f
    @calories_burnt_per_second = (@total_calories / @duration) / 60

    @total_calories_burnt = calculate_total_calories_burnt(@day_summary, @calories_burnt_per_second)

    @current_workout_exercises = @workout_exercise.workout.workout_exercises
    @current_index = @current_workout_exercises.find_index(@workout_exercise)
    @current_exercise = @current_workout_exercises[@current_index].exercise
    @max_index = @current_workout_exercises.count - 1

    @workout = @workout_exercise.workout
    binding.pry
  end

  def stop
    @profile = current_user.profile
    @day_summary = @profile.day_summaries.find_by(date: Date.today)
    @total_calories = @workout_exercise.calories
    @duration = @workout_exercise.time.strftime("%M").to_f
    @calories_burnt_per_second = (@total_calories / @duration) / 60
    @total_calories_burnt = calculate_total_calories_burnt(@day_summary, @calories_burnt_per_second)
    @day_summary.update(end_time: Time.current, calories_burnt: @total_calories_burnt)


    redirect_to summary_workout_path(@workout_exercise.workout)
  end

  def update_last_time
    @profile = current_user.profile
    @day_summary = @profile.day_summaries.find_by(date: Date.today)
    @total_calories = @workout_exercise.calories
    @duration = @workout_exercise.time.strftime("%M").to_f
    @calories_burnt_per_second = (@total_calories / @duration) / 60
    if @day_summary.present?
      @total_calories_burnt = calculate_total_calories_burnt(@day_summary, @calories_burnt_per_second)
      @day_summary.update(last_update_time: Time.current, calories_burnt: @total_calories_burnt)
    end

    next_exercise_id = @workout_exercise.id.to_i + 1
    redirect_to workout_exercise_path(next_exercise_id)
  end

  private

  def set_workout_exercise
    @workout_exercise = WorkoutExercise.find(params[:id])
  end

  def calculate_total_calories_burnt(day_summary, calories_burnt_per_second)
    last_update_time = day_summary.last_update_time || day_summary.start_time
    elapsed_seconds = (Time.current - last_update_time).to_i

    accumulated_calories = day_summary.calories_burnt || 0
    additional_calories = calories_burnt_per_second * elapsed_seconds

    total_calories_burnt = accumulated_calories + additional_calories
    day_summary.update(calories_burnt: total_calories_burnt, last_update_time: Time.current)

    total_calories_burnt
  end
end
