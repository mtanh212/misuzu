# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.date-search').datetimepicker({
    format: 'YYYY/MM',
    viewMode: 'months',
    keyBinds: false,
    focusOnShow: false
  })

  $('.date-edit').datetimepicker({
    format: 'YYYY/MM/DD',
#   //inline: true,
#   //widgetParent: 'container-fluid',
    showTodayButton: true,
#   //showClear: true,
#   //,daysOfWeekDisabled:[0,6]
#   //calendarWeeks: true,
    keyBinds: false,
    focusOnShow: false
  })

  $('#kintai_出勤時刻1').datetimepicker({
    format: 'HH:mm',
    showClear: true,
    showTodayButton: true,
    sideBySide: true,
#  //,daysOfWeekDisabled:[0,6]
#    calendarWeeks: true,
#  //allowInputToggle: true,
    toolbarPlacement: 'top',
    keyBinds: false,
    focusOnShow: false
  })

  $('#kintai_退社時刻1').datetimepicker({
    format: 'HH:mm',
    showClear: true,
    showTodayButton: true,
    sideBySide: true,
#  //,daysOfWeekDisabled:[0,6]
    calendarWeeks: true,
#  //allowInputToggle: true,
    toolbarPlacement: 'top',
    keyBinds: false,
    focusOnShow: false
  })

  status = 0
  $(document).on 'click', '.refer-joutai', (event) ->
    $('#joutai_search_modal').modal('show')
#    status = 1
    event.preventDefault()

#  $(document).on 'click', '.status2', (event) ->
#    $('#joutai_search_modal').modal('show')
#    status = 2
#    event.preventDefault()
#
#  $(document).on 'click', '.status3', (event) ->
#    $('#joutai_search_modal').modal('show')
#    status = 3
#    event.preventDefault()

  oJoutai_search_modal = $('#joutai_table').DataTable({
    "pagingType": "simple_numbers"
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }})

  $('#joutai_table tbody').on 'click', 'tr', (event) ->
    d = oJoutai_search_modal.row(this).data()
    $('#kintai_状態1').val(d[0])
    $('.joutai-code-hint').text(d[1])
    if d[1] == '振休'
      $('#joutai_search_modal').modal('hide')
      $('#daikyu_search_modal').modal('show')

    #    switch status
#      when 1 then $('.status1-code').val(d[0])
#      when 2 then $('.status2-code').val(d[0])
#      when 3 then $('.status3-code').val(d[0])

    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oJoutai_search_modal.$('tr.selected').removeClass('selected')
      oJoutai_search_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

#  $('.kintai-sum').click () ->
#    jQuery.ajax({
#      url: '/kintais/summary_kintai',
#      data: {id: 'kintaisum'},
#      type: "POST",
#      success: (data) ->
#        $('.sum1').text(data.sum1)
#        $('.sum2').text(data.sum2)
#        $('.sum3').text(data.sum3)
#        $('.sum4').text(data.sum4)
#        $('.sum5').text(data.sum5)
#        $('.sum6').text(data.sum6)
#      failure: () ->
#    })

  $.getJSON('/kintais/matching_date_return', (data) ->
    $('.sum1').text(data.summary.sum1)
    $('.sum2').text(data.summary.sum2)
    $('.sum3').text(data.summary.sum3)
    $('.sum4').text(data.summary.sum4)
    $('.sum5').text(data.summary.sum5)
    $('.sum6').text(data.summary.sum6)
    $('.sum7').text(data.summary.sum7)
  )

  $('#finish-input').click () ->
    date = $('#kintai_日付').val()
    jQuery.ajax({
      url: '/kintais/finish_input',
      data: {id: 'finish_input', date: date, checked: $(this).prop('checked')},
      type: "POST",
      success: (data) ->
        $('.finish-message').text(data.message)
      failure: () ->
    })

  $('#kintai_勤務タイプ').on('change',() ->
    selected_val = $(this).val()
    start_time_h = ''
    start_time_m = ''
    end_time_h = ''
    end_time_m = ''
    real_time = 8
    switch (selected_val)
      when '001'
        start_time_h = '07'
        start_time_m = '00'
        end_time_h = '16'
        end_time_m = '00'
      when '002'
        start_time_h = '07'
        start_time_m = '30'
        end_time_h = '16'
        end_time_m = '30'
      when '003'
        start_time_h = '08'
        start_time_m = '00'
        end_time_h = '17'
        end_time_m = '00'
      when '004'
        start_time_h = '08'
        start_time_m = '30'
        end_time_h = '17'
        end_time_m = '30'
      when '005'
        start_time_h = '09'
        start_time_m = '00'
        end_time_h = '18'
        end_time_m = '00'
      when '006'
        start_time_h = '09'
        start_time_m = '30'
        end_time_h = '18'
        end_time_m = '30'
      when '007'
        start_time_h = '10'
        start_time_m = '00'
        end_time_h = '19'
        end_time_m = '00'
      when '008'
        start_time_h = '10'
        start_time_m = '30'
        end_time_h = '19'
        end_time_m = '30'
      when '009'
        start_time_h = '11'
        start_time_m = '00'
        end_time_h = '20'
        end_time_m = '00'
      else
        real_time = 0
#    $('#kintai_出勤時刻').val(moment().format('YYYY/MM/DD') + start_time)
#    $('#kintai_退社時刻').val(moment().format('YYYY/MM/DD') + end_time)
    $('#kintai_出勤時刻_4i').val(start_time_h)
    $('#kintai_出勤時刻_5i').val(start_time_m)
    $('#kintai_退社時刻_4i').val(end_time_h)
    $('#kintai_退社時刻_5i').val(end_time_m)

    $('#kintai_遅刻時間').val(0)
    $('#kintai_普通保守時間').val(0)
    $('#kintai_深夜残業時間').val(0)
    $('#kintai_深夜保守時間').val(0)
    $('#kintai_実労働時間').val(real_time)
    $('#kintai_普通残業時間').val(0)

  )

  oDaikyuTable = $('.daikyutable').DataTable({
    "pagingType": "simple_numbers"
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  $('.daikyutable tbody').on 'click', 'tr', (event) ->
    d = oDaikyuTable.row(this).data()
    $('#kintai_代休相手日付').val(d[0])
    $('#kintai_代休取得区分').val('1')
    $('#kintai_備考').val(d[0] + 'の振休')

    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oDaikyuTable.$('tr.selected').removeClass('selected')
      oDaikyuTable.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

  $('#time-cal').on 'click', (event) ->
    time_type = $('#kintai_勤務タイプ').val()

    start_time_h = parseInt($('#kintai_出勤時刻_4i').val())
    start_time_m = parseInt($('#kintai_出勤時刻_5i').val())
    end_time_h = parseInt($('#kintai_退社時刻_4i').val())
    end_time_m = parseInt($('#kintai_退社時刻_5i').val())

    if start_time_m > 0 and start_time_m < 30
      start_time_m = 30
    if start_time_m > 30 and start_time_m <= 59
      start_time_h += 1
      start_time_m = 0

    if end_time_m > 0 and end_time_m < 30
      end_time_m = 0
    if end_time_m > 30 and end_time_m <= 59
      end_time_m = 30
    if end_time_h == 18 and end_time_m == 30
      end_time_h = 18
      end_time_m = 0
    if end_time_h == 19 and end_time_m == 0
      end_time_h = 18
      end_time_m = 0

    start_time = start_time_h + ':' + start_time_m
    end_time = end_time_h + ':' + end_time_m
    diff = moment(end_time,'HH:mm').diff(moment(start_time,'HH:mm'),'minutes')/60

    real_time = 0
    overtime = 0
    if moment(end_time,'HH:mm') > moment('13:00','HH:mm')
      real_time = diff - 1

    if moment(end_time,'HH:mm') > moment('19:00','HH:mm')
      real_time = diff - 2
      overtime = moment(end_time,'HH:mm').diff(moment('19:00','HH:mm'),'minutes')/60

    $('#kintai_実労働時間').val(real_time)
    $('#kintai_普通残業時間').val(overtime)

    late_time = 0
    exit_time = 0
    switch (time_type)
      when '001'
        late_time = moment(start_time,'HH:mm').diff(moment('07:00','HH:mm'),'minutes')/60
        exit_time = moment('16:00','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60
      when '002'
        late_time = moment(start_time,'HH:mm').diff(moment('07:30','HH:mm'),'minutes')/60
        exit_time = moment('16:30','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60
      when '003'
        late_time = moment(start_time,'HH:mm').diff(moment('08:00','HH:mm'),'minutes')/60
        exit_time = moment('17:00','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60
      when '004'
        late_time = moment(start_time,'HH:mm').diff(moment('08:30','HH:mm'),'minutes')/60
        exit_time = moment('17:30','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60
      when '005'
        late_time = moment(start_time,'HH:mm').diff(moment('09:00','HH:mm'),'minutes')/60
        exit_time = moment('18:00','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60
      when '006'
        late_time = moment(start_time,'HH:mm').diff(moment('09:30','HH:mm'),'minutes')/60
        exit_time = moment('18:30','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60
      when '007'
        late_time = moment(start_time,'HH:mm').diff(moment('10:00','HH:mm'),'minutes')/60
        exit_time = moment('19:00','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60
      when '008'
        late_time = moment(start_time,'HH:mm').diff(moment('10:30','HH:mm'),'minutes')/60
        exit_time = moment('19:30','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60
      when '009'
        late_time = moment(start_time,'HH:mm').diff(moment('11:00','HH:mm'),'minutes')/60
        exit_time = moment('20:00','HH:mm').diff(moment(end_time,'HH:mm'),'minutes')/60

    sum_left_time = 0
    if late_time >=0
      sum_left_time = late_time
    if exit_time >=0
      sum_left_time += exit_time
    $('#kintai_遅刻時間').val(sum_left_time)

    $('#kintai_普通保守時間').val()
    $('#kintai_深夜残業時間').val()
    $('#kintai_深夜保守時間').val()