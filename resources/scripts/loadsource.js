function edit(id){
    var ex = $("#"+id);
    $("#code").val(ex.text());
    $("#input").val(JSON.stringify(ex.data("input")));
}

$(document).ready(function() {
    $("#hello").click(function(ev) {
        $.get("/modules/exec.xql", {"q":$("#code").val(),"i":$("#input").val()}, function( data ) {
          $( "#result" ).val( data );
        },"text").fail(function(err) {
            alert(err.responseXML.getElementsByTagName("message")[0].childNodes[0].nodeValue);
          })
    });
});