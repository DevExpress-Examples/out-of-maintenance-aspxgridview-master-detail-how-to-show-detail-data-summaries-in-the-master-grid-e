using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void dsProducts_Init(object sender, EventArgs e) {
        AccessDataSource dataSource = sender as AccessDataSource;
        GridViewDetailRowTemplateContainer container = dataSource.NamingContainer as GridViewDetailRowTemplateContainer;

        dataSource.SelectParameters["CategoryID"].DefaultValue = container.KeyValue.ToString();
    }
    protected void gvCategories_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e) {
        object categoryID = e.GetListSourceFieldValue("CategoryID");
        if (e.Column.FieldName == "UnitsInStock") {
            e.Value = DataHelper.ExecuteCommand(String.Format("SELECT SUM([UnitsInStock]) FROM  [Products] WHERE ([CategoryID] = {0})", categoryID));
        }
        if (e.Column.FieldName == "AverageUnitPrice") {
            e.Value = DataHelper.ExecuteCommand(String.Format("SELECT AVG([UnitPrice]) FROM  [Products] WHERE ([CategoryID] = {0})", categoryID));
        }
    }
}