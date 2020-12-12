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

//todo: acciona el input del form de ir a la tienda

//todo: acciona el input de bienvenido pepe con cerrar sesion
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

