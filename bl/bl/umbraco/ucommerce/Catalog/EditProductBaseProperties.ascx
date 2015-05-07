<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductBaseProperties.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary ID="ValidationSummary1" runat="server" />

<div class="propertyPane">
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="Sku" /></div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" ID="SkuTextBox" CssClass="propertyText" Text="<%# View.Product.Sku %>" MaxLength="30"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="SkuTextBox" Display="Static" Text="*" ErrorMessage='<%# GetLocalResourceObject("Sku.Text") %>' CssClass="validator" />
            <asp:CustomValidator ID="UniqueSkuValildator" runat="server" ControlToValidate="SkuTextBox" Display="Dynamic" Text="A product with the SKU already exists*" ErrorMessage='<%# GetLocalResourceObject("Sku.Text") %>' meta:resourceKey="UniqueSkuValildator" OnServerValidate="UniqueSkuValidator_ServerValidate"></asp:CustomValidator>
        </div>
    </div>
	<div class="propertyItem">
		<div class="propertyItemHeader"><asp:Localize ID="ProductDefinitionChangeLabel" runat="server" meta:resourceKey="ProductDefinition" /></div>
		<div class="propertyItemContent">
            <asp:DropDownList runat="server" ID="ProductDefinitionDropDown" CssClass="mediumWidth propertyItemDropDown" DataSource="<%# View.ProductDefinitions %>" DataValueField="ProductDefinitionId" DataTextField="Name"/>
        </div>
	</div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="CreatedDate" /></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" ID="CreateDateLabel" Text="<%# View.Product.CreatedOn %>" />
        </div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize5" runat="server" meta:resourceKey="LastModifiedDate" /></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" ID="LastModifiedLabel" Text="<%# View.Product.ModifiedOn %>" />
        </div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize6" runat="server" meta:resourceKey="LastModifiedBy" /></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" ID="LastModifiedByLabel" Text="<%# View.Product.ModifiedBy %>" />
        </div>
    </div>
    <div class="propertyPaneFooter"></div>
</div>

<div class="propertyPane">
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize7" runat="server" meta:resourceKey="DisplayOnSite" /></div>
        <div class="propertyItemContent">
            <asp:CheckBox runat="server" ID="DisplayOnWebSiteCheckBox" Checked="<%# View.Product.DisplayOnSite %>" />
        </div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize8" runat="server" meta:resourceKey="AllowOrdering" /></div>
        <div class="propertyItemContent">
             <asp:CheckBox runat="server" ID="AllowOrderingCheckBox" Checked="<%# View.Product.AllowOrdering %>" />
        </div>
    </div>
    <div class="propertyPaneFooter"></div>
</div>

<asp:panel runat="server" cssclass="propertyPane" id="PropertyPanel">
</asp:panel>