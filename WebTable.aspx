<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebTable.aspx.cs" Inherits="Jquery_Practice_Work.WebTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="Scripts/jquery-3.4.1.min.js?v=<%=DateTime.Now.Ticks.ToString()%>"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.4.0/css/select.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.foundation.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.colVis.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.4.0/js/dataTables.select.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <style>
        .hiddenbtn {
            display: none;
        }

        #mytable {
            font-size: 1.5rem;
        }

            #mytable .btn {
                margin-left: 0px;
                margin-top: 0px;
                margin-right: 5px;
                color: white;
                font-size: 1.5rem;
                border-radius: unset;
            }

        .btn-danger {
            width: 82px;
        }

        .btn-success {
            width: 90px;
        }

        .btnUpdate {
            background-color: #3f367c;
            border-color: #3f367c;
        }

        .btn-warning {
            background-color: #0df2cf;
            border-color: #0df2cf;
        }

        mytable:hover {
            animation: shake 0.5s;
            animation-iteration-count: infinite;
        }

        @keyframes shake {
            0% {
                transform: translate(1px, 1px) rotate(0deg);
            }

            10% {
                transform: translate(-1px, -2px) rotate(-1deg);
            }

            20% {
                transform: translate(-3px, 0px) rotate(1deg);
            }

            30% {
                transform: translate(3px, 2px) rotate(0deg);
            }

            40% {
                transform: translate(1px, -1px) rotate(1deg);
            }

            50% {
                transform: translate(-1px, 2px) rotate(-1deg);
            }

            60% {
                transform: translate(-3px, 1px) rotate(0deg);
            }

            70% {
                transform: translate(3px, 1px) rotate(-1deg);
            }

            80% {
                transform: translate(-1px, -1px) rotate(1deg);
            }

            90% {
                transform: translate(1px, 2px) rotate(0deg);
            }

            100% {
                transform: translate(1px, -2px) rotate(-1deg);
            }
        }

        body {
            font-size: 1.5rem;
        }

        .showmsg {
            background-color: #13800b;
            width: 105%;
            height: 50px;
            position: fixed;
            bottom: 0px;
            z-index: 999;
            display: none;
        }

        .showerror {
            background-color: #930404;
            width: 105%;
            height: 50px;
            position: fixed;
            bottom: 0px;
            z-index: 999;
            display: none;
        }

        #tablediv {
            padding: 30px 20px 30px 20px;
            border: 2px solid #3f367c;
            width: 92%;
            margin: 35px 0px 50px 45px;
            box-shadow: 1px 4px 12px #000;
        }

        #btnAddRow {
            margin-bottom: 20px;
            font-size: 1.5rem;
            border-radius: unset;
            width: 75px;
        }

        #btnDeleteData {
            margin-bottom: 20px;
            font-size: 1.5rem;
            border-radius: unset;
            width: 170px;
            background-color: #f34b1d;
        }

        #selectall {
            transform: scale(1.5);
            outline: none !important;
        }

        input[type=checkbox] {
            cursor: pointer;
        }

        #btnExcelData {
            margin-bottom: 20px;
            font-size: 1.5rem;
            border-radius: unset;
            width: 140px;
            float: right;
            display: none;
        }

        input[type=checkbox]:hover {
            border-color: #ef2960;
        }

        #CreateReport {
            margin-bottom: 20px;
            font-size: 1.5rem;
            border-radius: unset;
        }

        #btnHistory {
            margin-bottom: 20px;
            font-size: 1.5rem;
            border-radius: unset;
            color: white;
            width: 75px;
        }

        img {
            height: 50px;
            margin-top: -10px;
        }

            img:hover {
                box-shadow: 1px 4px 10px #13800b;
                border-radius: 50%;
                background-color: #60c48a;
            }

        .buttons-pdf:hover {
            box-shadow: 1px 4px 10px #f17026;
            border-radius: 50%;
            background-color: #f5651c;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">
            var ddl = ""
            let edittable = null;
            $(document).ready(function () {
                debugger;
                GetData();
                EditData();
                DeleteData();
                SaveData();
                CancelRowEditing();
                AddNewRow();
                UpdateData();
                CheckAll();
                DeleteAllRecord();
                ViewHistory();
                MoveForward();
                SelectSingleRow();

            });
            function UpdateData() {
                $('#mytable').on('click', '.btnUpdate', function () {
                    debugger;
                    var row = $(this).closest('tr');
                    var idVal = $(this).attr('id');
                    var fname = row.find('td:eq(1) input').val();
                    var lname = row.find('td:eq(2) input').val();
                    var dob = row.find('td:eq(3) input').val();
                    var address = row.find('td:eq(4) input').val();
                    var cellno = row.find('td:eq(5) input').val();
                    var program = row.find('td:eq(6) input').val();
                    var country = row.find('td:eq(7) input').val();
                    var gender = row.find('td:eq(8) input').val();
                    var employee = {};
                    employee.Id = idVal;
                    employee.FirstName = fname;
                    employee.FatherName = lname;
                    employee.DOB = dob;
                    employee.Address = address;
                    employee.CellNo = cellno;
                    employee.Program = program;
                    employee.Country = country;
                    employee.Gender = gender;
                    debugger;
                    $.ajax({
                        beforeSend: function () {

                        },
                        url: 'LoadData.asmx/UpdateData',
                        method: 'Post',
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify({ emp: employee }),
                        success: function () {
                            var $tds = row.find("td").not('td:first').not('td:eq(10)').not('td:eq(9)').not(':last');
                            $.each($tds, function (i, el) {
                                var txt = $(this).find("input").val();
                                $(this).html(txt);
                            });
                            row.find('.btnUpdate').hide();
                            row.find('.btnCancel').hide();
                            row.find('.btnEdit').show();
                            ShowSuccess("Data Updated Successfully!!");
                            edittable.row().draw();
                            GetData();
                        },
                        error: function (err) {
                            console.dir(err)
                        }
                    }).always(function () {

                    }).fail(function () {

                    });
                    edittable.draw();
                    AddUserManagementActivities('User Updated', idVal, fname, 'Update')
                });
            }
            function AddNewRow() {
                $('#btnAddRow').on('click', function () {
                    debugger;
                    var html = "";
                    html += '<tr>';
                    html += '<td><input id="cbbox" type="checkbox" name="checkbox" class="checkall" value="" style="margin-left:10px;" /></td>'
                    html += '<td><input id="txtfirstname" type="text" class="form-control" placeholder="FirstName" style="font-size: 1.5rem;" value="" /></td>'
                    html += '<td><input id="txtfathername" type="text" class="form-control" placeholder="LastName" style="font-size: 1.5rem;" value="" /></td>'
                    html += '<td><input id="txtDOB" type="date" class="form-control" style="font-size: 1.5rem;" value="" /></td>'
                    html += '<td><input id="txtaddress" type="text" class="form-control" placeholder="Address" style="font-size: 1.5rem;" value="" /></td>'
                    html += '<td><input id="txtcellno" type="tel" class="form-control" placeholder="CellNo" style="font-size: 1.5rem;" value="" /></td>'
                    html += '<td><input id="txtprogram" type="text" class="form-control" placeholder="Program" style="font-size: 1.5rem;" value="" /></td>'
                    html += '<td><select class="form-control" style="font-size: 1.5rem;height:34px;" id="selectCountry"><option value="">Select</option><option value="Pakistan">Pakistan</option><option value="Turkey">Turkey</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Libya">Libya</option><option value="Russia">Russia</option><option value="China">China</option><option value="Japan">Japan</option><option value="Taiwan">Taiwan</option><option value="Indonesia">Indonesia</option><option value="Egypt">Egypt</option><option value="Britain">Britain</option><option value="Poland">Poland</option></select></td>'
                    html += '<td><select class="form-control" style="font-size: 1.5rem;height:34px;" id="selectgender"><option value="">Select</option><option value="Male">Male</option><option value="Female">Female</option></select></td>'
                    html += '<td><div class="form-inline"><div class="form-group"><a class="btn btn-success btnEdit dark-stripe" data-min="" style="margin-left:7px;display:none">Edit</a><a class="btn btn-primary btnSave dark-stripe" style="margin-left:3px;">Save</a><a class="btn btn-warning btnCancel dark-stripe" style="margin-right:60px;">Cancel</a></div></div></td>'
                    html += '<td><a class="btn btn-info ViewHistory dark-stripe" style="margin-left:5px;">ViewHistory</a></td>'
                    html += '<td><a class="btn btn-danger btnDelete dark-stripe" style="margin-left: 7px;">Delete</a></td>'
                    html += '</tr>'
                    $('#mytable ').find('tbody').prepend(html);
                });
            }
            function CancelRowEditing() {
                $('#mytable').on('click', '.btnCancel', function () {
                    debugger;
                    var fname = $("#txtfirstname").val();
                    var lname = $("#txtfathername").val();
                    var cellno = $("#txtcellno").val();
                    var program = $("#txtprogram").val();
                    var address = $("#txtaddress").val();
                    var row = $(this).closest('tr');
                    row.find('.btnUpdate').hide();
                    row.find('.btnCancel').hide();
                    row.find('.btnEdit').show();
                    if (fname == "" || lname == "" || cellno == "" || program == "" || address == "") {
                        var $tds = row;
                        $.each($tds, function (i, el) {
                            $(this).find("input").val();
                            $(this).html("");
                        });
                    }
                    else {
                        var $tds = row.find("td").not('td:first').not('td:eq(10)').not('td:eq(9)').not(':last');
                        $.each($tds, function (i, el) {
                            var txt = $(this).find("input").val();
                            $(this).html(txt);
                        });
                        //var $tdss = row.find("td:eq(7)");
                        //$.each($tdss, function (i, el) {
                        //    var txt = $(this).find("select").val();
                        //    $(this).html(txt);
                        //});
                        //var $tdsss = row.find("td:eq(8)");
                        //$.each($tdsss, function (i, el) {
                        //    var txt = $(this).find("option").val();
                        //    $(this).html(txt);
                        //});
                    }
                    var UserId = $(this).attr("id");
                    var $td = row.find('td')
                    var firstname = $td.eq(1).text();
                    AddUserManagementActivities('User Canceled', UserId, firstname, 'Cancel')
                });
            }
            function SaveData() {
                $('#mytable').on('click', '.btnSave', function () {
                    debugger;
                    var row = $(this).closest('tr');
                    var fname = $("#txtfirstname").val();
                    var lname = $("#txtfathername").val();
                    var cellno = $("#txtcellno").val();
                    var program = $("#txtprogram").val();
                    var address = $("#txtaddress").val();
                    var dob = $("#txtDOB").val();
                    var country = $("#selectCountry").val();
                    var gender = $("#selectgender").val();
                    if (fname != "" || lname != "" || cellno != "" || program != "" || address != "") {
                        var $tds = row;
                        $.each($tds, function (i, el) {
                            $(this).find("input").val();
                            $(this).html("");
                        });
                    }
                    else {
                        ShowError("Please Fill The Fields!!");
                        $tds.show();
                    }
                    var employee = {};
                    employee.FirstName = fname;
                    employee.FatherName = lname;
                    employee.DOB = dob;
                    employee.Address = address;
                    employee.CellNo = cellno;
                    employee.Program = program;
                    employee.Country = country;
                    employee.Gender = gender;
                    debugger;
                    $.ajax({
                        beforeSend: function () {

                        },
                        url: 'LoadData.asmx/AddData',
                        method: 'Post',
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify({ emp: employee }),
                        success: function () {
                            debugger;
                            row.find('.btnSave').hide();
                            row.find('.btnCancel').hide();
                            row.find('.btnEdit').show();
                            ShowSuccess("Data Saved Successfully!!");
                            GetData();
                        },
                        error: function (err) {
                            console.dir(err)
                        }
                    }).always(function () {

                    }).fail(function () {

                    });
                    var User = 0;
                    AddUserManagementActivities('User Saved', User, fname, 'Save')
                    edittable.draw();
                });
            }
            function DeleteData() {
                $('#mytable').on('click', '.btnDelete', function () {
                    debugger;
                    var check = confirm("Are You Sure To Delete Record!!");
                    if (check == true) {
                        var IDVal = $(this).attr('id');
                        $.ajax({
                            url: 'LoadData.asmx/DeleteData',
                            method: 'POST',
                            data: {
                                id: IDVal
                            },
                            success: function () {
                                ShowError("Record Deleted Successfully!!");
                                GetData();
                            },
                        })
                    }
                    var row = $(this).closest('tr');
                    var $td = row.find('td')
                    var firstname = $td.eq(1).text();
                    var UserId = $(this).attr('id');
                    AddUserManagementActivities('User Deleted', UserId, firstname, 'Delete')
                    edittable.draw();
                });
            }
            function EditData() {
                $('#mytable').on('click', '.btnEdit', function () {
                    debugger;
                    var row = $(this).closest('tr');
                    row.find('.btnUpdate').show();
                    row.find('.btnCancel').show();
                    row.find('.btnEdit').hide();
                    $('.btnCancel').css('margin-right', '76px');
                    if ($(this).text() == 'Edit') {
                        var $row = row.off("click");
                        var $tds = $row.find("td").not('td:first').not('td:eq(10)').not('td:eq(9)').not(':last');
                        $.each($tds, function (i, el) {
                            var txt = $(this).text();
                            $(this).html("").append("<input type='text' class='form-control' style='font-size:1.5rem;' value='" + txt + "'>");
                        });
                        //bind countries
                        //var $tdss = $row.find("td:eq(7)");
                        //$.each($tdss, function (i, el) {
                        //    var txt = $(this).text();
                        //    $(this).html("").append("<select class='form-control' style='font-size: 1.5rem; height:34px;' id='selectCountry'><option value='" + txt + "'>Pakistan</option><option value='" + txt + "'>Turkey</option><option value='" + txt + "'>Iran</option><option value='" + txt + "'>Iraq</option><option value='" + txt + "'>Libya</option><option value='" + txt + "'>Russia</option><option value='" + txt + "'>China</option><option value='" + txt + "'>Japan</option><option value='" + txt + "'>Taiwan</option><option value='" + txt + "'>Indonesia</option><option value='" + txt + "'>Egypt</option><option value='" + txt + "'>Britain</option><option value='" + txt + "'>Poland</option></select>");
                        //});
                        //bind gender
                        //var $tdsss = $row.find("td:eq(8)");
                        //$.each($tdsss, function (i, el) {
                        //    var txt = $(this).text();
                        //    $(this).html("").append("<select class='form-control' style='font-size: 1.5rem; height:34px;' id='selectgender'><option value='" + txt + "'>Male</option><option value='" + txt + "'>Female</option></select>");
                        //});
                    }
                    var $td = row.find('td input')
                    var firstname = $td.eq(1).val();
                    var UserId = $(this).attr("id");
                    AddUserManagementActivities('User Edited', UserId, firstname, 'Edit')
                });
            }
            function ExportData() {
                var table = $('#mytable').DataTable();
                $('#exportsection').empty();
                var currentDate = new Date()
                var day = currentDate.getDate();
                var month = currentDate.getMonth() + 1;
                var year = currentDate.getFullYear();
                var nowDate = month + "-" + day + "-" + year
                var buttons = new $.fn.dataTable.Buttons(table, {
                    buttons: [
                        {
                            extend: 'excelHtml5', footer: true,
                            //text: 'Export All to Excel',
                            autoClose: true,
                            title: 'StudentFile-' + nowDate,
                            tag: 'img',
                            attr: {
                                src: '../images/Excel.png',
                                title: 'Export To Excel'
                            },
                            exportOptions: {
                                columns: [2, 3, 4, 5, 6, 7, 8, 9],
                            }
                        },
                        {
                            extend: 'pdfHtml5', footer: true,
                            autoClose: true,
                            title: 'StudentFile-' + nowDate,
                            tag: 'img',
                            attr: {
                                src: '../images/Pdf.png',
                                title: 'PDF',
                            },
                            exportOptions: {
                                columns: [2, 3, 4, 5, 6, 7, 8, 9]
                            },
                            download: 'open',
                        },
                        //{
                        //    extend: 'copyHtml5', footer: true,
                        //    title: 'StudentFile-' + nowDate,
                        //    exportOptions: {
                        //        columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                        //    }
                        //},
                        //{
                        //    extend: 'csvHtml5', footer: true,
                        //    title: 'StudentFile',
                        //    exportOptions: {
                        //        columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                        //    },
                        //},
                        {
                            extend: 'print', footer: true,
                            title: 'StudentFile-' + nowDate,
                            tag: 'img',
                            attr: {
                                src: '../images/Print.png',
                                title: 'Print',
                            },
                            exportOptions: {
                                columns: [2, 3, 4, 5, 6, 7, 8, 9]
                            },
                            customize: function (win) {
                                $(win.document.body)
                                    .css('font-size', '10pt')
                                    .prepend(
                                        '<img src="http://datatables.net/media/images/logo-fade.png" style="position:absolute; top:0; left:0;" />'
                                    );
                                $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                            }
                        },
                    ],
                }).container().appendTo($('#exportsection'));
            }
            function GetData() {
                $.ajax({
                    url: 'LoadData.asmx/GetData',
                    method: 'Post',
                    dataType: 'json',
                    success: function (data) {
                        debugger;
                        edittable = $('#mytable').DataTable({
                            data: data,
                            columns: [
                                { 'data': 'Id', 'autoWidth': true },
                                { 'data': 'Checkbox', 'autoWidth': true },
                                { 'data': 'FirstName', 'autoWidth': true },
                                { 'data': 'FatherName', 'autoWidth': true },
                                {
                                    'data': 'DOB', 'autoWidth': true,
                                    'render': function (jsonDate) {
                                        var date = new Date(parseInt(jsonDate.substr(6)));
                                        var month = date.getMonth() + 1;
                                        return month + "/" + date.getDate() + "/" + date.getFullYear();
                                    }
                                },
                                { 'data': 'Address', 'autoWidth': true },
                                { 'data': 'CellNo', 'autoWidth': true },
                                { 'data': 'Program', 'autoWidth': true },
                                { 'data': 'Country', 'autoWidth': true },
                                { 'data': 'Gender', 'autoWidth': true },
                                { 'data': 'Edit', 'autoWidth': true },
                                { 'data': 'ViewPDF', 'autoWidth': true },
                                { 'data': 'Delete', 'autoWidth': true },
                            ],
                            "pagingType": "full_numbers",

                            "paging": "true",

                            "resposive": true,

                            "bDestroy": true,

                            "processing": true,

                            "serverside": true,

                            "pageLength": 10,

                            "lengthMenu": [[10, 25, 50, 100, 200, -1], [10, 25, 50, 100, 200, "All"]],

                            "language": {

                                "emptyTable": "No Data Found"
                            },
                            "drawCallback": function (settings) {
                                ExportData();
                            },
                            "columnDefs": [
                                {
                                    "targets": [0],
                                    "visible": false,
                                    "searchable": false
                                },
                                {
                                    "targets": [1],
                                    "visible": true,
                                    "searchable": false,
                                    "sorting": false,
                                }
                            ],

                            destroy: true,
                            /* dom: 'Bfrtip',*/
                        });
                    }
                });
            }
            function ViewHistory() {
                $('#mytable').on('click', '.ViewHistory', function () {
                    debugger;
                    var UserId = $(this).attr("id");
                    var fnam = "View History";

                    AddUserManagementActivities('View History Button Clicked', UserId, fnam);
                    window.open("TrackingHistory?srno=" + UserId, "_self");
                });
            }
            function ShowSuccess(text) {
                $('.showmsg').text(text).css({
                    'text-align': 'center',
                    'color': 'white',
                    'font-size': '18px',
                    'padding-top': '12px'
                });
                $('.showmsg').css({
                    'display': 'block',
                    'bottom': '0'
                });
                setTimeout(function () {
                    $('.showmsg').css('bottom', '-80px')
                }, 4000);
            }
            function ShowError(text) {
                $('.showerror').text(text).css({
                    'text-align': 'center',
                    'color': 'white',
                    'font-size': '18px',
                    'padding-top': '12px'
                });
                $('.showerror').css({
                    'display': 'block',
                    'bottom': '0'
                });
                setTimeout(function () {
                    $('.showerror').css('bottom', '-80px');
                }, 4000);
            }
            function CheckAll() {
                $("#selectall").click(function () {
                    $(".checkall").prop('checked', $(this).prop('checked'), false);
                    var row = $('tr');
                    if ($('#cbbox').is(':checked')) {
                        row.addClass('selected')
                    }
                    else {
                        edittable.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }
                });
            }
            function SelectSingleRow() {
                $('#mytable tbody').on('click', 'tr', function () {
                    debugger;
                    $(this).toggleClass('selected');
                });
            }
            function DeleteAllRecord() {
                $('#btnDeleteData').on('click', function () {
                    debugger;
                    edittable.row('.selected').remove().draw(false);
                })
            }
            function MoveForward() {
                $('#btnHistory').on('click', function () {
                    debugger;
                    window.open("Tracking", "_target").replace(/\s+/g, "");
                })
            }
            function AddUserManagementActivities(ActivityAction, UserId, UserName, btnName) {
                AddActions_Activity_Log(ActivityAction, UserId, UserName);
            }
            function AddActions_Activity_Log(ActivityAction, UserId, UserName) {
                var requestData = JSON.stringify({ 'ActivityAction': ActivityAction, 'UserId': UserId, 'UserName': UserName })
                $.ajax({
                    type: 'POST',
                    url: '../History_Tracking.asmx/AddActions_Activity_Log',
                    data: requestData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        var result = JSON.parse(res.d);
                    },
                    failure: function (response) {
                        //alert(response.d);
                    },
                    error: function (err) {
                        console.dir(err);
                    }
                });
            }
        </script>
        <div class="row showmsg">
            <div class="col-12">
            </div>
        </div>
        <div class="row showerror">
            <div class="col-12">
            </div>
        </div>
        <div class="row" id="tablediv">
            <div class="col-md-12">
                <input type="button" id="btnAddRow" class="btn btn-success" value="AddNew" />
                <input type="button" id="btnDeleteData" class="btn btn-danger" value="Delete Selected Record" />
                <button id="CreateReport" runat="server" class="btn btn-info" onserverclick="CreateReport_ServerClick">Create Report</button>
                <a id="btnHistory" class="btn btn-primary">History</a>
                <div id="exportsection" style="float: right"></div>
                <button id="btnExcelData" runat="server" class="btn btn-success" onserverclick="btnExcelData_ServerClick">Export All To Excel</button>
                <table id="mytable" class=" table table-hover table-responsive table-condensed table-bordered compact table-striped" style="width: 100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>
                                <input id="selectall" type="checkbox" name="checkbox" value="" style="margin-left: -2px;" />
                            </th>
                            <th>FirstName</th>
                            <th>LastName</th>
                            <th>DOB</th>
                            <th>Address</th>
                            <th>CellNo</th>
                            <th>Program</th>
                            <th>Country</th>
                            <th>Gender</th>
                            <th>Edit</th>
                            <th>ViewHistory</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th></th>
                            <th>FirstName</th>
                            <th>LastName</th>
                            <th>DOB</th>
                            <th>Address</th>
                            <th>CellNo</th>
                            <th>Program</th>
                            <th>Country</th>
                            <th>Gender</th>
                            <th>Edit</th>
                            <th>ViewHistory</th>
                            <th>Delete</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
