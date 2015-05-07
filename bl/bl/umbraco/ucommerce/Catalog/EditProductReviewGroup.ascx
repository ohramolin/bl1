<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductReviewGroup.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductReviewGroup" %>
<%@ Register tagPrefix="commerce" tagName="ProductReview" src="ProductReviewsList.ascx" %>

<div style="text-align: left;">
    <div class="propertyPaneUCommerce" style="padding: 10px">
        <div>
            <commerce:ProductReview runat="server" ID="ProductReviewList" DisplayProductName="true" NewComments="true" DisplayOnlyCommentsWithStatusNewAndReported="true" />
        </div>
	</div>
</div>


