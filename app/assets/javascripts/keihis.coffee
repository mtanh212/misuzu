# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(document).on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
#    $(this).closest('fieldset').remove()
    event.preventDefault()

  $(document).on 'click', '.remove_row', (event) ->
    $(this).closest('tr').find('.check-remove').val('1')
    $(this).closest('tr').hide()
    event.preventDefault()

  $(document).on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $(document).on 'click', '.add_row', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#keihi-table').find('tr').last().after($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    
  $(document).on 'focus', '.datepicker', (event) ->
    $(this).datetimepicker({
      format: 'YYYY/MM/DD',
      widgetPositioning: {
        horizontal: 'left'
      }
      ,showTodayButton: true
      ,showClear: true
#    //,daysOfWeekDisabled:[0,6]
    ,calendarWeeks: true,
    keyBinds: false,
    focusOnShow: false

    })
    event.preventDefault()
  
  $(document).on 'click', '.search-click', (event) ->
    $('#kaisha-search-modal').modal('show');
    event.preventDefault()