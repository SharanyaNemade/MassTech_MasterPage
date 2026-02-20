<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="MasterPageProject.Role" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    
        <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary"
        data-bs-toggle="modal"
        data-bs-target="#exampleModal">
        Add Event
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Add Role</h5>
                    <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                    </button>
                </div>

                <div class="modal-body">

                    <div class="mb-3">
                        <label class="form-label">Event Name</label>
                        <asp:TextBox ID="TextBox1"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <asp:DropDownList ID="DropDownList1"
                            runat="server"
                            CssClass="form-select">
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Color</label>
                        <asp:TextBox ID="TextBox2"
                            runat="server"
                            TextMode="Color"
                            CssClass="form-control">
                        </asp:TextBox>
                    </div>

                    <asp:Button ID="Button1"
                        runat="server"
                        Text="Save Event"
                        CssClass="btn btn-success"
                        OnClick="Button1_Click" />

                </div>

            </div>
        </div>
    </div>

    <br /><br />

    <!-- Grid View -->


    <asp:GridView ID="GridView1"
        runat="server"
        AutoGenerateColumns="false"
        CssClass="table table-bordered table-striped">

    <Columns>
        <asp:BoundField DataField="RoleId" HeaderText="ID" />
        <asp:BoundField DataField="RoleName" HeaderText="Role Name" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
    </Columns>

    </asp:GridView>

</asp:Content>
