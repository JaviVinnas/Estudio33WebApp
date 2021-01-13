//hacer campo del pin obligatorio si el campo de la tarjeta tiene texto


$('#tarjeta').on('input', function () {
    console.log("cambio");
    if (!$('#tarjeta').val()) {
        console.log('no hay nada');
        $('#pin_tarjeta').prop('required', false);
        $('#pin_tarjeta').prop('disabled', true);
    } else {
        console.log('hay algo');
        $('#pin_tarjeta').prop('required', true);
        $('#pin_tarjeta').prop('disabled', false);
    }
})

//un número de dos cifras como mucho se le añade un 0 si no fuera bien
function numero_formatted(numero) {
    if(numero.toString().length < 2){
        return '0' + numero.toString()
    }else {
        return numero.toString()
    }

}

$(document).ready(function () {

    let hoy = new Date();

    let fecha_mas_antigua = (hoy.getFullYear()-120)+'-'+ numero_formatted(hoy.getMonth()+1)+'-'+numero_formatted(hoy.getDate());
    let fecha_mas_reciente = (hoy.getFullYear()-18)+'-'+numero_formatted(hoy.getMonth()+1)+'-'+numero_formatted(hoy.getDate());
    let selector_fecha = $('input[type="date"]');

    console.log('cambiado')

    selector_fecha.attr("min", fecha_mas_antigua);
    selector_fecha.attr("max", fecha_mas_reciente);
})