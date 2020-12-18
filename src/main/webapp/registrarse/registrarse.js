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

$(document).ready(function () {

    let hoy = new Date();

    let fecha_mas_antigua = (hoy.getFullYear()-120)+'-'+(hoy.getMonth()+1)+'-'+hoy.getDate();
    let fecha_mas_reciente = (hoy.getFullYear()-18)+'-'+(hoy.getMonth()+1)+'-'+hoy.getDate();
    let selector_fecha = $('input[type="date"]');

    selector_fecha.attr("min", fecha_mas_antigua);
    selector_fecha.attr("max", fecha_mas_reciente);
})