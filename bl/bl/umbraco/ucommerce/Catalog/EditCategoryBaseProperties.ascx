<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCategoryBaseProperties.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditCategoryBaseProperties" %>

<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<script type="text/javascript">
    function openDefinition(id) {
        document.location.href = '../settings/catalog/editdefinition.aspx?id=' + id;
    }
</script>

<commerce:ValidationSummary runat="server" />

<div class="propertyPane leftAligned">      

	<commerce:PropertyPanel runat="server" meta:resourcekey="CategoryDefinition">
		<asp:DropDownList runat="server" ID="CategoryDefinitionDropDown" CssClass="mediumWidth" DataSource="<%# View.CategoryDefinitions %>" DataValueField="DefinitionId" DataTextField="Name"/>
	</commerce:PropertyPanel>
	<commerce:PropertyPanel runat="server" meta:resourceKey="CreatedDate">
		<asp:Label runat="server" Text="<%# View.Category.CreatedOn %>" />
	</commerce:PropertyPanel>
	<commerce:PropertyPanel runat="server" meta:resourceKey="LastModifiedDate">
		<asp:Label runat="server" Text="<%# View.Category.ModifiedOn %>" />
	</commerce:PropertyPanel>
	<commerce:PropertyPanel runat="server" meta:resourceKey="LastModifiedBy">
		<asp:Label runat="server" Text="<%# View.Category.ModifiedBy %>" />
	</commerce:PropertyPanel>
	<commerce:PropertyPanel runat="server" meta:resourceKey="DisplayOnWebSite">
		<asp:CheckBox runat="server" ID="DisplayOnWebSiteCheckBox" Checked="<%# View.Category.DisplayOnSite %>" />
	</commerce:PropertyPanel>
	<div class="propertyPaneFooter">-</div>
</div>

<asp:Panel CssClass="propertyPane" ID="PropertyPanel" runat="server">
</asp:Panel>