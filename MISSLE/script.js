var bgcolor;
var button;

function setup() {
    canvas = createCanvas(200,200);
    bgcolor = color(200);
    button = createButton("go");
    button.mousePressed(changeColor);
}

function changeColor() {
    bgcolor = color(random(255))
}


function mousePressed() { 
        document.getElementById("yo").innerHTML = "ACTUAL WARNING";
}

function move() {
    var elem = document.getElementById("myBar"); 
    var width = 1;
    var id = setInterval(frame, 10);
    function frame() {
        if (width >= 100) {
            clearInterval(id);
        } else {
            width++; 
            elem.style.width = width + '%'; 
        }
    }
}


function myFunction() {
    document.body.style.backgroundColor = "yellow";
    }
