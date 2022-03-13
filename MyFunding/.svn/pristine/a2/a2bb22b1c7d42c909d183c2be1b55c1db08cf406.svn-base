using AutoMapper;
using Core.Web.Helpers;
using Core.Web.Utilities;
using MigraDoc.DocumentObjectModel;
using MigraDoc.DocumentObjectModel.Shapes;
using MigraDoc.DocumentObjectModel.Tables;
using MigraDoc.Rendering;
using MyWeb.Migrations.SqlStatement;
using MyWeb.Models.Statement;
using MyWeb.ViewModels.Statement;
using PdfSharp.Pdf;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Web;

namespace MyWeb.Controllers.Statement.Lib
{
    public class CreateDocument
    {
        public static Document CreatePDF(string accountno, string periode)
        {
            SqlHelper _query = new SqlHelper("SqlMyStatementConnection");
            Document document = new Document();
            try
            {
                List<GetHeaderTextFileToPDF> a = _query.ExecDataTableProc("[Get_Header_TextFile_ToPDF]", "@AccountNo", accountno, "@periode", periode).ToList<GetHeaderTextFileToPDF>();
                foreach (var item in a)
                {
                    Section section = document.AddSection();
                    //Page Setup
                    section.PageSetup.PageFormat = PageFormat.A4;
                    section.PageSetup.TopMargin = "3cm";
                    section.PageSetup.LeftMargin = "0,5cm";
                    section.PageSetup.RightMargin = "1cm";

                    Style style = document.Styles["Normal"];
                    style.ParagraphFormat.AddTabStop("10cm", TabAlignment.Left);
                    // Add a paragraph to the section
                    Paragraph paragraph = section.AddParagraph();

                    //Manage Font
                    MigraDoc.DocumentObjectModel.Font font = new MigraDoc.DocumentObjectModel.Font("Arial", 10);

                    //Image
                    MigraDoc.DocumentObjectModel.Shapes.Image image = section.Headers.Primary.AddImage(System.Web.Hosting.HostingEnvironment.MapPath("~/Images/logo_header.png"));
                    image.Height = "1.5cm";
                    image.Width = "6cm";
                    image.LockAspectRatio = true;
                    image.RelativeVertical = RelativeVertical.Line;
                    image.RelativeHorizontal = RelativeHorizontal.Margin;
                    image.Top = ShapePosition.Top;
                    image.Left = ShapePosition.Left;
                    image.WrapFormat.Style = WrapStyle.Through;

                    paragraph.AddFormattedText("LAPORAN REKENING", font);
                    paragraph.Format.Alignment = ParagraphAlignment.Center;
                    paragraph.Format.Font.Bold = true;
                    paragraph.AddFormattedText("\n");

                    // add table
                    //Table header = section.AddTable();
                    Table header = new Table();
                    header.Borders.Visible = false;
                    header.Rows.LeftIndent = 0;
                    //define column
                    Column column = header.AddColumn("2,5cm");
                    column = header.AddColumn("7cm");
                    column = header.AddColumn("3,5cm");
                    column = header.AddColumn("5,5cm");
                    column.Format.Alignment = ParagraphAlignment.Left;

                    //add row
                    Row row = header.AddRow();
                    row.Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[0].AddParagraph().AddFormattedText("Cabang", font);
                    row.Cells[1].AddParagraph().AddFormattedText(item.cabang == null ? "" : item.cabang, font);
                    row.Cells[2].AddParagraph().AddFormattedText("Halaman", font);
                    row.Cells[3].AddParagraph().AddFormattedText(item.NoHalaman == null ? "" : item.NoHalaman.Replace("0", "") + " s/d " + item.LastNumber, font);

                    row = header.AddRow();
                    row.Cells[0].AddParagraph().AddFormattedText("No. Nasabah", font);
                    row.Cells[1].AddParagraph().AddFormattedText(item.CIF == null ? "" : item.CIF, font);
                    row.Cells[2].AddParagraph().AddFormattedText("Periode", font);
                    row.Cells[3].AddParagraph().AddFormattedText(item.Periode == null ? "" : item.Periode.Substring(0, 1) + item.Periode.Substring(1, item.Periode.Length - 1).ToLower(), font);

                    row = header.AddRow();
                    paragraph = row.Cells[0].AddParagraph();
                    paragraph.AddFormattedText(item.AccountName == null ? "" : item.AccountName, font);
                    paragraph.Format.Font.Bold = true;
                    row.Cells[0].MergeRight = 1;
                    row.Cells[2].AddParagraph().AddFormattedText("Produk", font);
                    row.Cells[3].AddParagraph().AddFormattedText(item.TypeAccount == null ? "" : item.TypeAccount, font);

                    row = header.AddRow();
                    row.Cells[0].AddParagraph().AddFormattedText(item.Alamat1 == null ? "" : item.Alamat1, font);
                    row.Cells[0].MergeRight = 1;
                    row.Cells[2].AddParagraph().AddFormattedText("No Rekening", font);
                    row.Cells[3].AddParagraph().AddFormattedText(item.AccountNo == null ? "" : item.AccountNo, font);

                    row = header.AddRow();
                    row.Cells[0].AddParagraph().AddFormattedText(item.Alamat2 == null ? "" : item.Alamat2, font);
                    row.Cells[0].MergeRight = 1;
                    row.Cells[2].AddParagraph().AddFormattedText("NPWP", font);
                    row.Cells[3].AddParagraph().AddFormattedText(item.NPWP == null ? "" : item.NPWP, font);

                    row = header.AddRow();
                    row.Cells[0].AddParagraph().AddFormattedText(item.Alamat3 == null ? "" : item.Alamat3, font);
                    row.Cells[0].MergeRight = 1;
                    document.LastSection.Add(header);
                    document.LastSection.AddParagraph("\n");

                    //body
                    Table body = new Table();
                    body.Borders.Visible = true;
                    body.Rows.LeftIndent = 0;

                    font = new MigraDoc.DocumentObjectModel.Font("Arial", 8);
                    //define column
                    column = body.AddColumn("1,8cm");
                    column = body.AddColumn("1,8cm");
                    column = body.AddColumn("4,5cm");
                    column = body.AddColumn("2.7cm");
                    column = body.AddColumn("2,8cm");
                    column = body.AddColumn("2,8cm");
                    column = body.AddColumn("2,8cm");
                    column.Format.Alignment = ParagraphAlignment.Left;

                    row = body.AddRow();
                    paragraph = row.Cells[0].AddParagraph();
                    paragraph.AddFormattedText("Tgl Trans", font);
                    paragraph.Format.Font.Bold = true;
                    paragraph.Format.Alignment = ParagraphAlignment.Center;

                    paragraph = row.Cells[1].AddParagraph();
                    paragraph.AddFormattedText("Tgl Valuta", font);
                    paragraph.Format.Font.Bold = true;
                    paragraph.Format.Alignment = ParagraphAlignment.Center;

                    paragraph = row.Cells[2].AddParagraph();
                    paragraph.AddFormattedText("Keterangan", font);
                    paragraph.Format.Font.Bold = true;
                    paragraph.Format.Alignment = ParagraphAlignment.Center;

                    paragraph = row.Cells[3].AddParagraph();
                    paragraph.AddFormattedText("No. Referensi", font);
                    paragraph.Format.Font.Bold = true;
                    paragraph.Format.Alignment = ParagraphAlignment.Center;

                    paragraph = row.Cells[4].AddParagraph();
                    paragraph.AddFormattedText("Debet", font);
                    paragraph.Format.Font.Bold = true;
                    paragraph.Format.Alignment = ParagraphAlignment.Center;

                    paragraph = row.Cells[5].AddParagraph();
                    paragraph.AddFormattedText("Kredit", font);
                    paragraph.Format.Font.Bold = true;
                    paragraph.Format.Alignment = ParagraphAlignment.Center;

                    paragraph = row.Cells[6].AddParagraph();
                    paragraph.AddFormattedText("Saldo", font);
                    paragraph.Format.Alignment = ParagraphAlignment.Center;
                    paragraph.Format.Font.Bold = true;

                    row = body.AddRow();
                    row.Cells[0].AddParagraph("");
                    row.Cells[0].Borders.Bottom.Visible = false;
                    row.Cells[1].AddParagraph("");
                    row.Cells[1].Borders.Bottom.Visible = false;
                    row.Cells[2].AddParagraph().AddFormattedText("Saldo Awal", font);
                    row.Cells[2].Borders.Bottom.Visible = false;
                    row.Cells[3].AddParagraph("");
                    row.Cells[3].Borders.Bottom.Visible = false;
                    row.Cells[4].AddParagraph("");
                    row.Cells[4].Borders.Bottom.Visible = false;
                    row.Cells[5].AddParagraph("");
                    row.Cells[5].Borders.Bottom.Visible = false;
                    paragraph = row.Cells[6].AddParagraph();
                    paragraph.AddFormattedText(item.SaldoAwal, font);
                    paragraph.Format.Alignment = ParagraphAlignment.Right;
                    row.Cells[6].Borders.Bottom.Visible = false;

                    List<BodyTextFileViewModel> listbody = _query.ExecDataTableProc("[Get_Body_TextFile_ToPDF]", "@IDHeader", item.ID).ToList<BodyTextFileViewModel>();
                    foreach (var databody in listbody)
                    {
                        if (databody.Narative == null)
                        {
                            row = body.AddRow();

                            row.Cells[0].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[0].AddParagraph();
                            paragraph.AddFormattedText(databody.Tanggal, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Center;

                            row.Cells[1].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[1].AddParagraph();
                            paragraph.AddFormattedText(databody.Valuta, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Center;

                            row.Cells[2].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[2].AddParagraph();
                            paragraph.AddFormattedText(databody.Detail, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Left;

                            row.Cells[3].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[3].AddParagraph();
                            paragraph.AddFormattedText(databody.NoRef, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Left;

                            row.Cells[4].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[4].AddParagraph();
                            paragraph.AddFormattedText(databody.Debet, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Right;

                            row.Cells[5].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[5].AddParagraph();
                            paragraph.AddFormattedText(databody.Kredit, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Right;

                            row.Cells[6].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[6].AddParagraph();
                            paragraph.AddFormattedText(databody.Saldo, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Right;
                        }
                        else
                        {
                            row = body.AddRow();

                            row.Cells[0].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[0].AddParagraph();
                            paragraph.AddFormattedText(databody.Tanggal, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Center;

                            row.Cells[1].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[1].AddParagraph();
                            paragraph.AddFormattedText(databody.Valuta, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Center;

                            row.Cells[2].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[2].AddParagraph();
                            paragraph.AddFormattedText(databody.Detail, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Left;

                            row.Cells[3].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[3].AddParagraph();
                            paragraph.AddFormattedText(databody.NoRef, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Left;

                            row.Cells[4].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[4].AddParagraph();
                            paragraph.AddFormattedText(databody.Debet, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Right;

                            row.Cells[5].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[5].AddParagraph();
                            paragraph.AddFormattedText(databody.Kredit, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Right;

                            row.Cells[6].Borders.Bottom.Visible = false;
                            paragraph = row.Cells[6].AddParagraph();
                            paragraph.AddFormattedText(databody.Saldo, font);
                            paragraph.Format.Alignment = ParagraphAlignment.Right;

                            row = body.AddRow();
                            row.Cells[0].AddParagraph("");
                            row.Cells[0].Borders.Bottom.Visible = false;
                            row.Cells[1].AddParagraph("");
                            row.Cells[1].Borders.Bottom.Visible = false;
                            row.Cells[2].AddParagraph().AddFormattedText(databody.Narative, font);
                            row.Cells[2].Borders.Bottom.Visible = false;
                            row.Cells[3].AddParagraph("");
                            row.Cells[3].Borders.Bottom.Visible = false;
                            row.Cells[4].AddParagraph("");
                            row.Cells[4].Borders.Bottom.Visible = false;
                            row.Cells[5].AddParagraph("");
                            row.Cells[5].Borders.Bottom.Visible = false;
                            row.Cells[6].AddParagraph("");
                            row.Cells[6].Borders.Bottom.Visible = false;
                        }
                    }

                    row = body.AddRow();
                    row.Borders.Bottom.Visible = false;
                    row = body.AddRow();
                    row.Borders.Bottom.Visible = false;
                    row = body.AddRow();
                    row.Borders.Bottom.Visible = false;

                    row = body.AddRow();
                    row.Cells[0].AddParagraph("");
                    row.Cells[0].Borders.Bottom.Visible = false;
                    row.Cells[1].AddParagraph("");
                    row.Cells[1].Borders.Bottom.Visible = false;
                    row.Cells[2].AddParagraph().AddFormattedText("Total", font);
                    row.Cells[2].Borders.Bottom.Visible = false;
                    row.Cells[3].AddParagraph("");
                    row.Cells[3].Borders.Bottom.Visible = false;
                    paragraph = row.Cells[4].AddParagraph();
                    paragraph.AddFormattedText(item.TotalDebet, font);
                    paragraph.Format.Alignment = ParagraphAlignment.Right;
                    row.Cells[4].Borders.Bottom.Visible = false;
                    paragraph = row.Cells[5].AddParagraph();
                    paragraph.AddFormattedText(item.TotalKredit, font);
                    paragraph.Format.Alignment = ParagraphAlignment.Right;
                    row.Cells[5].Borders.Bottom.Visible = false;
                    row.Cells[6].AddParagraph("");
                    row.Cells[6].Borders.Bottom.Visible = false;

                    row = body.AddRow();
                    row.Cells[0].AddParagraph("");
                    row.Cells[0].Borders.Top.Visible = false;
                    row.Cells[1].AddParagraph("");
                    row.Cells[1].Borders.Top.Visible = false;
                    row.Cells[2].AddParagraph().AddFormattedText("Saldo Akhir", font);
                    row.Cells[2].Borders.Top.Visible = false;
                    row.Cells[3].AddParagraph("");
                    row.Cells[3].Borders.Top.Visible = false;
                    row.Cells[4].AddParagraph("");
                    row.Cells[4].Borders.Top.Visible = false;
                    row.Cells[5].AddParagraph("");
                    row.Cells[5].Borders.Top.Visible = false;
                    paragraph = row.Cells[6].AddParagraph();
                    paragraph.AddFormattedText(item.SaldoAkhir, font);
                    paragraph.Format.Alignment = ParagraphAlignment.Right;
                    row.Cells[6].Borders.Top.Visible = false;
                    document.LastSection.Add(body);
                    document.LastSection.AddParagraph("\n");

                    Table footer = new Table();
                    header.Borders.Visible = false;
                    header.Rows.LeftIndent = 0;
                    //define column
                    column = footer.AddColumn("4cm");
                    column = footer.AddColumn("4cm");
                    column.Format.Alignment = ParagraphAlignment.Left;

                    row = footer.AddRow();
                    paragraph = row.Cells[0].AddParagraph();
                    paragraph.AddFormattedText("Frekwensi Transaksi Debet", font);
                    paragraph.Format.Alignment = ParagraphAlignment.Left;

                    paragraph = row.Cells[1].AddParagraph();
                    paragraph.AddFormattedText(item.FrekuensiDebet, font);
                    paragraph.Format.Alignment = ParagraphAlignment.Left;

                    row = footer.AddRow();
                    paragraph = row.Cells[0].AddParagraph();
                    paragraph.AddFormattedText("Frekwensi Transaksi Kredit", font);
                    paragraph.Format.Alignment = ParagraphAlignment.Left;

                    paragraph = row.Cells[1].AddParagraph();
                    paragraph.AddFormattedText(item.FrekuensiKredit, font);
                    paragraph.Format.Alignment = ParagraphAlignment.Left;

                    row = footer.AddRow();
                    paragraph = row.Cells[0].AddParagraph();
                    paragraph.AddFormattedText("Saldo Terendah", font);
                    paragraph.Format.Alignment = ParagraphAlignment.Left;

                    paragraph = row.Cells[1].AddParagraph();
                    paragraph.AddFormattedText(item.SaldoTerendah, font);
                    paragraph.Format.Alignment = ParagraphAlignment.Right;

                    row = footer.AddRow();
                    paragraph = row.Cells[0].AddParagraph();
                    paragraph.AddFormattedText("Saldo Tertinggi", font);
                    paragraph.Format.Alignment = ParagraphAlignment.Left;

                    paragraph = row.Cells[1].AddParagraph();
                    paragraph.AddFormattedText(item.SaldoTertinggi, font);
                    paragraph.Format.Alignment = ParagraphAlignment.Right;

                    document.LastSection.Add(footer);

                    if (item.Promotion != null)
                    {
                        document.LastSection.AddParagraph("\n");
                        paragraph = document.LastSection.AddParagraph();
                        paragraph.Format.Borders.Visible = true;
                        paragraph.Format.Borders.Color = Colors.Black;
                        paragraph.Format.Alignment = ParagraphAlignment.Center;
                        paragraph.Format.Borders.Distance = 3;
                        paragraph.AddFormattedText(item.Promotion, font);
                    }

                }

                return document;
            }
            catch (System.Exception)
            {

                throw;
            }

        }
    }
}