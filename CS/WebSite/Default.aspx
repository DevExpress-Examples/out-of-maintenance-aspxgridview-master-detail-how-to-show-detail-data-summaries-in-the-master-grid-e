<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="gvCategories" runat="server" AutoGenerateColumns="False" DataSourceID="dsCategories"
            KeyFieldName="CategoryID" OnCustomUnboundColumnData="gvCategories_CustomUnboundColumnData">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AverageUnitPrice" VisibleIndex="3" UnboundType="Decimal">
                    <PropertiesTextEdit DisplayFormatString="c2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="4" UnboundType="Integer">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="AverageUnitPrice" ShowInColumn="Average Unit Price"
                    SummaryType="Average" />
                <dx:ASPxSummaryItem FieldName="UnitsInStock" ShowInColumn="Units In Stock" SummaryType="Sum" />
            </TotalSummary>
            <Settings ShowFooter="True" />
            <SettingsDetail ShowDetailRow="true" />
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataSourceID="dsProducts"
                        KeyFieldName="ProductID" Width="100%">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="c2">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:AccessDataSource ID="dsProducts" runat="server" DataFile="~/App_Data/nwind.mdb"
                        OnInit="dsProducts_Init" SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock] FROM [Products] WHERE ([CategoryID] = ?)">
                        <SelectParameters>
                            <asp:Parameter Name="CategoryID" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="dsCategories" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
