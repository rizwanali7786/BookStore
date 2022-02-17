<%@ Page Title="CreateBook" Language="C#" MasterPageFile="~/Admin/OnlineStore.Master" AutoEventWireup="true" CodeBehind="CreateBook.aspx.cs" Inherits="Online_Store.Create_Book" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jqc-1.12.4/dt-1.11.4/b-2.2.2/sl-1.3.4/datatables.min.js"></script>
    <script type="text/javascript" src="Editor-2.0.6/js/dataTables.editor.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jqc-1.12.4/dt-1.11.4/b-2.2.2/sl-1.3.4/datatables.min.css" />
    <link rel="stylesheet" type="text/css" href="Editor-2.0.6/css/editor.dataTables.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="OnlineStore11.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        th {
            font-size: 18px;
        }

        td {
            font-size: 18px;
        }

        .portlet-body {
            border: 2px solid black;
            background-color: #fff;
            padding: 20px;
            width: 100%;
            overflow: hidden;
        }

        #heading {
            color: #fff;
            font-size: large;
            margin-top: 3px;
        }

        .caption {
            color: #fff;
        }

        #logo {
            margin-left: -300px;
            margin-top: -20px;
        }

        .fa-book {
            margin: 10px;
        }

        h1 {
            color: #a10e0e;
            font-size: 50px;
            margin-top: -30px;
            margin-left: -250px;
            font-family: 'Times New Roman', Times, serif
        }

        .btn-lg {
            border-radius: 50px;
        }

        .col-md-6 {
            float: inherit;
        }

        .input-lg {
            border-color: #6597b7;
        }

        .panel-body {
            margin-top: 120px;
            margin-left: -600px;
        }

        .row {
            padding: 0;
            margin: 0 0 0 225px;
            height: 100px;
            width: 1675px;
        }

        .panel {
            width: 40%;
            height: 320%;
            margin-left: -270px;
            background-color: #fff;
            margin-top: -120px;
        }

        .panel-heading {
            margin-left: -300px;
            margin-top: -140px;
        }

        @media screen and (max-width: 360px) {
            #main-content,
            .row .panel .panel-body .col-md-6 .form-group .input-lg {
                width: 100%;
            }
        }

        @media screen and (max-width: 720px) {
            #main-content,
            .row .panel .panel-body .col-md-6 .form-group .input-lg {
                width: 100%;
            }
        }

        @media screen and (max-width: 560px) {
            #main-content,
            .row .panel .panel-body .col-md-6 .form-group .input-lg {
                width: 100%;
            }
        }

        @media screen and (max-width: 300px) {
            #main-content,
            .row .panel .panel-body .col-md-6 .form-group .input-lg {
                width: 100%;
            }
        }

        @media screen and (max-width: 200px) {
            #main-content,
            .row .panel .panel-body .col-md-6 .form-group .input-lg {
                width: 100%;
            }
        }

        @media screen and (max-width: 520px) {

            .panel .panel-body .panel-heading {
                width: 200%;
            }
        }
    </style>
    <section id="main-content">
        <section id="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <div class="panel-heading">
                            <asp:HiddenField runat="server" ID="hfId" />
                            <div class="row">
                                <div class="col-md-6">
                                    <img id="logo" src="images/bookstore-logo-template-design-logo.jpg" width="430" alt="logo" />
                                    <h1>CREATE BOOK</h1>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtBookName" BorderStyle="Solid" BorderColor="#3399ff" Width="450" runat="server" MaxLength="20" AutoCompleteType="Disabled" CssClass="form-control input-lg" placeholder="BookName" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBookName" ID="RequiredFieldValidator2" ErrorMessage="Enter BookName*" Display="Dynamic" ForeColor="#ff0000" Font-Bold="true" SetFocusOnError="True" ValidationGroup="VBGValidate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtAuthorName" BorderColor="#3399ff" BorderStyle="Solid" Width="450" MaxLength="20" AutoCompleteType="Disabled" runat="server" CssClass="form-control input-lg" placeholder="AuthorName" />
                                        <asp:RequiredFieldValidator ControlToValidate="txtAuthorName" ID="RequiredFieldValidator1" ErrorMessage="Enter AuthorName*" Display="Dynamic" ForeColor="#ff0000" Font-Bold="true" SetFocusOnError="True" runat="server" ValidationGroup="VBGValidate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:DropDownList ID="drpCategoryName" runat="server" BorderColor="#3399ff" Width="450" BorderStyle="Solid" CssClass="form-control input-lg" CausesValidation="true" placeholder="Select Category">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ControlToValidate="drpCategoryName" ID="RequiredFieldValidator3" ErrorMessage="EnterCategoryName*" Display="Dynamic" ForeColor="#ff0000" Font-Bold="true" SetFocusOnError="True" runat="server" ValidationGroup="VBGValidate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPrice" BorderColor="#3399ff" BorderStyle="Solid" Width="450" MaxLength="20" runat="server" AutoCompleteType="Disabled" CssClass="form-control input-lg" placeholder="Price" />
                                        <asp:RequiredFieldValidator ControlToValidate="txtAuthorName" ID="RequiredFieldValidator6" ErrorMessage="Enter Price*" Display="Dynamic" ForeColor="#ff0000" Font-Bold="true" SetFocusOnError="True" runat="server" ValidationGroup="VBGValidate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtDescription" runat="server" BorderColor="#3399ff" Width="450" CssClass="form-control input-lg" BorderStyle="Solid" TextMode="MultiLine" placeholder="Write Product Description Here" />
                                        <asp:RequiredFieldValidator ControlToValidate="txtDescription" ID="RequiredFieldValidator4" ErrorMessage="Write Description*" Display="Dynamic" ForeColor="#ff0000" Font-Bold="true" SetFocusOnError="True" runat="server" ValidationGroup="VBGValidate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:FileUpload runat="server" ID="flupload" ForeColor="#ff6a00" CssClass="btn btn-info btn-lg" Width="450" />
                                        <asp:RequiredFieldValidator ControlToValidate="flupload" ID="RequiredFieldValidator5" ErrorMessage="Select File*" Display="Dynamic" ForeColor="#ff0000" Font-Bold="true" SetFocusOnError="True" runat="server" ValidationGroup="VBGValidate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Button Text="Save" ID="Btn_Save" CssClass="btn btn-success btn-lg" Width="450" runat="server" ValidationGroup="VBGValidate" OnClick="Btn_Save_Click" ForeColor="" BorderColor="#CCFF33" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="row">
                        <div class="col-md-8" style="width: 65%; margin-left: -1150px;">
                            <div class="form-group">
                                <div class="portlet box blue" style="background-color: #000;">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fas fa-book"></i><span id="heading">Books Data Table</span>
                                        </div>
                                        <div class="portlet-body">
                                            <table id="mytable" class=" table table-hover table-bordered table-striped compact table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th>BookName</th>
                                                        <th>AuthorName</th>
                                                        <th>CategoryName</th>
                                                        <th>Price</th>
                                                        <th>Discription</th>
                                                        <th>ImageFile</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%foreach (var item in Books)
                                                        {
                                                    %>
                                                    <tr>
                                                        <td><%=item.BookName %></td>
                                                        <td><%=item.AuthorName %></td>
                                                        <td><%=item.CategoryName %></td>
                                                        <td><%=item.Price %></td>
                                                        <td><%=item.Description %></td>
                                                        <td>
                                                            <img src="data:image;base64,<%=Convert.ToBase64String(item.Data.ToArray()) %>" style="width: 60px;" />
                                                        </td>
                                                        <td>
                                                            <%-- <a href="?Id=<%=item.Id %>" id="btn_Edit" class="btn btn-primary btn-lg" style="width: 100px;">Edit</a>--%>
                                                            <%-- <a href="#" id="Button_Edit" text="Edit" role="button"
                                                                class="btn btn-primary btn-lg btn-Edit" data-value="<%= item.Id %>" style="width: 100px;">Edit    
                                                            </a>--%>
                                                            <asp:Button runat="server" CssClass="btn btn-primary btn-lg" data-value="<%= item.Id %>" Width="100" Text="Edit" ID="btn_Edit" OnClick="btn_Edit_Click" />

                                                        </td>
                                                        <td>
                                                            <%--<a href="?Id=<%=item.Id %>" ID="btn_Delete" Class="btn btn-danger btn-sm">Delete</a>--%>
                                                            <a href="#" id="Button_Delete" text="Delete"
                                                                class="btn btn-danger btn-lg btn-delete" data-value="<%= item.Id %>" style="width: 100px;">Delete    
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                                <tfoot style="background-color: #fff">
                                                    <tr>
                                                        <th>BookName</th>
                                                        <th>AuthorName</th>
                                                        <th>CategoryName</th>
                                                        <th>Price</th>
                                                        <th>Discription</th>
                                                        <th>ImageFile</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
                                            <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                                            <script type="text/javascript">
                                                $(document).ready(function () {

                                                });
                                                $(document).ready(function () {
                                                    $('#mytable').DataTable({

                                                        "pagingType": "full_numbers",

                                                        "paging": "true",

                                                        "processing": true,

                                                        "serverside": true,

                                                        "pageLength": 5,

                                                        "lengthMenu": [[5, 10, 25, 50, 100, 200, -1], [5, 10, 25, 50, 100, 200, "All"]],

                                                        "language": {

                                                            "emptyTable": "No Data Found"
                                                        },
                                                    });
                                                    $(document).on("click", '.btn-delete', function (e) {
                                                        var idVal = $(this).data('value');
                                                        $.ajax({
                                                            url: '/WebServices/account.asmx/DeleteBook',
                                                            method: 'POST',
                                                            data: {
                                                                id: idVal
                                                            },
                                                            success: function () {
                                                                confirm("Are You Sure To Delete Record!!");
                                                                document.location.reload();
                                                            },
                                                            complete: console.log
                                                        })

                                                        e.preventDefault();
                                                        return false;



                                                    });
                                                    $(document).on("click", '.btn-Edit', function (e) {
                                                        var idVal = $(this).data('value');
                                                        $.ajax({
                                                            url: '/WebServices/account.asmx/EditBook',
                                                            method: 'POST',
                                                            data: {
                                                                id: idVal
                                                            },
                                                            success: function () {
                                                                confirm(" Are You Sure To Edit Record!!");
                                                                document.location.reload();
                                                            },
                                                            complete: console.log
                                                        })

                                                        e.preventDefault();
                                                        return false;
                                                    });
                                                    $('#MainContentPlaceHolder1_Btn_Save').click(function () {
                                                        alert("Book Created Successfully!")
                                                    })
                                                });
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
