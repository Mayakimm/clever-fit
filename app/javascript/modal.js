document.addEventListener('DOMContentLoaded', function() {
  var modal = document.getElementById("myModal");
  var btn = document.getElementById("chooseWorkoutButton");
  var span = document.getElementsByClassName("close")[0];

  if (modal && btn && span) {
    btn.addEventListener('click', function(event) {
      event.preventDefault();
      modal.style.display = "block";
    });

    span.addEventListener('click', function() {
      modal.style.display = "none";
    });

    window.addEventListener('click', function(event) {
      if (event.target === modal) {
        modal.style.display = "none";
      }
    });

    document.getElementById("workoutType1").addEventListener('click', function() {
      console.log("Workout Type 1 selected");
      modal.style.display = "none";
    });

    document.getElementById("workoutType2").addEventListener('click', function() {
      console.log("Workout Type 2 selected");
      modal.style.display = "none";
    });

    document.getElementById("workoutType3").addEventListener('click', function() {
      console.log("Workout Type 3 selected");
      modal.style.display = "none";
    });

    document.getElementById("workoutType4").addEventListener('click', function() {
      console.log("Workout Type 4 selected");
      modal.style.display = "none";
    });

    document.getElementById("workoutType5").addEventListener('click', function() {
      console.log("Workout Type 5 selected");
      modal.style.display = "none";
    });
  } else {
    console.error("Modal elements not found.");
  }
});
