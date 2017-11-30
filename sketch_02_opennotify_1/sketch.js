var lineX = 0;
var url = 'http://api.open-notify.org/iss-pass.json?lat=LAT&lon=LON';
var issX;
var issY;

function setup() {
  createCanvas(600, 400);
  // loadJSON(url, gotData, 'jsonp'); //gotDATA is callback
  setInterval(askISS, 1000);
}

function askISS() {
  loadJSON(url,gotData,'jsonp');
}

function gotData(data) { //data - parameter/argument

  var lat = data.request.latitude;
  var lon = data.request.longitude;
  issX = map(lat,-90,90,0,width);
  issY = map(lon,-90,90,height);

  println(data.iss_position.latitude);
}

function draw() {
  background(51);
  fill(255);
  ellipse(issX, issY, 24, 24);
  stroke(255);
  line(lineX, 0, lineX, height);
  lineX = lineX + 5;
  if (lineX > width) {
    lineX = 0;
  }




}