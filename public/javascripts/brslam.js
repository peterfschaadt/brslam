/* DO NOT MODIFY. This file was compiled Tue, 28 Feb 2012 03:46:52 GMT from
 * /Users/peter/code/ruby/rails/brslam/app/coffeescripts/brslam.coffee
 */

(function() {

  $(document).ready(function() {
    var preview;
    preview = $('#preview-url');
    return $('#url-url').keyup(function() {
      var current_value;
      current_value = $.trim(this.value);
      if (current_value === '') {
        return preview.hide().attr('src', '');
      } else {
        return preview.show().attr('src', current_value);
      }
    });
  });

}).call(this);
