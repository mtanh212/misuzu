# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(document).on 'click', '.delete-all', (event) ->
    $('.check-remove').each () ->
      $(this).val('1')
      $(this).closest('tr').hide()
      
      $('#keihihead_交通費合計').val(0);
      $('#keihihead_日当合計').val(0);
      $('#keihihead_宿泊費合計').val(0);
      $('#keihihead_その他合計').val(0);
      $('#keihihead_旅費合計').val(0);
      $('#keihihead_合計').val(0);
      $('#keihihead_過不足').val(0);
      $('#keihihead_仮払金').val(0);
    event.preventDefault()

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
        horizontal: 'left',
        vertical: 'bottom'
      }
      showTodayButton: true,
      showClear: true,
#    //,daysOfWeekDisabled:[0,6]
    calendarWeeks: true,
    keyBinds: false,
    focusOnShow: false

    })
    event.preventDefault()

  $(document).on 'click', '#keihi-table tr', (event) ->
    $('#keihi-table tr.selected').removeClass('selected')
    $(this).addClass('selected')
    event.preventDefault

  $(document).on 'click', '.atesaki-search', (event) ->
    $('#kaisha-search-modal').modal('show')
    event.preventDefault()

  $(document).on 'click', '.job-search', (event) ->
    $('#job_search_modal').modal('show')
    event.preventDefault()

  $('#kaisha-table-modal tbody').on 'click', 'tr', (event) ->
    d = oKaisha_search_modal.row(this).data()
    $('#keihi-table tr.selected').find('.atesaki-name').val(d[1])
  
    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oKaisha_search_modal.$('tr.selected').removeClass('selected')
      oKaisha_search_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

  $('#job_table tbody').on 'click', 'tr', (event) ->
    d = oJob_search_modal.row(this).data()
    $('#keihi-table tr.selected').find('.job-code').val(d[0])
  
    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oJob_search_modal.$('tr.selected').removeClass('selected')
      oJob_search_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

  $(document).on 'click', '.kikan-search', (event) ->
    $('#kikan-search-modal').modal('show')
    event.preventDefault()

  $('#kikan-table-modal tbody').on 'click', 'tr', (event) ->
    d = oKikan_search_modal.row(this).data()
    $('#keihi-table tr.selected').find('.kikan-name').val(d[1])
  
    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oKikan_search_modal.$('tr.selected').removeClass('selected')
      oKikan_search_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

  eki = ''
  $('#eki-table-modal tbody').on 'click', 'tr', (event) ->
    d = oEki_search_modal.row(this).data()
    if eki is '1'
      $('#keihi-table tr.selected').find('.hastu-name').val(d[1])
    else
      $('#keihi-table tr.selected').find('.chaku-name').val(d[1])
      
    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oEki_search_modal.$('tr.selected').removeClass('selected')
      oEki_search_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')
      
  $(document).on 'click', '.hastu-search', (event) ->
    eki = '1'
    $('#eki-search-modal').modal('show')
    event.preventDefault()

  $(document).on 'click', '.chaku-search', (event) ->
    eki = '2'
    $('#eki-search-modal').modal('show')
    event.preventDefault()

#  init modal table
  oShonin_search_modal = $('#shonin-table-modal').DataTable({
    "pagingType": "simple_numbers"
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }})
  
  $('#shonin-table-modal tbody').on 'click', 'tr', (event) ->
    d = oShonin_search_modal.row(this).data()
    $('.shonin').val(d[1])

    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oShonin_search_modal.$('tr.selected').removeClass('selected')
      oShonin_search_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

  $(document).on 'click', '.shonin-search', (event) ->
    $('#shonin-search-modal').modal('show')
    event.preventDefault()

  oShonin_table = $('.shonin-table').DataTable({
    "pagingType": "simple_numbers",
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    },
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 13 ]},
      {
        "targets": [13],
        "width": '4%'
      }
    ]
  })

  $('.shonin-table').on( 'click', 'tr',  () ->
    d = oShonin_table.row(this).data()
    $('#jobmaster_ユーザ番号').val(d[0])
    $('#jobmaster_ユーザ名').val(d[1])

    if $(this).hasClass('selected')
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oShonin_table.$('tr.selected').removeClass('selected')
      oShonin_table.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')
  )

  $(document).on 'focus', '#search', (event) ->
    $(this).datetimepicker({
      format: 'YYYY/MM/DD',
      widgetPositioning: {
        horizontal: 'left',
        vertical: 'bottom'
      }
      showTodayButton: true,
      showClear: true,
#    //,daysOfWeekDisabled:[0,6]
      calendarWeeks: true,
      keyBinds: false,
      focusOnShow: false

    })
    event.preventDefault()

  $("form").on("keypress",  (e) ->
    if (e.keyCode == 13)
      false
  )
