// function executeQuery() {
//   $.ajax({
//     url: 'http://swift-sushi-json.herokuapp.com/todos',
//     success: function(data) {
//       var newContent = $(data);
//       $('#show').replaceWith(newContent);
//     }
//   });
  // setTimeout(executeQuery, 8000); // you could choose not to continue on failure...
}


// $( "#dataTable tbody tr" ).on( "click", function() {
//   console.log( $( this ).text() );
// });

$(document).ready(function() {
  // run the first time; all subsequent calls will take care of themselves
  // setTimeout(executeQuery, 8000);

  $(".todos").click(function(){
    $.get('/todos', function(data){
      $(".results").html(data);
    });
  });
  $(".new").click(function(){
    $.get('/new', function(data){
      $(".newForm").html(data);
    });
  });
  $(".closeNew").click(function(){
    $(".newForm").empty();
  });
  $(".closeTodos").click(function(){
    $(".results").empty();
  })
});

