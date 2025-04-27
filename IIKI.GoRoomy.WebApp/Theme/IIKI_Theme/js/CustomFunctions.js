var CommonValues = [];
CommonValues.BaseAppAreaName = "BaseAppArea";
$(document).ready(function () {
    $("#sticky_popup").popup({ opacity: 0.85, scrolllock: true, autozindex: true, escape: false, blur: false });
    $(".alertAutoDismiss").fadeTo(3000, 1000).slideUp(3000, function () { $(".alertAutoDismiss").slideUp(3000); });
    $(".btnBackToList").on("click", function () { ShowStickyPopup(); });
    $('.checkBoxField').checkboxpicker({ cls: 'btn-sm', groupCls: 'btn-group-sm', });
    $('.checkBoxDefaultField').checkboxpicker({ cls: 'btn-sm', groupCls: 'btn-group-sm', });
    $(".checkBoxField").on("change", function () { $(this).parent().parent().find("#" + $(this).attr('data-fieldName') + ":hidden").val($(this).is(':checked')); });

    $('.datepicker').datetimepicker({ format: $("#MomentDateFormatWithOutTimeZone").val() });
    $('.datetimepicker').datetimepicker({ format: $("#MomentDateTimeFormat").val() });
    $(".js-select2").select2({ closeOnSelect: false, allowClear: true, });

    $(document).on("click", ".btnClosePopup", function () { $("#AddEditJQueryPopup").popup("hide"); });

    $(".profileImageUpload").change(function () {
        //debugger;
        //if (ValidateFileExtension(this, 'img')) {
        previewUploadedFile(this, $(this).attr("data-PreviewImageId"));
        //} else { console.log('ValidateFileExtension failed'); }
    });

    $('.IsUpdateLoginEmail').on('change', function () { if ($(this).is(':checked')) { $(this).parent().prev().find('#Contact_LoginEmail').prop('readonly', false); } else { $(this).parent().prev().find('#Contact_LoginEmail').prop('readonly', true); } });
    if (typeof $("#AddEditForm") !== 'undefined' && typeof ($("#AddEditForm").validate()) !== 'undefined') {
        $("#AddEditForm").validate().settings.ignore = "";
    }
    if (typeof tinymce !== 'undefined') {
        tinymce.init({ selector: 'textarea.text-area-tiny', setup: function (ed) { ed.on("change", function () { tinymce.triggerSave(); }); } });
    }

    //Data table search form
    $(".btnSearch").on('click', function () {
        var tableId = $(this).data('tic_tableid') || 'RecordsListTable';

        RefreshDatatableData(tableId);
    });
    $(".btnClearSearch").on('click', function () {
        var tableId = $(this).data('tic_tableid') || 'RecordsListTable';
        $('#SearchForm')[0].reset();
        RefreshDatatableData(tableId);
    });
});

function CommonErrorMessage(title, msg, redirectToDashboard) {
    new swal({
        title: title,
        text: msg,
        icon: "error"
    }).then(function (result) {
        if (redirectToDashboard)
            location.href = "/Dashboard";
        else
            return false;
    });
}

function CommonMessage(title, msg, type) {
    if (type === undefined || type === '') {
        type = 'info';
    }
    new swal({
        title: title,
        text: msg,
        icon: type
    });
}

function ConfirmSwal(title, msg, type) {
    var RecId = $(chk).attr("data-Id");

    new swal({
        title: title,
        text: msg,
        icon: type,
        showCancelButton: true,
        //confirmButtonColor: '#',
        //confirmButtonText: $("#ActionConfirmButtonText").val(),
        //cancelButtonText: $("#ActionCancelButtonText").val(),
        closeOnConfirm: true,
        closeOnCancel: true
    },
        function (result) {
            if (result.isConfirmed) {
                $("#DeleteRecordId").val(RecId);
                $("#DeleteRecordForm").submit();
            }
        });
}
function ShowStickyPopup() {
    $("#sticky_popup").popup("show");
}

function HideStickyPopup() {
    $("#sticky_popup").popup("hide");
}

function previewUploadedFile(uploadInput, previewImgId) {
    if (uploadInput.files && uploadInput.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#' + previewImgId).attr('src', e.target.result);
        }

        reader.readAsDataURL(uploadInput.files[0]);
    }
}

function ButtonsRemove(Id, Controller, Action, Area, isShowDelete) {
    var strRemove = '';
    var strDelete = '';

    strRemove = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this)" data-id="' + Id + '" title="' + $("#RemoveButtonText").val() + '"><i class="fa fa-trash-alt"></i> ' + $("#RemoveButtonText").val() + '</a>';
    if (isShowDelete)
        strDelete = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this, true)" data-id="' + Id + '" title="' + $("#DeleteButtonText").val() + '"><i class="fa fa-trash"></i> ' + $("#DeleteButtonText").val() + '</a>';

    return strRemove + ' ' + strDelete;
}
function ButtonsRemoveIconsOnly(Id, Controller, Action, Area, isShowDelete) {
    var strRemove = '';
    var strDelete = '';

    strRemove = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this)" data-Id="' + Id + '" title="' + $("#RemoveButtonText").val() + '"><i class="fa fa-trash-alt"></i></a>';
    if (isShowDelete)
        strDelete = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this, true)" data-Id="' + Id + '" title="' + $("#DeleteButtonText").val() + '"><i class="fa fa-trash"></i></a>';

    return strRemove + ' ' + strDelete;
}
function ButtonsEditRemove(Id, Controller, Action, Area, isShowDelete) {
    var strEdit = '';
    var strRemove = '';
    var strDelete = '';
    var editUrl = '/' + Controller + '/' + Action + '/' + Id;

    if (Area !== null && Area !== '') {
        editUrl = '/' + Area + editUrl;
    }
    strEdit = '<a href="' + editUrl + '" class="btn btn-dark btn-xs" title="' + $("#EditButtonText").val() + '"><i class="fa fa-edit"></i> ' + $("#EditButtonText").val() + '</a>';
    strRemove = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this)" data-Id="' + Id + '" title="' + $("#RemoveButtonText").val() + '"><i class="fa fa-trash-alt"></i> ' + $("#RemoveButtonText").val() + '</a>';
    if (isShowDelete)
        strDelete = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this, true)" data-Id="' + Id + '" title="' + $("#DeleteButtonText").val() + '"><i class="fa fa-trash"></i> ' + $("#DeleteButtonText").val() + '</a>';

    return strEdit + ' ' + strRemove + ' ' + strDelete;
}
/**
 * Generates HTML for Edit, Remove, and optionally Delete buttons based on provided parameters.
 * 
 * @param {Object} queryParams - An object containing the query parameters to be appended to the URL. 
 *                               Example: { Id: 123, MotelId: 'xyz', RoomId: 'abc' }
 * @param {string} Controller - The controller name where the action is located (e.g., 'Room').
 * @param {string} Action - The action name to navigate to (e.g., 'Edit').
 * @param {string} Area - The area name in case it's part of the URL (e.g., 'HotelArea'). Optional.
 * @param {boolean} isShowDelete - A flag to indicate whether the delete button should be shown. If true, the delete button is added.
 * @param {boolean} isShowRemove - A flag to indicate whether the soft delete(Remove) button should be shown. If true, the soft delete(Remove) button is added.
 * 
 * @returns {string} - A string containing the HTML for the Edit, Remove, and optionally Delete buttons.
 */
function ButtonsEditRemoveIconsOnly(queryParams, Controller, Action, Area, isShowDelete, isShowRemove) {
    // Initialize the variables for the buttons
    var strEdit = '';  // To store the Edit button HTML
    var strRemove = ''; // To store the Remove button HTML
    var strDelete = ''; // To store the Delete button HTML

    // Base URL structure without query parameters
    var editUrl = '/' + Controller + '/' + Action;

    // If an Area is provided, include it in the URL path
    if (Area) {
        editUrl = '/' + Area + editUrl;
    }

    // Append query parameters dynamically to the URL
    if (queryParams && typeof queryParams === 'object') {
        var queryString = $.param(queryParams); // Converts the queryParams object to a query string format
        if (queryString) {
            editUrl += '?' + queryString; // Append query string to the URL if it's not empty
        }
    }

    // Generate the Edit button HTML
    strEdit = '<a href="' + editUrl + '" class="btn btn-dark btn-xs" title="' + $("#EditButtonText").val() + '"><i class="fa fa-edit"></i></a>';
    // Optionally show the Delete button based on the 'isShowDelete' flag
    if (isShowRemove) {
        // Generate the Remove button HTML (used for removing records)
        strRemove = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this)" data-Id="' + queryParams.Id + '" title="' + $("#RemoveButtonText").val() + '"><i class="fa fa-trash-alt"></i></a>';
    }
    // Optionally show the Delete button based on the 'isShowDelete' flag
    if (isShowDelete) {
        strDelete = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this, true)" data-Id="' + queryParams.Id + '" title="' + $("#DeleteButtonText").val() + '"><i class="fa fa-trash"></i></a>';
    }

    // Return the generated buttons as a concatenated string
    return strEdit + ' ' + strRemove + ' ' + strDelete;
}

function ButtonsEditRemoveModal(Id, isShowDelete) {
    var strEdit = '';
    var strRemove = '';
    var strDelete = '';

    strEdit = '<a href="#" onclick="AddEditRecord(this,' + Id + ')" data-Id="' + Id + '" class="btn btn-dark btn-xs" title="' + $("#EditButtonText").val() + '"><i class="fa fa-edit"></i> ' + $("#EditButtonText").val() + '</a>';
    strRemove = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this)" data-Id="' + Id + '" title="' + $("#RemoveButtonText").val() + '"><i class="fa fa-trash-alt"></i> ' + $("#RemoveButtonText").val() + '</a>';
    if (isShowDelete)
        strDelete = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this, true)" data-Id="' + Id + '" title="' + $("#DeleteButtonText").val() + '"><i class="fa fa-trash"></i> ' + $("#DeleteButtonText").val() + '</a>';

    return strEdit + ' ' + strRemove + ' ' + strDelete;
}
function ButtonsEditRemoveModalIconsOnly(Id, isShowDelete) {
    var strEdit = '';
    var strRemove = '';
    var strDelete = '';

    strEdit = '<a href="#" onclick="AddEditRecord(this,' + Id + ')" data-Id="' + Id + '" class="btn btn-dark btn-xs" title="' + $("#EditButtonText").val() + '"><i class="fa fa-edit"></i></a>';
    strRemove = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this)" data-Id="' + Id + '" title="' + $("#RemoveButtonText").val() + '"><i class="fa fa-trash-alt"></i></a>';
    if (isShowDelete)
        strDelete = ' <a href="#" class="btn btn-danger btn-xs" onclick="DeleteRecord(this, true)" data-Id="' + Id + '" title="' + $("#DeleteButtonText").val() + '"><i class="fa fa-trash"></i></a>';

    return strEdit + ' ' + strRemove + ' ' + strDelete;
}
function GetRecordStatusModal(id, recordStatus) {
    var strEdit = '';
    if (recordStatus === parseInt($("#RecordStatus_Active").val())) {
        strEdit = $("#RecordStatus_ActiveText").val();
    } else if (recordStatus === parseInt($("#RecordStatus_InActive").val())) {
        strEdit = $("#RecordStatus_InActiveText").val();
    } else if (recordStatus === parseInt($("#RecordStatus_Deleted").val())) {
        strEdit = $("#RecordStatus_DeletedText").val();
    } else if (recordStatus === parseInt($("#RecordStatus_Confirmed").val())) {
        strEdit = $("#RecordStatus_ConfirmedText").val();
    } else if (recordStatus === parseInt($("#RecordStatus_Saved").val())) {
        strEdit = $("#RecordStatus_SavedText").val();
    } else if (recordStatus === parseInt($("#RecordStatus_Blocked").val())) {
        strEdit = $("#RecordStatus_BlockedText").val();
    } else if (recordStatus === parseInt($("#RecordStatus_Disabled").val())) {
        strEdit = $("#RecordStatus_DisabledText").val();
    } else if (recordStatus === parseInt($("#RecordStatus_NotAvailable").val())) {
        strEdit = $("#RecordStatus_NotAvailableText").val();
    }

    return strEdit;
}

function DeleteRecord(chk, isDelete) {
    var RecId = $(chk).attr("data-Id");
    var delTitle = '';
    var delMessage = '';
    var delAlert = '';
    if (isDelete) {
        delTitle = $("#DeleteRecordConfirmTitleText").val();
        delMessage = $("#DeleteRecordConfirmMessageText").val();
        delAlert = $("#DeleteRecordConfirmAlertTypeText").val();
    } else {
        delTitle = $("#RemoveRecordConfirmTitleText").val();
        delMessage = $("#RemoveRecordConfirmMessageText").val();
        delAlert = $("#RemoveRecordConfirmAlertTypeText").val();
    }
    if (delTitle.indexOf("\\n") >= 0) {
        var delTitleSplit = delTitle.split('\\n');
        delTitle = '<p>' + delTitleSplit[0] + '</p>' + '<p>' + delTitleSplit[1] + '</p>';
    }
    if (delMessage.indexOf("\\n") >= 0) {
        var delMessageSplit = delMessage.split('\\n');
        delMessage = '<p>' + delMessageSplit[0] + '</p>' + '<p>' + delMessageSplit[1] + '</p>';
    }
    //swal({
    //    title: delTitle,
    //    html: delMessage,
    //    type: delAlert,
    //    showCancelButton: true,
    //    confirmButtonColor: '#' + $("#ActionConfirmButtonColor").val(),
    //    confirmButtonText: $("#ActionConfirmButtonText").val(),
    //    cancelButtonText: $("#ActionCancelButtonText").val(),
    //    closeOnConfirm: true,
    //    closeOnCancel: true
    //},
    //    function (isConfirm) {
    //        if (isConfirm) {
    //            if (isDelete) {
    //                $("#DeleteRecordId").val(RecId);
    //                $("#DeleteRecordForm").submit();
    //            }
    //            else {
    //                $("#MarkAsDeleteRecordId").val(RecId);
    //                $("#MarkAsDeleteRecordForm").submit();
    //            }
    //        }
    //    });
    new swal({
        title: delTitle,
        html: delMessage,
        icon: delAlert,
        scrollbarPadding: false,
        showCancelButton: true,
        confirmButtonColor: '#' + $("#ActionConfirmButtonColor").val(),
        confirmButtonText: $("#ActionConfirmButtonText").val(),
        cancelButtonText: $("#ActionCancelButtonText").val(),
        closeOnConfirm: true,
        closeOnCancel: true,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            if (isDelete) {
                $("#DeleteRecordId").val(RecId);
                $("#DeleteRecordForm").submit();
            }
            else {
                $("#MarkAsDeleteRecordId").val(RecId);
                $("#MarkAsDeleteRecordForm").submit();
            }
        }
    });
}
function SetJqueryDatatable(tbleId, notOrder = [], notSearch = []) {
    var $table = $('#' + tbleId);

    // Check if the table exists
    if ($table.length) {
        // Get the header row and find the index of <th> with the class 'iiki-grid-actions-col'

        var columnIndex = $table.find('thead tr th.iiki-grid-actions-col').index();
        // If notOrder is empty, set it to the column index
        if (notOrder.length === 0) {
            notOrder = [columnIndex];
        }

        // If notSearch is empty, set it to the column index
        if (notSearch.length === 0) {
            notSearch = [columnIndex];
        }
    } else {
        return;
    }
    $('#' + tbleId).DataTable({
        "paging": true,
        "responsive": true,
        "ordering": true,
        "info": true,
        "columnDefs": [{ orderable: false, targets: notOrder }, { search: false, targets: notSearch }],
        "language": {
            //"url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Urdu.json",
            "sEmptyTable": $("#JQueryDataTableEmptyTableText").val(),
            "sInfo": $("#JQueryDataTableInfoText").val(),
            "sInfoEmpty": $("#JQueryDataTableInfoEmptyText").val(),
            "sInfoFiltered": $("#JQueryDataTableInfoFilteredText").val(),
            "sInfoPostFix": $("#JQueryDataTableInfoPostFixText").val(),
            "sInfoThousands": $("#JQueryDataTableInfoThousandsText").val(),
            "sLengthMenu": $("#JQueryDataTableLengthMenuText").val(),
            "sLoadingRecords": $("#JQueryDataTableLoadingRecordsText").val(),
            "sProcessing": $("#JQueryDataTableProcessingText").val(),
            "sSearch": $("#JQueryDataTableSearchText").val(),
            "sZeroRecords": $("#JQueryDataTableZeroRecordsText").val(),
            "oPaginate": {
                "sFirst": $("#JQueryDataTablePaginateFirstText").val(),
                "sLast": $("#JQueryDataTablePaginateLastText").val(),
                "sNext": $("#JQueryDataTablePaginateNextText").val(),
                "sPrevious": $("#JQueryDataTablePaginatePreviousText").val()
            },
            "oAria": {
                "sSortAscending": $("#JQueryDataTableAriaSortAscendingText").val(),
                "sSortDescending": $("#JQueryDataTableAriaSortDescendingText").val()
            }
        },
    });

}

function RefreshDatatableData(tableId) {
    $('select[name="' + tableId + '_length"]').change();
}

function ResetSearchForm(formId, tableId) {
    $('#' + formId + ' input').val('');
    $('#' + formId + ' select').prop('selectedIndex', 0);
    RefreshDatatableData(tableId);
}

function AddEditRecordGet_Old(chk, id) {
    var modalId = $(chk).attr("data-ModalPopupId");
    var ismodal = $(chk).attr("data-IsModalPopup").toLowerCase();
    var isformSubmit = $(chk).attr("data-IsFormSubmit").toLowerCase();
    var getURL = $(chk).attr("data-GetModalURL");
    if (ismodal == 'true') {
        $("#" + modalId + " .modal-content .modal-header").remove();
        $("#" + modalId + " .modal-content .modal-body").remove();
        $("#" + modalId).modal("show");
    } else {
        $("#" + modalId + " .card .card-header").remove();
        $("#" + modalId + " .card .card-body").remove();
        $("#" + modalId).popup("show");
    }
    ShowStickyPopup();

    var RecId = id;

    //console.log(RecId, ismodal, getURL);
    $.ajax({
        url: getURL,
        data: { "id": RecId },
        type: "GET",
        dataType: "html",
        success: function (result) {
            //console.log(result);
            $("#AddEditModalButtonFooter").removeClass("hidden");
            HideStickyPopup();
            if (ismodal == 'true') {
                if (isformSubmit == 'true') {
                    $("#" + modalId + " .modal-content").empty();
                }
                $("#" + modalId + " .modal-content").prepend(result);
            } else {
                if (isformSubmit == 'true') {
                    $("#" + modalId + " .card").empty();
                }
                $("#" + modalId + " .card").prepend(result);
            }
            HideStickyPopup();
            return false;
        },
        error: function (result) {
            console.log(result);
            CommonErrorMessage($("#LoadingFailedErrorTitleText").val(), $("#LoadingFailedErrorText").val() + result);

            if (ismodal == 'true') {
                $("#" + modalId).modal("hide");
            } else {
                $("#" + modalId).popup("hide");
            }
            HideStickyPopup();
            return false;
        }
    });
    return false;
}

function AddEditRecordGet(chk, id) {
    var modalId = $(chk).attr("data-ModalPopupId");
    var ismodal = $(chk).attr("data-IsModalPopup").toLowerCase();
    var isformSubmit = $(chk).attr("data-IsFormSubmit").toLowerCase();
    var getURL = $(chk).attr("data-GetModalURL");

    $("#iAddEditModal").empty();

    ShowStickyPopup();

    var RecId = id;

    //console.log(RecId, ismodal, getURL);
    $.ajax({
        url: getURL,
        data: { "id": RecId, "modalId": modalId, "isformSubmit": isformSubmit },
        type: "GET",
        dataType: "html",
        success: function (result) {
            //console.log(result);
            HideStickyPopup();
            $("#iAddEditModal").append(result);
            $("#" + modalId).modal("show");

            return false;
        },
        error: function (result) {
            console.log(result);
            CommonErrorMessage($("#LoadingFailedErrorTitleText").val(), $("#LoadingFailedErrorText").val() + result);

            if (ismodal == 'true') {
                $("#" + modalId).modal("hide");
            } else {
                $("#" + modalId).popup("hide");
            }
            HideStickyPopup();
            return false;
        }
    });
    return false;
}

function SaveModalFormAjax(chk) {
    var formId = $(chk).attr("data-ModalFormId");
    var modalId = $(chk).attr("data-ModalPopupId");
    var getURL = $(chk).attr("data-GetModalURL");
    var isreload = $(chk).attr("data-IsReload").toLowerCase();
    var isgetmodal = $(chk).attr("data-IsGetModal").toLowerCase();

    var form = $("#" + formId);
    if ($("#" + formId).valid()) {
        ShowStickyPopup();
        $.ajax({
            url: $("#" + formId)[0].action,
            type: $("#" + formId)[0].method,
            data: form.serialize() + '&formaction=' + $(chk).val(),
            dataType: "html",
            success: function (result) {
                if (result === $("#RecordSaveStatus_RecordSavedText").val()) {
                    $("#" + modalId).modal('toggle');
                    if (isreload == 'true') {
                        location.reload();
                    }
                }
                else if (result === $("#RecordSaveStatus_RecordSavedAddText").val()) {
                    if (isgetmodal == 'true') {
                        AddEditRecordGet(null, 0, getURL, modalId);
                    } else {
                        AddEditRecord(null, 0);
                    }
                }
                else if (result === $("#RecordSaveStatus_DuplicateRecordText").val()) {
                    CommonErrorMessage($("#DuplicateErrorTitleText").val(), $("#DuplicateRecordErrorText").val());
                }
                else if (result === $("#RecordSaveStatus_InvalidModelErrorText").val()) {
                    CommonErrorMessage($("#InvalidModelErrorTitleText").val(), $("#InvalidModelErrorText").val());
                } else {
                    console.log(result);
                    CommonErrorMessage($("#ErrorTitleText").val(), $("#ErrorCommonMessageText").val());

                }
                HideStickyPopup();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR.responseText);
                CommonErrorMessage($("#ErrorTitleText").val(), $("#ErrorCommonMessageText").val());
                HideStickyPopup();
            }
        });
    } else {

        CommonErrorMessage($("#InvalidModelErrorTitleText").val(), $("#InvalidModelErrorText").val());

        return false;
    }
}

function LoadSubDropDownListAjax(ajaxType, id, url, subDropDownListId, SelectedSubId, isAddEmptyValue, isAddZeroValue) {
    $.ajax({
        type: ajaxType,
        url: url,
        data: {
            Id: id
        },
        dataType: 'json',
        success: function (data) {
            $('#' + subDropDownListId).empty();
            if (isAddEmptyValue)
                $('#' + subDropDownListId).append('<option >--SELECT--</option > ');
            else if (isAddZeroValue)
                $('#' + subDropDownListId).append('<option value="0">--SELECT--</option > ');

            for (var i = 0; i < data.length; i++) {
                if (data[i].Value == SelectedSubId) {
                    $('#' + subDropDownListId).append('<option selected value=' + data[i].Value + '>' + data[i].Text + '</option > ');
                }
                else {
                    $('#' + subDropDownListId).append('<option value=' + data[i].Value + '>' + data[i].Text + '</option > ');
                }

            }
        }
    });
}
function MakeBasicAuthorization(user, pswd) {
    var token = user + ':' + pswd;
    var hash = "";
    if (btoa) {
        hash = btoa(token);
    }
    return "Basic " + hash;
}

function GetJSONFromForm(formSelector) {
    var object = {};
    new FormData($(formSelector)[0]).forEach((value, key) => object[key] = value);
    return JSON.stringify(object);
}

/**
 * Generates dynamic column definitions based on the headers in the table.
 * Can be reused across different pages with different configurations.
 * 
 * @param {Object} options - Configuration options to customize column rendering.
 * @param {string} options.controllerName - The name of the controller for action buttons (e.g., "Room").
 * @param {string} options.actionName - The action name for Edit (e.g., "Edit").
 * @param {string} options.areaName - The area name in the URL (e.g., "HotelArea").
 * @param {Object} options.extraQueryParams - Additional query parameters for the action buttons (e.g., { MotelId, RoomId }).
 * @returns {Array} - The column definitions array to be used in DataTable initialization.
 */
function createColumnDefs(options) {
    var columnDefs = [];

    // Process header rows for dynamic column definitions
    $('#' + options.GridHTMLId + ' thead th').each(function () {
        var property = $(this).data('iikigridheader_property');
        if (!property || property === undefined) {
            return false;
        }
        // Handle 'RecordStatus' column
        if (property === 'RecordStatus') {
            columnDefs.push({
                "data": property,
                "orderable": true,
                "searchable": true,
                "render": function (data) {
                    return GetRecordStatusModal(0, data); // Example custom render function
                }
            });
        }
        // Handle 'RecordStatus' column
        else if (property.indexOf("Date") >= 0) {
            columnDefs.push({
                "data": property,
                "orderable": true,
                "searchable": true,
                "render": function (data) {
                    data = moment(data).tz(Intl.DateTimeFormat().resolvedOptions().timeZone).format('DD-MMM-YYYY hh:mm A (UTC Z)');
                    return data; // Example custom render function
                }
            });
        }
        // Handle other columns with defined properties
        else {
            columnDefs.push({
                "data": property
            });
        }
    });

    // Handle action column if it exists
    $('#' + options.GridHTMLId + ' thead th').filter(function () {
        if ($(this).data('iikigridheader_actions') !== undefined) {
            columnDefs.push({
                "data": "Id",
                "orderable": false,
                "searchable": false,
                "render": function (data, type, full) {
                    options.queryParams.Id = data;
                    return ButtonsEditRemoveIconsOnly(options.queryParams, options.controllerName, options.actionName, options.areaName, options.isShowDelete, options.isShowRemove);
                    // Generate action buttons dynamically
                    //return generateActionButtons(data, full, options);
                }
            });
        }
    });

    return columnDefs;
}


/**
 * Initializes the DataTable with dynamic column definitions.
 * Can be reused across different pages by passing configuration options.
 * 
 * @param {Object} options - Configuration options for the DataTable.
 * @param {string} options.GridHTMLId - table html id attribute.
 * @param {string} options.SearchDataTableURL - contoller search action url.
 * @param {string} options.RequestFilterParams - AJAX parameters for the DataTable request. this is required
 * @param {string} options.controllerName - The controller for the action buttons (e.g., "Room").
 * @param {string} options.actionName - The action name for the Edit button (e.g., "Edit").
 * @param {string} options.areaName - The area name for the URL (optional).
 * @param {Object} options.extraQueryParams - Additional query parameters for the Edit/Delete URLs.
 */
function LoadJQeuryDataTable(options) {
    var columnDefs = createColumnDefs(options);

    // Set default values for processing, serverSide, and searching in case they are not provided in options
    var processing = options.processing !== undefined ? options.processing : true;
    var serverSide = options.serverSide !== undefined ? options.serverSide : true;
    var searching = options.searching !== undefined ? options.searching : true;

    // Ensure getFilterParams is provided in options.
    // if getFilterParams not defined then redirect to dashboard.
    if (!options.RequestFilterParams) {
        CommonErrorMessage("Missing Required Parameter", "Please define the filter parameter function.", true);
    }
    
    $('#' + options.GridHTMLId).DataTable({
        "processing": processing, // Show loading indicator
        "serverSide": serverSide, // Enable server-side processing
        "searching": searching, // Enable or disable searching
        "pagingType": "full_numbers",
        "order": [[0, 'asc']],
        "language": {
            "emptyTable": "Currently, there are no records to show."
        },
        "ajax": {
            "url": options.SearchDataTableURL,
            "type": "POST",
            "dataType": "json",
            "data": function (d) {
                // Pass additional AJAX parameters dynamically
                var requestParams = options.RequestFilterParams();
                if (requestParams && typeof requestParams === 'object') {
                    $.extend(d, requestParams); // Merge custom parameters with default parameters
                }
                //d.RoomId = @roomId;
                //d.IsJvUser = false;
            },
            "dataSrc": function (json) {
                $('#' + options.GridHTMLId + ' thead').removeClass('d-none');
                return json.data; // Assuming the data is inside a "data" property in the response
            }
        },
        "columns": columnDefs // Use the dynamically generated columnDefs
    });
}