$(document).ready(function() {
  var commands = $('<ol/>').appendTo('#commands');
  var terminalOutput = $('#terminal-output');
  
  $('li.command', terminalOutput).each(function(index) {
    var command = $(this).html();
    var command = command.substr(command.indexOf('</span>') + 8);
    
    $('<li/>', {
      html: $('<a/>', {
        text: command,
        href: '#command-'+index,
        data: {
          'commandTop': $('li.command:eq('+index+')', terminalOutput).offset().top - 374
        },
        click: function() {
          terminalOutput.animate({
            scrollTop: $(this).data('commandTop')
          }, 200);

          return false;
        }
      })
    }).appendTo(commands);
  });
  
  
  $('#toggleoutput').toggle(function() {
    $(this).text('Show Output');
    $('li.output', terminalOutput).slideUp(300);
  }, function() {
    $(this).text('Hide Output');
    $('li.output', terminalOutput).slideDown(300);
  });
  
  
  $('<span/>', {
    text: '~ $ ',
    'class': 'cream' //$$ bill ya'll
  }).prependTo($('.command', terminalOutput));
});