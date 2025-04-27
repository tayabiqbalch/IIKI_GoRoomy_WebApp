using System;

namespace IIKI.GoRoomy.WebApp.Models
{
    public class TemplateViewData
    {
        public string html { get; set; }
    }
    public class PageViewModel
    {
        public PageViewModel()
        {
            TotalRecords = 0;
            PageNumber = 1;
            PageSize = 10;
            RecordsFrom = 0;
            RecordsTo = 0;
            TotalPages = 1;
            PageFrom = 1;
            PageTo = 1;
        }

        public PageViewModel(long pTotalRecords, long pPageNumber, long pPageSize, long pCurrentRecords)
        {
            SetPageViewData(pTotalRecords, pPageNumber, pPageSize, pCurrentRecords);
        }
        public long TotalRecords { get; set; }
        public long PageNumber { get; set; }
        public long PageSize { get; set; }
        public long RecordsFrom { get; set; }
        public long RecordsTo { get; set; }
        public long TotalPages { get; set; }

        public long PageFrom { get; set; }
        public long PageTo { get; set; }

        public void SetPageViewData(long pTotalRecords, long pPageNumber, long pPageSize, long pCurrentRecords)
        {
            if (pCurrentRecords <= 0 || pTotalRecords <= 0)
            {
                TotalRecords = 0;
                PageNumber = 1;
                PageSize = 10;
                RecordsFrom = 0;
                RecordsTo = 0;
                TotalPages = 1;
                PageFrom = 1;
                PageTo = 1;
                return;
            }
            TotalRecords = pTotalRecords;
            PageNumber = pPageNumber;
            PageSize = pPageSize;
            RecordsFrom = pPageSize * (pPageNumber - 1) + 1;
            RecordsTo = RecordsFrom + pCurrentRecords - 1;

            TotalPages = Convert.ToInt64(decimal.Round((Convert.ToDecimal(pTotalRecords) / Convert.ToDecimal(pPageSize)) + Convert.ToDecimal(0.5), 0));

            if (TotalPages == 0)
            {
                TotalPages = 1;
            }

            if (TotalPages > 5)
            {
                if (PageNumber > 3)
                {
                    PageFrom = PageNumber - 2;
                    if (PageFrom + 5 > TotalPages)
                    {
                        PageTo = TotalPages;
                        PageFrom = PageTo - 4;

                        if (PageFrom < 1)
                        {
                            PageFrom = 1;
                        }
                    }
                    else
                    {
                        PageTo = PageFrom + 5;
                    }
                }
                else
                {
                    PageFrom = 1;
                    PageTo = 5;
                }
            }
            else
            {
                PageFrom = 1;
                PageTo = TotalPages;
            }
        }
    }
}