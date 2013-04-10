# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#ghost_company').autocomplete
    source: "/company_lists",
    messages: {
        noResults: '',
        results: ''
    }

jQuery ->
  $('#ghost_school').autocomplete
    source: "/school_lists",
    messages: {
        noResults: '',
        results: ''
    }