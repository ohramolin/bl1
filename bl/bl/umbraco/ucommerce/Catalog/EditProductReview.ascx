<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductReview.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductReview" %>
<%@ Register TagPrefix="commerce" TagName="ProductReview" Src="ProductReviewsList.ascx" %>

<div class="propertyPaneUCommerce" runat="server" style="padding: 10px;">
    <commerce:ProductReview runat="server" ID="ProductReviewList" DataSource="<%# View.Product.ProductReviews %>" 
        DisplayProductName="false" NewComments="false" DisplayOnlyCommentsWithStatusNewAndReported="false" />
</div>