
$(function(){
    // seo url kategory
    $('#frmcategoryForm-name').friendurl({id : 'frmcategoryForm-slug'});
    $('#frmprintForm-name').friendurl({id : 'frmprintForm-slug'});
    $('#frmadvertisementForm-title').friendurl({id : 'frmadvertisementForm-slug'});
    $('#frmstaticpageForm-title_cs').friendurl({id : 'frmstaticpageForm-slug_cs'});
    $('#frmstaticpageForm-title_en').friendurl({id : 'frmstaticpageForm-slug_en'});
    $('#frmstaticpageForm-title_de').friendurl({id : 'frmstaticpageForm-slug_de'});
    $('#frmactualityForm-title_cs').friendurl({id : 'frmactualityForm-slug_cs'});
    $('#frmactualityForm-title_en').friendurl({id : 'frmactualityForm-slug_en'});
    $('#frmactualityForm-title_de').friendurl({id : 'frmactualityForm-slug_de'});
    $('div.input-append').addClass('date');

    var control = $('div>input.datetimepicker');
    control.addClass('date');
    control.datetimepicker({
        format: 'yyyy-mm-dd hh:ii:ss',
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left",
        language: 'cs',
        weekStart: 1
    });

});

// schova fieldsety po nacteni ckeditoru
CKEDITOR.on('instanceReady', function(){ CKEditor_loaded = true; $('fieldset.toggle-first').find('div').toggle(); });

$(document).ready(function() {
    $('a[data-confirm]').click(function(ev) {
        var href = $(this).attr('href');

        if (!$('#dataConfirmModal').length) {
            $('body').append('<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="dataConfirmLabel"></h3></div><div class="modal-body"></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><a class="btn btn-primary" id="dataConfirmOK">OK</a></div></div>');
        }
        $('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
        $('#dataConfirmOK').attr('href', href);
        $('#dataConfirmModal').modal({show:true});
        return false;
    });
});