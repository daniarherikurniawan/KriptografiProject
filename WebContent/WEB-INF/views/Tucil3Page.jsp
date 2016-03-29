<!DOCTYPE html>
<html lang="en">
  <jsp:include page="/WEB-INF/views/Head.jsp"></jsp:include>
  <body>  
  <jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
					<h4 class="text-center" >${msg}</h4>
	   				<div class="col-md-1"></div>
                    
                	<div class="col-md-10" >

						
						<div class="row" style="margin-top: 5px;">
	   						<div class="col-md-3" style="margin-top: 5px;">
	   							Kunci Publik :
	   						</div>
	   						
	   						<div class="col-md-9" >
						    	<textarea id="kunciPublik"  rows="1" maxlength="256"  style="    padding: 6px 12px; width:100%; border-radius: 4px;" placeholder="Type the public key!"></textarea>
								<div id="textarea_feedback_public_key"></div>
						    	<div class="form-group">
							        <form id="formUploadKunciPublik" style="margin-top:5px"
							         method="POST" enctype="multipart/form-data" action="upload">
										<div class="col-md-3" style="padding-left:0px;">
											<a class='btn btn-default' href='javascript:;'>
									            Choose Public Key
									            <input required type="file" name="file" 
									            style='position:absolute;z-index:2;top:0;left:0;filter: 
									            alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
									            opacity:0;background-color:transparent;color:transparent;' name="file_source" size="40"  
									            onchange='$("#file-kunci-publik").html($(this).val().replace(/C:\\fakepath\\/i,""));'>
									        </a>
										</div>
										<div class="col-md-6">
							    			<textarea required  name="name" id="file-kunci-publik"  rows="1" maxlength="25"  style="padding: 6px 12px; width:100%;
							    			 border-radius: 4px;" placeholder="Input a new filename!"></textarea>
										</div>
										<div class="col-md-2">
											<button type="submit"  class="btn btn-default" >Upload </button>
		                    			</div>
									</form>
								</div>
							
							</div>
						</div>
						
						<div class="row" style="margin-top: 5px;">
	   						<div class="col-md-3" style="margin-top: 5px;">
	   							Kunci Privat :
	   						</div>
	   						
	   						<div class="col-md-9" >
						    	<div class="form-group">
						    	<textarea id="kunciPrivat"  rows="1" maxlength="256"  style="    padding: 6px 12px; width:100%; border-radius: 4px;" placeholder="Type the private key!"></textarea>
								<div id="textarea_feedback_private_key"></div>
							        <form id="formUploadKunciPrivat" style="margin-top:5px"
							         method="POST" enctype="multipart/form-data" action="upload">
										<div class="col-md-3" style="padding-left:0px;">
											<a class='btn btn-default' href='javascript:;'>
									            Choose Private Key
									            <input required type="file" name="file" 
									            style='position:absolute;z-index:2;top:0;left:0;filter: 
									            alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
									            opacity:0;background-color:transparent;color:transparent;' name="file_source" size="40"  
									            onchange='$("#file-kunci-privat").html($(this).val().replace(/C:\\fakepath\\/i,""));'>
									        </a>
										</div>
										<div class="col-md-6">
							    			<textarea required  name="name" id="file-kunci-privat"  rows="1" maxlength="25"  style="padding: 6px 12px; width:100%;
							    			 border-radius: 4px;" placeholder="Input a new filename!"></textarea>
										</div>
										<div class="col-md-2">
											<button type="submit"  class="btn btn-default" >Upload </button>
		                    			</div>
									</form>
								</div>
							
							</div>
						</div>
						
						<div class="row" style="margin-top: 5px;">
	   						<div class="col-md-3" style="margin-top: 5px;">
	   							Input File :
	   						</div>
	   						
	   						<div class="col-md-9" >
						    	<div class="form-group">
							        <form id="formUploadInputFile" style="margin-top:5px"
							         method="POST" enctype="multipart/form-data" action="upload">
										<div class="col-md-2" style="padding-left:0px;">
											<a class='btn btn-default' href='javascript:;'>
									            Choose File
									            <input required type="file" name="file" 
									            style='position:absolute;z-index:2;top:0;left:0;filter: 
									            alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
									            opacity:0;background-color:transparent;color:transparent;' name="file_source" size="40"  
									            onchange='$("#file-name").html($(this).val().replace(/C:\\fakepath\\/i,""));'>
									        </a>
										</div>
										<div class="col-md-7">
							    			<textarea required  name="name" id="file-name"  rows="1" maxlength="25"  style="padding: 6px 12px; width:100%;
							    			 border-radius: 4px;" placeholder="Input a new filename!"></textarea>
										</div>
										<div class="col-md-2">
											<button type="submit"  class="btn btn-default" >Upload </button>
		                    			</div>
									</form>
								</div>
							
							</div>
						</div>
	                    <div class="text-right" style="margin-top:10px">
							<button type="button" class="btn btn-success" onclick="startExecuting(0)">Bangkitkan Kunci </button>
	                    	<button type="button" class="btn btn-info" onclick="startExecuting(1)">Enkripsi File </button>
							<button type="button" class="btn btn-info" onclick="startExecuting(2)">Dekripsi FIle </button>
	                    </div>
                    	
                    	<hr>
                    	<div class="row" style="margin-top: 5px;">
	   						<div class="col-md-3" style="margin-top: 5px;">
	   							Plain Text :
	   						</div>
	   						
	   						<div class="col-md-9" >
						    	<div class="form-group">
						      		<textarea id="plainText" class="form-control" rows="5"></textarea>
							        <form id="formUploadFile" style="margin-top:5px"
							         method="POST" enctype="multipart/form-data" action="upload">
									
									<div class="col-md-2" id="downloadPlainText">
	                    			</div>
									</form>
								</div>
							
							</div>
						</div>
						
						<hr>
                    	<div class="row" style="margin-top: 5px;">
	   						<div class="col-md-3" style="margin-top: 5px;">
	   							Cipher Text :
	   						</div>
	   						
	   						<div class="col-md-9" >
						    	<div class="form-group">
						      		<textarea id="cipherText" class="form-control" rows="5"></textarea>
							        <form id="formUploadFile" style="margin-top:5px"
							         method="POST" enctype="multipart/form-data" action="upload">
									
									<div class="col-md-2" id="downloadCipherText" >
	                    			</div>
									</form>
								</div>
							
							</div>
						</div>
                   
				</div>
            </div>
        </div>
            </div>
        </div>
    </header>
	
	<script>
	$(document).ready(function() {
	    var text_max = 256;
	    $('#textarea_feedback_public_key').html('Tersisa '+text_max +' karakter' );

	    $('#kunciPublik').keyup(function() {
	        var text_length = $('#kunciPublik').val().length;
	        var text_remaining = text_max - text_length;

	        $('#textarea_feedback_public_key').html( 'Tersisa '+ text_remaining +' karakter ('+text_length+')');
	    });
	    
	    
	    $('#textarea_feedback_private_key').html('Tersisa '+text_max +' karakter' );

	    $('#kunciPrivat').keyup(function() {
	        var text_length = $('#kunciPrivat').val().length;
	        var text_remaining = text_max - text_length;

	        $('#textarea_feedback_private_key').html( 'Tersisa '+ text_remaining +' karakter ('+text_length+')');
	    });
	});
	
	$('#formUploadInputFile').submit(function(event){
	    $.ajax({
	      url: $('#formUploadInputFile').attr('action'),
	      data : new FormData($("#formUploadInputFile")[0]),
	      dataType: 'text',
	      enctype: 'multipart/form-data',
	      processData: false,
	      contentType: false,
	      type: 'POST',
	      success:  function(data) {
	    	  alert('Message: '+data);
	      }
	    });
	    return false;
	}); 
	
	$('#formUploadKunciPrivat').submit(function(event){
	    $.ajax({
	      url: $('#formUploadKunciPrivat').attr('action'),
	      data : new FormData($("#formUploadKunciPrivat")[0]),
	      dataType: 'text',
	      enctype: 'multipart/form-data',
	      processData: false,
	      contentType: false,
	      type: 'POST',
	      success:  function(data) {
	    	  alert('Message: '+data);
	      }
	    });
	    return false;
	}); 
	
	$('#formUploadKunciPublik').submit(function(event){
	    $.ajax({
	      url: $('#formUploadKunciPublik').attr('action'),
	      data : new FormData($("#formUploadKunciPublik")[0]),
	      dataType: 'text',
	      enctype: 'multipart/form-data',
	      processData: false,
	      contentType: false,
	      type: 'POST',
	      success:  function(data) {
	    	  alert('Message: '+data);
	      }
	    });
	    return false;
	}); 
	
	
	function startExecuting(idOperasi) {
	    operationType = idOperasi;

	    strKunciPublik = document.getElementById("kunciPublik").value;
	    strKunciPrivat = document.getElementById("kunciPrivat").value;
	    
	    fileInput = document.getElementById("file-name").innerHTML;
	    fileKunciPublik = document.getElementById("file-kunci-publik").innerHTML;
	    fileKunciPrivat = document.getElementById("file-kunci-privat").innerHTML;
	    
 		var http1 = new XMLHttpRequest();	     
	    
	    http1.open("POST", "/KriptografiProject/tucil3/execute", true);
	    http1.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    var params = "&strKunciPublik="+strKunciPublik
	    	+ "&strKunciPrivat="+strKunciPrivat
	    	+ "&fileInput="+fileInput
	    	+ "&fileKunciPublik="+fileKunciPublik
	    	+ "&fileKunciPrivat="+fileKunciPrivat
	    	+ "&operationType="+idOperasi
	    	;
	    
	    http1.send((params));
	    http1.onload = function() {
	    	result = JSON.parse(http1.responseText);
	    	alert(result.msg);
     		document.getElementById("cipherText").innerHTML = "";
     		document.getElementById("downloadCipherText").innerHTML = "";
     		document.getElementById("plainText").innerHTML = "";
     		document.getElementById("downloadPlainText").innerHTML = "";
	    	if(result.success){
		    	if(idOperasi==1){
	         		document.getElementById("plainText").innerHTML = result.data;
	         		document.getElementById("downloadPlainText").innerHTML = "<a type=\"btn\" href=\"files/"+result.filename
	         		+"/"+result.filetype+"\"  download=\""+result.filename+"\" title=\"ImageName\">"
					  +"<button type=\"button\"class=\"btn btn-info\">Download Plain Text</button></a>";
		         	
	         	}else if(idOperasi==2){
	         		document.getElementById("cipherText").innerHTML = result.data;
	         		document.getElementById("downloadCipherText").innerHTML = "<a type=\"btn\" href=\"files/"+result.filename
	         		+"/"+result.filetype+"\"  download=\""+result.filename+"\" title=\"ImageName\">"
					  +"<button type=\"button\"class=\"btn btn-info\">Download Plain Text</button></a>";
		         	
		    	}
	    	}
	      }
	    }
	
	</script>
	

 </body>
</html>