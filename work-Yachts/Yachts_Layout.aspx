<%@ Page Title="" Language="C#" MasterPageFile="~/yacht_master.Master" AutoEventWireup="true" CodeBehind="Yachts_Layout.aspx.cs" Inherits="work_Yachts.Yachts_Layout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box6">
    <p> Layout & deck plan</p>
    <ul>
      <li>
      <asp:Literal ID="ContentHtml" runat="server"></asp:Literal>
      </li>
    </ul>
  </div>
  <div class="clear">
  </div>
  <p class="topbuttom"><img src="images/top.gif" alt="top" /></p>
  <!--下載開始-->
  
  <!--下載結束-->
</asp:Content>
