Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub dsProducts_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim dataSource As AccessDataSource = TryCast(sender, AccessDataSource)
		Dim container As GridViewDetailRowTemplateContainer = TryCast(dataSource.NamingContainer, GridViewDetailRowTemplateContainer)

		dataSource.SelectParameters("CategoryID").DefaultValue = container.KeyValue.ToString()
	End Sub
	Protected Sub gvCategories_CustomUnboundColumnData(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)
		Dim categoryID As Object = e.GetListSourceFieldValue("CategoryID")
		If e.Column.FieldName = "UnitsInStock" Then
			e.Value = DataHelper.ExecuteCommand(String.Format("SELECT SUM([UnitsInStock]) FROM  [Products] WHERE ([CategoryID] = {0})", categoryID))
		End If
		If e.Column.FieldName = "AverageUnitPrice" Then
			e.Value = DataHelper.ExecuteCommand(String.Format("SELECT AVG([UnitPrice]) FROM  [Products] WHERE ([CategoryID] = {0})", categoryID))
		End If
	End Sub
End Class