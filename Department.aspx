<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="MasterPageProject.Department" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <!-- Button trigger modal -->
<button type="button"
        class="btn btn-primary"
        data-bs-toggle="modal"
        data-bs-target="#exampleModal">
    Add Department
</button>

<br />
<br />

<div class="modal fade" id="exampleModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title">Enter Details</h5>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">

                <div class="mb-3">
                    <label class="form-label">Department Name:</label>
                    <asp:TextBox ID="TextBox1"
                                 runat="server"
                                 CssClass="form-control"
                                 placeholder="Enter Name">
                    </asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label">Status</label>
                    <asp:DropDownList ID="DropDownList2"
                                      runat="server"
                                      CssClass="form-select">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="text-end">
                    <asp:Button ID="Button1"
                                runat="server"
                                Text="SUBMIT"
                                CssClass="btn btn-success"
                                OnClick="Button1_Click" />
                </div>

            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">
                    Close
                </button>
            </div>

        </div>
    </div>
</div>

<br />
<br />

<asp:GridView ID="GridView2"
              runat="server"
              AutoGenerateColumns="False"
              CellPadding="4"
              ForeColor="#333333"
              Width="100%"
              OnRowDeleting="GridView2_RowDeleting">

    <AlternatingRowStyle BackColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />

    <Columns>

        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <asp:Label ID="Label1"
                           runat="server"
                           Text='<%# Eval("Deptid") %>'>
                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Department">
            <ItemTemplate>
                <asp:Label ID="Label2"
                           runat="server"
                           Text='<%# Eval("DeptName") %>'>
                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <asp:Label ID="Label3"
                           runat="server"
                           Text='<%# Eval("Status") %>'>
                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="Button2"
                            runat="server"
                            Text="Remove"
                            CommandName="Delete"
                            CssClass="btn btn-danger btn-sm" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>
</asp:Content>
