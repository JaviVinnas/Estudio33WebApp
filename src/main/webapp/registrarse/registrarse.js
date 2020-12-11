//hacer campo del pin obligatorio si el campo de la tarjeta tiene texto
$('#tarjeta').on('input', function () {
    console.log("cambio");
    if (!$('#tarjeta').val()) {
        console.log('no hay nada');
        $('#pin_tarjeta').prop('required', false);
    } else {
        console.log('hay algo');
        $('#pin_tarjeta').prop('required', true);
    }
})