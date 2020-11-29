function confirmFunction() {
    swal({
        title: "Confirmar Accion",
        text: "Se realizara la accion correspondiente",
        showCancelButton: true,
        confirmButtonColor: '#f7505a',
        cancelButtonColor: '#f7505a',
        confirmButtonText: "SI",
        cancelButtonText: "NO"

    }).then(function() {
        $('#txt_test').val(idtema);
        $('#formTest').submit();
    })
}