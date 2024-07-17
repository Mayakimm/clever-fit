document.addEventListener('DOMContentLoaded', function() {
  var modal = document.getElementById("myModal");
  var btn = document.getElementById("chooseWorkoutButton");
  var span = document.getElementsByClassName("close")[0];

  btn.addEventListener('click', function(event) {
      event.preventDefault();
      modal.style.display = "flex";
  });

  span.onclick = function() {
      modal.style.display = "none";
  };

  window.onclick = function(event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  };

  document.getElementById("workoutType1").onclick = function() {
      console.log("Workout Type 1 selected");
      modal.style.display = "none";
  };

  document.getElementById("workoutType2").onclick = function() {
      console.log("Workout Type 2 selected");
      modal.style.display = "none";
  };
});
