<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ApproveLeave.aspx.cs" Inherits="MasterPageProject.ApproveLeave" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#approveModal">
            Approve Leave
        </button>

    <div class="modal fade" id="approveModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

<!--                <div class="modal-header">
                    <h5 class="modal-title">Approve Leave (Manager)</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div> -->



            <div class="modal-header">
                  <h5 class="modal-title">Approve Leave (Manager)</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>



                <div class="modal-body">

                    <asp:DropDownList ID="ddlNames" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlNames_SelectedIndexChanged">
                    </asp:DropDownList>

                    Leave Type :
                    <asp:TextBox ID="txtLeaveType" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />

                    From :
                    <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />

                    To :
                    <asp:TextBox ID="txtTo" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />

                    Reason :
                    <asp:TextBox ID="txtReason" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />

                    Action :
                    <asp:TextBox ID="txtAction" runat="server" CssClass="form-control"></asp:TextBox>

                </div>

                <div class="modal-footer">
                    <asp:Button ID="btnApprove" runat="server"
                        Text="Approve"
                        CssClass="btn btn-success"
                        OnClick="btnApprove_Click" />

                    <asp:Button ID="btnReject" runat="server"
                        Text="Reject"
                        CssClass="btn btn-danger"
                        OnClick="btnReject_Click" />

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
