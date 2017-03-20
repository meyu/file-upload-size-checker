<asp:FileUpload ID="fu" onchange="validateFileSize();" />
<asp:Button ID="btn" UseSubmitBehavior="False" OnClientClick="this.disabled=true; this.value='上傳中...';" />
<asp:Label ID="lb" />


//檢查上傳的檔案大小
<script type="text/javascript">
    function validateFileSize() {
        var sizeLimitInMB = 3;     //設定檔案大小上限
        var fu = document.getElementById("fu_" + itemIndex);
        var lbtn = document.getElementById("btn_" + itemIndex);
        var txt = "";
        if ('files' in fu) {
            if (fu.files.length == 0) {
                txt = "未選擇檔案";
            } else {
                for (var i = 0; i < fu.files.length; i++) {
                    var file = fu.files[i];
                    if ('size' in file) {
                        var sizeInMB = (file.size / 1024 / 1024).toFixed(2)
                        txt += "檔案大約 " + sizeInMB + " MB<br>";
                        if (sizeInMB > sizeLimitInMB) {
                            txt += "已超過 " + sizeLimitInMB + " MB 之限制，無法上傳。";
                        }
                    }
                }
            }
        }
        document.getElementById("lb_" + itemIndex).innerHTML = txt;
    }
</script>
