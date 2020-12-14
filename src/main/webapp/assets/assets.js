//---------------------------------------------------------------------------------------
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

$(document).ready(function () {
    $('#icono-tienda').click(function () {
        $('#ir_tienda').click();
    })
})


$(document).ready(function () {
    $('#id_usuario').click(function () {
        $('#cerrar_sesion').click();
    })
})


$(document).ready(function () {
    $('#id_usuario').hover(
        function () {
            const $this = $(this); // caching $(this)
            $this.data('defaultText', $this.text());
            $this.text("Cerrar sesion");
        },
        function () {
            const $this = $(this); // caching $(this)
            $this.text($this.data('defaultText'));
        }
    )
})

