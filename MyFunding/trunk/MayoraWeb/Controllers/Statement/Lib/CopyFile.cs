using AutoMapper;
using MigraDoc.DocumentObjectModel;
using MyWeb.Models.Statement;
using MyWeb.ViewModels.Statement;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace MyWeb.Controllers.Statement.Lib
{
    public class CopyFile
    {
        //private ProsesFile proses = new ProsesFile();
        public CopyFile(string sourcePath, string destPath)
        {
            CopyFile.CopyDirectory(sourcePath, destPath);
        }
        public static void CopyDirectory(string sourcePath, string destPath)
        {
            if (!Directory.Exists(destPath))
            {
                Directory.CreateDirectory(destPath);
            }

            foreach (string file in Directory.GetFiles(sourcePath))
            {
                string dest = Path.Combine(destPath, Path.GetFileName(file));
                ProsesFile proses = new ProsesFile(dest);
                List<HeaderTextFile> result = Mapper.Map<List<HeaderTextFile>>(proses.getHeaderTextFile());
                foreach (var item in result)
                {
                    
                    //Document CreatePdf = CreateDocument(item);
                }
                //File.Copy(file, dest);
            }

            foreach (string folder in Directory.GetDirectories(sourcePath))
            {
                string dest = Path.Combine(destPath, Path.GetFileName(folder));
                CopyDirectory(folder, dest);
            }
        }

        //public Document CreateDocument(ConvertToPdf data)
        //{

        //}
    }
}