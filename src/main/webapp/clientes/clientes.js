const artistas = document.getElementById('artistas');

window.onload = cargaArtistas;

function cargaArtistas() {
    let xhttp = new XMLHttpRequest()
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            cargarDesdeJSON(this)
            this.responseText
        }
    }
    xhttp.open("GET", 'http://localhost:80/clientes_estudio.json', true);
    xhttp.send();
}



function cargarDesdeJSON(respuesta_servidor) {
    //nuestro archivo JSON
    let json = JSON.parse(respuesta_servidor.responseText);
    let txt = "";
    //recorremos cada artista
    for (let x in json.artistas) {
        txt += "<article class='ficha_artista'>";
        txt += "<a href='" + json.artistas[x].link + "' target='_blank'>";
        txt += "<img src='" + json.artistas[x].ruta_imagen + "' alt='" + json.artistas[x].nombre + "' width='300' height='400'>";
        txt += "</a>";
        txt += "<p class='texto_nombre_artista'>" + json.artistas[x].nombre.toUpperCase() + ".</p>";
        txt += "<p class='texto_cita_artista'>" + "\"" + json.artistas[x].cita + "\"" + "</p>"
        txt += "</article>"
    }
    artistas.innerHTML = txt;
}