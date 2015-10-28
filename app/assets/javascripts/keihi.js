// init search table
$(function() {
    //oTable = $('#keihi-table').DataTable({
    //    "pagingType": "full_numbers"
    //    , "oLanguage": {
    //        "sUrl": "../../assets/resource/dataTable_ja.txt"
    //    },
    //    "scrollX": true
        //, "aoColumnDefs": [
        //    {"bSortable": false, "aTargets": [6, 7, 8]},
        //    {
        //        "targets": [6, 7, 8],
        //        "width": '15px'
        //    }
        //],
        //"columnDefs": [{
        //    "targets": 'no-sort',
        //    "orderable": false
        //}]

    //});
    oKaisha_search_modal = $('#kaisha-table-modal').DataTable({
        "pagingType": "simple_numbers"
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
    });
});

//button handle
$(function(){
    var sonotha_sum,koutsuhi_sum,nittou_sum,shukuhaku_sum,shinsheino;
   $('#summary').click(function(){
       sonotha_sum = 0, koutsuhi_sum = 0, nittou_sum = 0, shukuhaku_sum = 0;
       $('.koutsuhi').each(function() {
           var value = $(this).val();
           if(!isNaN(value) && value.length != 0) {
               koutsuhi_sum += parseFloat(value);
           }
       });
       $('.nittou').each(function() {
           var value = $(this).val();
           if(!isNaN(value) && value.length != 0) {
               nittou_sum += parseFloat(value);
           }
       });
       $('.shukuhaku').each(function() {
           var value = $(this).val();
           if(!isNaN(value) && value.length != 0) {
               shukuhaku_sum += parseFloat(value);
           }
       });
       $('.sonotha').each(function() {
           //var value = $(this).text();
           var value = $(this).val();
           // add only if the value is number
           if(!isNaN(value) && value.length != 0) {
               sonotha_sum += parseFloat(value);
           }
       });
       
       var hansikin = $('#keihihead_仮払金').val();
       var shikyuhin = $('#keihihead_支給品').val();
       if(!isNaN(hansikin) && hansikin.length != 0) {
       }else { hansikin = 0 }
       if(!isNaN(shikyuhin) && shikyuhin.length != 0) {
       }else { shikyuhin = 0 }

       //minue value for checked remove
       var _sonotha_sum = 0 , _koutsuhi_sum = 0, _nittou_sum = 0, _shukuhaku_sum = 0;
       $('.check-remove').each(function() {
           var this_value = $(this).val();
           if (this_value == "1"){
               var value = $(this).closest('tr').find('.koutsuhi').val();
               if(!isNaN(value) && value.length != 0) {
                   _koutsuhi_sum += parseFloat(value);
               }

               var value = $(this).closest('tr').find('.nittou').val();
               if(!isNaN(value) && value.length != 0) {
                   _nittou_sum += parseFloat(value);
               }

               var value = $(this).closest('tr').find('.shukuhaku').val();
               if(!isNaN(value) && value.length != 0) {
                   _shukuhaku_sum += parseFloat(value);
               }

               var value = $(this).closest('tr').find('.sonotha').val();
               if(!isNaN(value) && value.length != 0) {
                   _sonotha_sum += parseFloat(value);
               }

           }
       });

       koutsuhi_sum -= _koutsuhi_sum
       nittou_sum -= _nittou_sum
       shukuhaku_sum -= _shukuhaku_sum
       sonotha_sum -= _sonotha_sum
       
       $('#keihihead_交通費合計').val(koutsuhi_sum);
       $('#keihihead_日当合計').val(nittou_sum);
       $('#keihihead_宿泊費合計').val(shukuhaku_sum);
       $('#keihihead_その他合計').val(sonotha_sum);
       $('#keihihead_旅費合計').val(koutsuhi_sum + nittou_sum + shukuhaku_sum);
       $('#keihihead_合計').val(koutsuhi_sum + nittou_sum + shukuhaku_sum + sonotha_sum);
       $('#keihihead_過不足').val(koutsuhi_sum + nittou_sum + shukuhaku_sum + sonotha_sum - hansikin - shikyuhin);
       
       shinsheino = $('#keihihead_shinsheino').val();
       $('.shinsheino').val(shinsheino);
       
       line = 0;
       $('.line-no').each(function() {
           line +=1;
           $(this).val(line);
       });
       }); 
});