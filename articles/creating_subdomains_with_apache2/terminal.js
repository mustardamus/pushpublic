$(document).ready(function() {
  var commands = $('<ol/>').appendTo('#commands');
  var terminalOutput = $('#terminal-output');
  
  
  $('<span/>', {
    text: '~ $ ',
    'class': 'cream' //$$ bill ya'll
  }).prependTo($('.command', terminalOutput));
  
  
  $('li.command', terminalOutput).each(function(index) {
    var command = $(this).html();
    var command = command.substr(command.indexOf('</span>') + 7);
    
    $('<li/>', {
      html: $('<a/>', {
        text: command,
        href: '#command-'+index,
        data: {
          'commandTop': $('li.command:eq('+index+')', terminalOutput).offset().top - 374
        },
        click: function() {
          var el = $(this);
          
          terminalOutput.animate({
            scrollTop: el.data('commandTop')
          }, 200);

          el.parent().parent().children('li').children('a').removeClass();
          el.addClass('current');
          
          return false;
        }
      })
    }).appendTo(commands);
  });
  
  $('a:first', commands).addClass('current');
  
  
  $('#toggleoutput').toggle(function() {
    $(this).text('Show Output');
    $('li.output', terminalOutput).slideUp(300);
  }, function() {
    $(this).text('Hide Output');
    $('li.output', terminalOutput).slideDown(300, function() {
      $('.current', commands).click();
    });
  });
});