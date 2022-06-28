<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tracking.aspx.cs" Inherits="Jquery_Practice_Work.Tracking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="Scripts/jquery-3.4.1.min.js?v=<%=DateTime.Now.Ticks.ToString()%>"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <style>
        .row {
            margin-left: 130px;
            margin-top: 50px;
        }

        thead th {
            width: 194px;
        }

        #btnBack {
            margin-bottom: 20px;
            font-size: 1.5rem;
            border-radius: unset;
            width: 77px;
            color: white;
            display:none;
        }
        tbody{
            text-align:center;
        }

        #tablediv {
            padding: 0px 0px 50px 0px;
            border: 2px solid #3f367c;
            width: 75%;
            margin: 55px 0px 50px 200px;
            box-shadow: 1px 4px 12px #000;
        }
         body {
            font-size: 1.5rem;
        }
    </style>

</head>
<body>
    <script>
        $(document).ready(function () {

            $.ajax({
                url: '../History_Tracking.asmx/GetTrackingData',
                method: 'Post',
                dataType: 'json',
                success: function (data) {
                    debugger;
                    $('#historytable').DataTable({
                        data: data,
                        columns: [
                            { 'data': 'TrackingId', 'autoWidth': true },
                            { 'data': 'UserName', 'autoWidth': true },
                            { 'data': 'ActivityAction', 'autoWidth': true },
                            { 'data': 'ActivityDate', 'autoWidth': true },
                            { 'data': 'ActivityTime', 'autoWidth': true },
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
                        "columnDefs": [
                            {
                                "targets": [0],
                                "visible": false,
                                "searchable": false
                            },
                        ],
                        destroy: true,
                    });
                },
                error: function (err) {
                    console.dir(err)
                }
            });
            $('#btnBack').on('click', function (e) {
                debugger;
                e.preventDefault();
                window.open("WebTable","_self").replace(/\s+/g, "");
            });
        })
    </script>
    <form id="form1" runat="server">
        <div id="tablediv">
            <div class="row">
                <div class="col-md-10">
                    <a id="btnBack" class="btn btn-dark">Back</a>
                    <table id="historytable" class=" table table-hover table-responsive table-condensed table-bordered compact table-striped" style="width: 100%">
                        <thead>
                            <tr>
                                <th>TrackingId</th>
                                <th>UserName</th>
                                <th>Activity Action</th>
                                <th>Activity Date</th>
                                <th>Activity Time</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
