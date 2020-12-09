const fuente_fijada = [false, false, false, false];
const popup = document.getElementById("mi_pop_up");
const cerrar = document.getElementsByClassName("cerrar")[0];
const contenido_popup = document.getElementsByClassName("contenido_pop_up")[0];


//ASOCIAMOS EVENTOS
//llamadas a la función que fija la fuente
document
    .getElementById("easter_egg1")
    .addEventListener("dblclick", fijar_fuente_1);
document
    .getElementById("easter_egg2")
    .addEventListener("dblclick", fijar_fuente_2);
document
    .getElementById("easter_egg3")
    .addEventListener("dblclick", fijar_fuente_3);
document
    .getElementById("easter_egg4")
    .addEventListener("dblclick", fijar_fuente_4);
//la llamada a la función easter egg
document.getElementById("easter_egg1").addEventListener("dblclick", easter_egg);
document.getElementById("easter_egg2").addEventListener("dblclick", easter_egg);
document.getElementById("easter_egg3").addEventListener("dblclick", easter_egg);
document.getElementById("easter_egg4").addEventListener("dblclick", easter_egg);
//evento de cerrar el popup
cerrar.addEventListener("click", cerrar_popup);


//fija la fuente (se le quita el hover)
function fijar_fuente(num) {
    let elemento = document.getElementById("easter_egg" + num);
    //si el texto no está fijado todavía
    if (!fuente_fijada[num - 1]) {
        elemento.classList.remove("hover");
        elemento.style.fontFamily = "Trueno Extrabold Italic";
        fuente_fijada[num - 1] = true;
    } else {
        elemento.classList.add("hover");
        elemento.removeAttribute("style")
        fuente_fijada[num - 1] = false;
    }
}

function fijar_fuente_1() {
    fijar_fuente(1);
}

function fijar_fuente_2() {
    fijar_fuente(2);
}

function fijar_fuente_3() {
    fijar_fuente(3);
}

function fijar_fuente_4() {
    fijar_fuente(4);
}


function easter_egg() {
    //si todos están rellenos
    if (fuente_fijada.every((e) => e === true)) {
        //desplegamos el banner
        abrir_popup();
        //desmarcamos todos al final
        fuente_fijada.forEach(function (currentValue, index) {
            fijar_fuente(index + 1);
        });
    }
}

function cerrar_popup() {
    popup.style.animation = "blur .8s cubic-bezier(0.165, 0.84, 0.44, 1)";
    contenido_popup.style.animation = "reducir .8s cubic-bezier(0.165, 0.84, 0.44, 1)";
    setTimeout(() => {
        popup.style.display = "none"
    }, 795);

}

function abrir_popup() {
    popup.style.display = "block";
    popup.style.animation = "unblur .8s cubic-bezier(0.165, 0.84, 0.44, 1)";
    contenido_popup.style.animation = "ampliar .8s cubic-bezier(0.165, 0.84, 0.44, 1)";

}

//---------------------------------------------------------------------------------------------------------------------------------------------------------
//JQUERY -> scroll suave desde saber más hasta la siguiente sección

$(document).ready(function () {
    $('.saber_mas').on("click", function () {
        $('html, body').animate({
            scrollTop: $("#quesomos").offset().top
        }, 700);
    })
})
//------------------------------------------------------------------------------------------
//práctica final
//controlador del dropdown del registro
$(document).ready(function () {
        $(".wrapper_sesion").hover(
            function () {
                $(".dropdown_info").stop(true, true).slideDown('medium');
            },
            function () {
                $(".dropdown_info").stop(true, true).slideUp('medium');
            });
    }
)

