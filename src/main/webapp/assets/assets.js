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