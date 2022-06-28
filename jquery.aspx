<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jquery.aspx.cs" Inherits="Jquery_Practice_Work.Jquery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="Scripts/jquery-3.4.1.min.js?v=<%=DateTime.Now.Ticks.ToString()%>"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    
</head>
<body>
    <form id="form1" runat="server">
        
        <script type="text/javascript">
            $(document).ready(function () {
                //apend table
                var maxtable = 10;
                var x = 1;
                var msg = "You Cannot Create Morethan 10 Tables"
                var table = $('#hellodiv').html();

                $('#addtable').click(function () {
                    if (x < maxtable) {
                        x++;
                        $('#appendtable').append(table).removeClass('display');
                    } else {
                        alert(msg);
                    }
                })

                $('#txtget').click(function () {
                    $('#txtinput')
                        .css({
                            'height': 100,
                            'width': 100
                        })
                    var gettext = $('#txtinput').val();
                    $('#printtext').html(gettext);
                })
                //password show and hide

                $('#cbshowpassword').click(function () {
                    var currentpasswordfield = $('#txtpassword');
                    var currentpassword = currentpasswordfield.val();
                    currentpasswordfield.remove();
                    if ($(this).is(':checked')) {
                        $(this).before('<input type="text" id="txtpassword" value="' + currentpassword + '"/>');
                    }
                    else {
                        $(this).before('<input type="password" id="txtpassword" value="' + currentpassword + '"/>');
                    }
                })

                // image animation

                $('#myimage').on({
                    mouseover: function () {
                        $(this).animate({
                            'height': 400,
                            'width': 400
                        }, 3000, 'linear', Animationcomplete);
                    },
                    mouseout: function () {
                        $(this).animate({
                            'height': 100,
                            'width': 100
                        }, 3000);
                    }
                });
                function Animationcomplete() {
                    alert('Animation Complete');
                }

                // event details
                $('#btn').click(function (event) {
                    geteventdetails(event);
                }).mouseover(function () {
                    geteventdetails(event);
                }).mouseout(function () {
                    geteventdetails(event);
                });
                function geteventdetails(event) {
                    var eventdetails = 'Event = ' + event.type + '<br/>' +
                        'X = ' + event.pageX + '<br/>' +
                        'Y = ' + event.pageY + '<br/>' +
                        'Target Element = ' + event.target.type + '<br/>' +
                        'TagName = ' + event.target.tagName + '<br/>'
                    $('#resultdetails').html(eventdetails);
                }
                // field and print text
                var maxfield = 10;
                var x = 1;
                var text = 'You Cannot Create Morethan 10 Fields';
                var fieldhtml = '<input id="inputfield" /><br/>';
                $('#removeinput').on('click', function () {
                    $('#AddField').fadeOut(500);
                });
                $('#addinput').on('click', function () {
                    if (x < maxfield) {
                        x++;
                        $('#AddField').append(fieldhtml);
                    }
                    else {
                        alert(text).css('color', 'red');
                    }
                })
                var printdata;
                $('#addprint').on('click', function () {
                    printdata += $('#inputfield').val() + '<br/>';
                    $('#printarea').html(printdata).css({ "background-color": "green", "color": "white", "Font size": "45px" });
                })

                // print index and their values
                var result = '';
                $('option').each(function (index, element) {
                    result += 'Index = ' + index + ', Value = ' + $(this).text() + '<br/>';
                    $('#result').html(result);
                });
                $('option').on('click', function () {
                    $(this).append('<option value=""></option><br/>')
                })
                $('#selectCountries').change(function () {
                    $(this).css('background-color', 'green')
                    var selectedoptions = $('#selectCountries option:selected');
                    if (selectedoptions.length > 0) {
                        var resultString = ' ';
                        selectedoptions.each(function () {
                            $(this).css('color', 'white')
                            resultString += 'Value = ' + $(this).val() + ', Text = ' + $(this).text() + '<br/>';
                        })
                        $('#divresult').html(resultString);
                    }
                });
                //for ckeckboxes
                $('input[name="Skills"]').click(function () {
                    getcheckedcheckboxes('Skills');
                });
                $('input[name="Cities"]').click(function () {
                    getcheckedcheckboxes('Cities');
                });
                var getcheckedcheckboxes = function (GroupName) {
                    var result = $('input[name="' + GroupName + '"]:checked');
                    if (result.length > 0) {
                        var resultstring = result.length + " " + GroupName + " Selected<br/>";
                        result.each(function () {
                            var selectedvalue = $(this).val();
                            resultstring += selectedvalue + "-" + $('label[for="cb-' + selectedvalue + '"]').text() + "<br/>"
                        });
                        $('#div' + GroupName).html(resultstring)
                    }
                    else {
                        $('#div' + GroupName).html("No ckeckbox is  checked")
                    }
                }
                //$("#SelectAll").click(function () {
                //    $(".checkAll").prop('checked', $(this).prop('checked'), false);
                //});
            });
        </script>
       
        Skills:
    <%--<input type="checkbox" id="SelectAll" name="skill" />Select All--%>
        <input type="checkbox" name="Skills" class="checkAll" value="CS" />
        <label for="cb-CS">C#</label>
        <input type="checkbox" name="Skills" class="checkAll" value="VB" />
        <label for="cb-VB">VB</label>
        <input type="checkbox" name="Skills" class="checkAll" value="CP" />
        <label for="cb-CP">C++</label>
        <input type="checkbox" name="Skills" class="checkAll" value="FN" />
        <label for="cb-FN">Fortran</label>
        <br />
        <br />
        Prefered Cities:
    <input type="checkbox" name="Cities" class="checkAll" value="NY" />
        <label for="cb-NY">NewYork</label>
        <input type="checkbox" name="Cities" class="checkAll" value="LD" />
        <label for="cb-LD">London</label>
        <input type="checkbox" name="Cities" class="checkAll" value="PS" />
        <label for="cb-PS">Paris</label>
        <input type="checkbox" name="Cities" class="checkAll" value="LH" />
        <label for="cb-LH">Lahore</label>
        <br />
        <br />
        <div id="divSkills">
        </div>
        <br />
        <div id="divCities">
        </div>
        <br />
        <br />
        Country:
    <select id="selectCountries" multiple="multiple">
        <option selected="selected" value="PK">Pakistan</option>
        <option value="UK">United Kingdom</option>
        <option value="UAE">United Arab Emirates</option>
        <option value="TK">Turkey</option>
        <option value="IR">Iran</option>
        <option value="IND">India</option>
        <option value="EGP">Egypt</option>
        <option value="FR">France</option>
        <option value="SP">Spain</option>
        <option value="SR">Syria</option>
        <option value="QT">Qatar</option>
        <option value="IQ">Iraq</option>
        <option value="BR">Brazil</option>
        <option value="TW">Taiwan</option>
        <option value="HK">Hong Kong</option>
        <option value="CH">China</option>
        <option value="BR">Behrain</option>
    </select>
        <br />
        <br />
        <div id="divresult">
        </div>
        <br />
        <br />
        <div id="result">
        </div>
        <input id="btn" type="button" value="Click Me" />
        <br />
        <br />
        <div id="resultdetails">
        </div>
        <input id="addinput" type="button" value="AddInput" />
        <input id="removeinput" type="button" value="RemoveInput" />
        <br />
        <br />
        <div id="AddField">
        </div>
        <br />
        <br />
        <input id="inputfield" type="text" /><input id="addprint" type="button" value="Print" />
        <br />
        <br />
        <div id="printarea">
        </div>
        <img id="myimage" height="100" width="100" src="images/book-icon-146.png" />
        <br />
        <br />
        Password:
    <input type="password" id="txtpassword" />
        <input type="checkbox" id="cbshowpassword" />Show Password
        <br />
        <br />
        <div>
            <div>
                <div id="description">
                    Get Text:
                &nbsp<input type="text" id="txtinput" />&nbsp&nbsp&nbsp<input type="button" id="txtget" value="Gettext" />
                </div>
            </div>
        </div>
        <div id="printtext">
        </div>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <br />
        <asp:Button runat="server" ID="exportexcel" CssClass="btn btn-success btn-lg" Text="Export To Excel" OnClick="exportexcel_Click" />
    </form>

</body>
</html>
