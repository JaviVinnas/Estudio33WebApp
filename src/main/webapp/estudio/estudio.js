onload

document.getElementById('boton_selector_hardware').addEventListener("click", cargarHardware);
document.getElementById('boton_selector_hardware').addEventListener("click", cambiarpaHardware);
document.getElementById('boton_selector_software').addEventListener("click", cambiarpaSoftware);

var btnHardware = document.getElementById('boton_selector_hardware');
var btnSoftware = document.getElementById('boton_selector_software');
var listaHardware = document.getElementById('hardware');
var listaSoftware = document.getElementById('software');


//-----------------------------------------------------------------------------------------------------------
//Añadimos el comportamiento de ver hardware cuando se pulsa hardware y ver software cuando se pulsan sus botones respectivamente

function cambiarpaHardware() {
    btnHardware.style.border = "10px solid var(--color-fondo)"
    btnHardware.style.borderRadius = "90px"
    btnSoftware.style.border = "0px"
        //damos visibilidad a las listas oportunas
    listaHardware.style.display = "block"
    listaSoftware.style.display = "none"
}

function cambiarpaSoftware() {
    btnSoftware.style.border = "10px solid var(--color-fondo)"
    btnSoftware.style.borderRadius = "90px"
    btnHardware.style.border = "0px"
        //damos visibilidad a las listas oportunas
    listaSoftware.style.display = "block"
    listaHardware.style.display = "none"
}

//-----------------------------------------------------------------------------------------------------------
//Añadimos el contido a la seccion de hardware
function cargarHardware() {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            //funcion que cambia el HTML de la seccion de hardware
            cargarApartirDeXML(this);
        }
    };
    xhttp.open("GET", "http://localhost:80/hardware.xml", true);
    xhttp.send();
}

function cargarApartirDeXML(xml) {
    let x = xml.responseXML.getElementsByTagName('ELEMENTO_HARDWARE');
    let contenidoHardware = '<ul>';
    for (let i = 0; i < x.length; i++) {
        let nombre = x[i].getElementsByTagName("NOMBRE")[0].childNodes[0].nodeValue;
        console.log(nombre);
        let ruta_imagen = x[i].getElementsByTagName("RUTA_IMAGEN")[0].childNodes[0].nodeValue;
        console.log(ruta_imagen);
        let link = x[i].getElementsByTagName("LINK")[0].childNodes[0].nodeValue;
        console.log(link);
        contenidoHardware += '<li class="elemento_hardware">';
        contenidoHardware += "<img src='" + ruta_imagen + "' alt='" + nombre + "' height='100' width='100'>" + nombre;
        contenidoHardware += "<a href='" + link + "'>Ver en la web</a>"
        contenidoHardware += '</li>';
    }
    contenidoHardware += '<ul>';
    listaHardware.innerHTML = contenidoHardware
}