jQuery ->
  oTable = $('#jobmaster').DataTable({
    "scrollX": true,
#    'scrollY': "300px",
    "pagingType": "full_numbers",
    "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    },
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 11,12 ]},
      {
        "targets": [11,12],
        "width": '15px'
      }
    ],
    "columnDefs": [{
      "targets"  : 'no-sort',
      "orderable": false
    }],
    'scrollCollapse': true,
#    'fixedColumns': {
#      'leftColumns': 0,
#      'rightColumns': 2,
#      'heightMatch': 'none'
#    }
  })

  oKaisha_modal = $('#kaisha-table-modal').DataTable({
    "pagingType": "full_numbers"
    , "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  oShain_modal = $('#user_table').DataTable({
    "pagingType": "full_numbers"
    , "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  oJob_modal = $('#job_table').DataTable({
    "pagingType": "full_numbers"
    , "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  oBunrui_modal = $('.bunrui-table').DataTable({
    "pagingType": "full_numbers"
    , "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  $('#kaisha-table-modal tbody').on( 'click', 'tr',  () ->
    d = oKaisha_modal.row(this).data()
    $('#jobmaster_ユーザ番号').val(d[0])
    $('#jobmaster_ユーザ名').val(d[1])

    #    remove error if has
    $('#jobmaster_ユーザ番号').closest('.form-group').find('span.help-block').remove()
    $('#jobmaster_ユーザ番号').closest('.form-group').removeClass('has-error')

    if $(this).hasClass('selected')
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oKaisha_modal.$('tr.selected').removeClass('selected')
      oKaisha_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')
   )

  $('#user_table tbody').on( 'click', 'tr',  () ->
    d = oShain_modal.row(this).data()
    $('#jobmaster_入力社員番号').val(d[0])
    $('.hint-shain-refer').text(d[1])

#    remove error if has
    $('#jobmaster_入力社員番号').closest('.form-group').find('span.help-block').remove()
    $('#jobmaster_入力社員番号').closest('.form-group').removeClass('has-error')

    if $(this).hasClass('selected')
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oShain_modal.$('tr.selected').removeClass('selected')
      oShain_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')
  )

  $('#job_table tbody').on( 'click', 'tr',  () ->
    d = oJob_modal.row(this).data()
    $('#jobmaster_関連Job番号').val(d[0])
    $('.hint-job-refer').text(d[1])

    #    remove error if has
    $('#jobmaster_関連Job番号').closest('.form-group').find('span.help-block').remove()
    $('#jobmaster_関連Job番号').closest('.form-group').removeClass('has-error')

    if $(this).hasClass('selected')
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oJob_modal.$('tr.selected').removeClass('selected')
      oJob_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')
  )

  $('.bunrui-table tbody').on( 'click', 'tr',  () ->
    d = oBunrui_modal.row(this).data()
    $('#jobmaster_分類コード').val(d[0])
    $('#jobmaster_分類名').val(d[1])

    #    remove error if has
    $('#jobmaster_分類コード').closest('.form-group').find('span.help-block').remove()
    $('#jobmaster_分類コード').closest('.form-group').removeClass('has-error')

    if $(this).hasClass('selected')
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oBunrui_modal.$('tr.selected').removeClass('selected')
      oBunrui_modal.$('tr.success').removeClass('success')
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

  $('.refer-shain').click( () ->
    $('#select_user_modal').modal('show')
  )

  $('.refer-job').click( () ->
    $('#job_search_modal').modal('show')
  )

  $('.refer-bunrui').click( () ->
    $('#bunrui_search_modal').modal('show')
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

  $('#jobmaster_分類コード').on('change', () ->
    switch $(this).val()
      when '1'
        $('#jobmaster_分類名').val('営業活動')
      when '2'
        $('#jobmaster_分類名').val('開発マスタ')
      when '3'
        $('#jobmaster_分類名').val('保守')
      when '4'
        $('#jobmaster_分類名').val('社内業務')
  )