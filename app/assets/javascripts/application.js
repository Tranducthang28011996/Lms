// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require typeahead
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

var ready;
ready = function() {
    $("#sidebar-wrapper #menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    $("#course_search").typeahead({
      name: 'course',
      hint: null,
      highlight: null,
      limit: 10,
      remote: '/courses/auto_complete?query=%QUERY'
    });
};

// $(document).ready(ready);
// $(document).on('page:load', ready);
$(document).on('turbolinks:load', ready);
