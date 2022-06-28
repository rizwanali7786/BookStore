using System;
using System.Web.UI;
using System.Data;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using IronPdf;
using iText;
using System.Web;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace Jquery_Practice_Work
{
    public partial class WebTable : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
       
        protected void btnExcelData_ServerClick(object sender, EventArgs e)
        {
            //Response.ClearContent();
            //Response.AppendHeader("content-disposition", "attachment;filename=Students.xlsx");
            //Response.ContentType = "application/excel";
            //StringWriter stringwriter = new StringWriter();
            //HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringwriter);
            //table.RenderControl(htmlTextWriter);
            //Response.Write(stringwriter.ToString());
            //Response.End();
            //ExcelUtility.CreateExcel(ds, "D:\\Demo.xls");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        protected void CreateReport_ServerClick(object sender, EventArgs e)
        {            
            GeneratePDF();
        }
        private DataTable GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;

                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
        public void GeneratePDF()
        {
            DataRow dr = GetData("SELECT * FROM StudentInfo").Rows[0];
            Document document = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
            Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK);
            using (MemoryStream memoryStream = new MemoryStream())
            {
                PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                Phrase phrase = null;
                PdfPCell cell = null;
                PdfPTable table = null;
                BaseColor color = null;

                document.Open();

                //Header Table
                table = new PdfPTable(2);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.3f, 0.7f });

                //Company Logo
                cell = ImageCell("~/images/BookHouse.png", 30f, Element.ALIGN_CENTER);
                table.AddCell(cell);

                //Company Name and Address
                phrase = new Phrase();
                phrase.Add(new Chunk("Online Book Store\n\n", FontFactory.GetFont("Arial", 16, Font.BOLD, BaseColor.RED)));
                phrase.Add(new Chunk("107, Park site,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
                phrase.Add(new Chunk("Salt Lake Road,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
                phrase.Add(new Chunk("Lahore, Pakistan", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
                cell = PhraseCell(phrase, Element.ALIGN_LEFT);
                cell.VerticalAlignment = Element.ALIGN_TOP;
                table.AddCell(cell);

                //Separater Line
                color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
                DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);
                document.Add(table);

                table = new PdfPTable(2);
                table.HorizontalAlignment = Element.ALIGN_LEFT;
                table.SetWidths(new float[] { 0.3f, 1f });
                table.SpacingBefore = 20f;

                //Employee Details
                cell = PhraseCell(new Phrase("Student Record", FontFactory.GetFont("Arial", 12, Font.UNDERLINE, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), Element.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 40f;
                table.AddCell(cell);

                //Photo
                cell = ImageCell(string.Format("~/images/download.png"), 25f, Element.ALIGN_CENTER);
                table.AddCell(cell);

                //Name
                phrase = new Phrase();
                phrase.Add(new Chunk("Rizwan" + " " + "Ali" + "\n", FontFactory.GetFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
                phrase.Add(new Chunk("(" + "WEB DEVELOPMENT" + ")", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLUE)));
                cell = PhraseCell(phrase, Element.ALIGN_LEFT);
                cell.VerticalAlignment = Element.ALIGN_MIDDLE;
                table.AddCell(cell);
                document.Add(table);
                DrawLine(writer, 160f, 60f, 160f, 690f, BaseColor.DARK_GRAY);
                DrawLine(writer, 115f, document.Top - 165f, document.PageSize.Width - 100f, document.Top - 165f, BaseColor.DARK_GRAY);

                table = new PdfPTable(2);
                table.SetWidths(new float[] { 0.5f, 2f });
                table.TotalWidth = 340f;
                table.LockedWidth = true;
                table.SpacingBefore = 20f;
                table.HorizontalAlignment = Element.ALIGN_RIGHT;

                //Student Id
                table.AddCell(PhraseCell(new Phrase("Student Id:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), Element.ALIGN_LEFT));
                table.AddCell(PhraseCell(new Phrase("000" + dr["Id"], FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), Element.ALIGN_LEFT));
                cell = PhraseCell(new Phrase(), Element.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 20f;
                table.AddCell(cell);


                //Address
                table.AddCell(PhraseCell(new Phrase("Address:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), Element.ALIGN_LEFT));
                phrase = new Phrase(new Chunk("Iqbal-e-Awan Defence Road" + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
                phrase.Add(new Chunk("Lahore" + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
                phrase.Add(new Chunk("Punjab" + " " + "Pakistan" + " " + "54000", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
                table.AddCell(PhraseCell(phrase, Element.ALIGN_LEFT));
                cell = PhraseCell(new Phrase(), Element.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 20f;
                table.AddCell(cell);

                //Date of Birth
                table.AddCell(PhraseCell(new Phrase("Date of Birth:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), Element.ALIGN_LEFT));
                table.AddCell(PhraseCell(new Phrase(Convert.ToDateTime(dr["DOB"]).ToString("dd MMMM, yyyy"), FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                cell = PhraseCell(new Phrase(), Element.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 20f;
                table.AddCell(cell);

                //Phone
                table.AddCell(PhraseCell(new Phrase("Phone Number:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                table.AddCell(PhraseCell(new Phrase("03039285687", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                cell = PhraseCell(new Phrase(), Element.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 20f;
                table.AddCell(cell);

                //Email
                table.AddCell(PhraseCell(new Phrase("Email:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                table.AddCell(PhraseCell(new Phrase("GreenShadow725@gmail.com", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                cell = PhraseCell(new Phrase(), Element.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 20f;
                table.AddCell(cell);

                //Addtional Information
                table.AddCell(PhraseCell(new Phrase("Addtional Information:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), Element.ALIGN_LEFT));
                table.AddCell(PhraseCell(new Phrase("But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), Element.ALIGN_JUSTIFIED));
                document.Add(table);
                document.Close();
                byte[] bytes = memoryStream.ToArray();
                memoryStream.Close();
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=Student.pdf");
                Response.ContentType = "application/pdf";
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.End();
                Response.Close();
            }
        }
        private static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, BaseColor color)
        {
            PdfContentByte contentByte = writer.DirectContent;
            contentByte.SetColorStroke(color);
            contentByte.MoveTo(x1, y1);
            contentByte.LineTo(x2, y2);
            contentByte.Stroke();
        }
        private static PdfPCell PhraseCell(Phrase phrase, int align)
        {
            PdfPCell cell = new PdfPCell(phrase);
            cell.BorderColor = BaseColor.WHITE;
            cell.VerticalAlignment = Element.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 2f;
            cell.PaddingTop = 0f;
            return cell;
        }
        private static PdfPCell ImageCell(string path, float scale, int align)
        {
            Image image = Image.GetInstance(HttpContext.Current.Server.MapPath(path));
            image.ScalePercent(scale);
            PdfPCell cell = new PdfPCell(image);
            cell.BorderColor = BaseColor.WHITE;
            cell.VerticalAlignment = Element.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 0f;
            cell.PaddingTop = 0f;
            return cell;

        }

    }
}