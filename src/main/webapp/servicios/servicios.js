pr1 = document.getElementById("pregunta_respuesta1");
pr2 = document.getElementById("pregunta_respuesta2");
pr3 = document.getElementById("pregunta_respuesta3");

pr1.addEventListener("mouseover", desvelar_respuesta_1);
pr2.addEventListener("mouseover", desvelar_respuesta_2);
pr3.addEventListener("mouseover", desvelar_respuesta_3);

pr1.addEventListener("mouseout", ocultar_respuesta_1);
pr2.addEventListener("mouseout", ocultar_respuesta_2);
pr3.addEventListener("mouseout", ocultar_respuesta_3);

function desvelar_respuesta_1() {
    desvelar_respuesta(0);
}

function desvelar_respuesta_2() {
    desvelar_respuesta(1);
}

function desvelar_respuesta_3() {
    desvelar_respuesta(2);
}

function ocultar_respuesta_1() {
    ocultar_respuesta(0);
}

function ocultar_respuesta_2() {
    ocultar_respuesta(1);
}

function ocultar_respuesta_3() {
    ocultar_respuesta(2);
}

function get_pregunta_respuesta(index) {
    return {
        pregunta: document.getElementById("pregunta" + (index + 1)),
        respuesta: document.getElementById("respuesta" + (index + 1)),
    };
}

function desvelar_respuesta(index) {
    get_pregunta_respuesta(index).pregunta.style.display = "none";
    get_pregunta_respuesta(index).respuesta.style.display = "block";
}

function ocultar_respuesta(index) {
    get_pregunta_respuesta(index).pregunta.style.display = "block";
    get_pregunta_respuesta(index).respuesta.style.display = "none";
}

//------------------------------------------------------------------------------------------------------------------------
//JQUERY -> Pantalla de carga de las tarifas

$(window).on('load', function () {
    $('.outer-loader').delay(500).fadeOut('slow');
});

