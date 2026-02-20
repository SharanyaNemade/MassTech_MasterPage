<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Designation.aspx.cs" Inherits="MasterPageProject.Designation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    

        
        <button type="button" class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#designationModal">
            Add Designation
        </button>

        
        <div class="modal fade" id="designationModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Header -->
                    <div class="modal-header">
                        <h5 class="modal-title">Add Designation</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Body -->
                    <div class="modal-body">

                        <div>
                  Department Name:
                            <asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataSource1"
                                DataTextField="DeptName"
                                DataValueField="DeptName">
                            </asp:DropDownList>

                            

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:dbconn %>"
                                SelectCommand="SELECT [DeptName] FROM [Department]">
                            </asp:SqlDataSource>

                            <br />
                            <br />

                            Designation Name:
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                            <br />
                            <br />

                            Status:
                            <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                            </asp:DropDownList>

                           


                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:dbconn %>"
                                SelectCommand="SELECT [Status] FROM [Department]">
                            </asp:SqlDataSource>


                            <br />
                            <br />

                            <asp:Button ID="Button1" runat="server"
                                Text="SUBMIT"
                                OnClick="Button1_Click" />
                        </div>

                    </div>

                    <!-- Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">
                            Close
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="3" GridLines="Vertical" Height="265px" Width="462px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>




</asp:Content>
