
Partial Class Errors
    Inherits System.Web.UI.Page
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim errMessage As String = ""
        Dim appException As System.Exception = Server.GetLastError()
        If (TypeOf (appException) Is HttpException) Then
            Dim checkException As HttpException = CType(appException, HttpException)
            Select Case checkException.GetHttpCode
                Case 400
                    errMessage &= "Bad request. The file size is too large."
                Case 401
                    errMessage &= "You are not authorized to view this page."
                Case 403
                    errMessage &= "You are not allowed to view that page."
                Case 404
                    errMessage &= "The page you have requested can't be found."
                Case 408
                    errMessage &= "The request has timed out."
                Case 500
                    errMessage &= "The server can't fulfill your request."
                Case Else
                    errMessage &= "The server has experienced an error."
            End Select
        Else
            errMessage &= "The following error occurred<BR>" & appException.ToString
        End If
        ErrorMessage.Text = errMessage & "<BR>We're sorry for the inconvenience."
        Server.ClearError()
    End Sub

End Class
