function executeQuery() {
  $.ajax({
    url: 'http://swift-sushi-json.herokuapp.com/todos',
    success: function(data) {
      var newContent = $(data);
      $('#show').replaceWith(newContent);
    }
  });
  setTimeout(executeQuery, 5000); // you could choose not to continue on failure...
}

$(document).ready(function() {
  // run the first time; all subsequent calls will take care of themselves
  setTimeout(executeQuery, 5000);
});