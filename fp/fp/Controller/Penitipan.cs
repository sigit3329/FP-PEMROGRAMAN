using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace fp.Controller
{
    class Penitipan
    {
        //declare object untuk view dan model
        private Model.PenitipanModel penitipanModel;
        private View.HistoryPage historyPage;

        //instance
        public Penitipan(View.HistoryPage historyPage)
        {
            penitipanModel = new Model.PenitipanModel();
            this.historyPage = historyPage;
        }

        //show data penitipan kedalam datagrid
        public void dataPenitipan()
        {
            DataSet data = penitipanModel.dataPenitipan();
            historyPage.dgKodePenitipan.ItemsSource = data.Tables[0].DefaultView;
        }
    }
}
