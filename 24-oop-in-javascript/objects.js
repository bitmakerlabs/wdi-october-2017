var hailCaesar = {
  title: "Hail, Caesar",
  director: "Joel and Ethan Coen",
  cast: [
    {
      name: "George Clooney",
      character: "Some Dude"
    },
    {
      name: "Scarlett Johnassen",
      character: "Some Lady"
    }
  ]
}

function Film(title, director) {
  this.title = title;
  this.director = director;
  this.profit = function() {
    console.log("Profit!");
  }
}
