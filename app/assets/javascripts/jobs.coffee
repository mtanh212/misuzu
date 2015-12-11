jQuery ->
  oTable = $('#jobmaster').DataTable({
    "pagingType": "full_numbers"
    , "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
    ,"aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 6,7,8 ]},
      {
        "targets": [6,7,8],
        "width": '15px'
      }
    ],
    "columnDefs": [ {
      "targets"  : 'no-sort',
      "orderable": false
    }]
  })

  oKaisha_modal = $('#kaisha-table-modal').DataTable({
    "pagingType": "full_numbers"
    , "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  $('#kaisha-table-modal tbody').on( 'click', 'tr',  () ->
    d = oKaisha_modal.row(this).data()
    $('#jobmaster_ユーザ番号').val(d[0])
    $('#jobmaster_ユーザ名').val(d[1])

    if $(this).hasClass('selected')
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oKaisha_modal.$('tr.selected').removeClass('selected')
      oKaisha_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')
   )

  $('#jobmaster_開始日').datetimepicker({
    format: 'YYYY/MM/DD'
    ,showTodayButton: true
  })

  $('#jobmaster_終了日').datetimepicker({
    format: 'YYYY/MM/DD'
    ,showTodayButton: true
  })

  $("#jobmaster_開始日").on("dp.change", (event) ->
    $('#jobmaster_終了日').data("DateTimePicker").minDate(e.date)
  )

  $("#jobmaster_終了日").on("dp.change", (event) ->
    $('#jobmaster_開始日').data("DateTimePicker").maxDate(e.date)
  )

  $('.refer-kaisha').click( () ->
    $('#kaisha-search-modal').modal('show')
  )

  $('#jobmaster_ユーザ番号').keydown( (event) ->
    if (e.keyCode == 9 && !e.shiftKey)
      kaisha_code = $('#jobmaster_ユーザ番号').val()
      jQuery.ajax({
        url: '/jobmasters/ajax',
        data: {focus_field: 'jobmaster_ユーザ番号', kaisha_code: kaisha_code},
        type: "POST",
      success: (data) ->
        $('#kaisha-name').text(data.kaisha_name)
        console.log("getAjax jobmaster_ユーザ番号:"+ data.kaisha_name)
      ,
      failure: () ->
        console.log("jobmaster_ユーザ番号 keydown Unsuccessful")
      })
  )