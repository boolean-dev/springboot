<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>图片裁剪上传</title>


<link rel="shortcut icon" href="favicon.ico">
<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">
<link href="${base}/resources/admin/css/plugins/cropper/cropper.min.css" rel="stylesheet">
<link href="${base}/resources/admin/css/plugins/cropper/sitelogo.css" rel="stylesheet">

<script src="${base}/resources/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${base}/resources/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${base}/resources/admin/js/webuploader/webuploader.min.js"></script>
<script src="${base}/resources/admin/js/plugins/cropper/cropper.min.js"></script>
<script src="${base}/resources/admin/js/plugins/cropper/sitelogo.js"></script>
<script src="${base}/resources/admin/js/plugins/cropper/canvas-to-blob.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>

<style type="text/css">
	.avatar-btns button {
		height: 35px;
	}
</style>
</head>
	<body class="modal-open">
		<input type="hidden" id="one" value="${id}" />
		<div class="modal fade in" id="avatar-modal" aria-hidden="false" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1" style="display: block;">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<form class="avatar-form" >
						<div class="modal-body">
							<div class="avatar-body">
								<div class="avatar-upload">
									<input class="avatar-src" name="avatar_src" type="hidden">
									<input class="avatar-data" name="avatar_data" type="hidden">
									<label for="avatarInput" style="line-height: 35px;">图片上传</label>
									<button class="btn btn-danger"  type="button" style="height: 35px;" onclick="$('input[id=avatarInput]').click();">请选择图片</button>
									<span id="avatar-name"></span>
									<input class="avatar-input hide" id="avatarInput" name="avatar_file" type="file"></div>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-wrapper"></div>
									</div>
									<div class="col-md-3">
										<div class="avatar-preview preview-lg" id="imageHead"></div>
									</div>
								</div>
								<div class="row avatar-btns">
									<div class="col-md-4">
										<div class="btn-group">
											<button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"> 向左旋转</button>
										</div>
										<div class="btn-group">
											<button class="btn  btn-danger fa fa-repeat" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"> 向右旋转</button>
										</div>
									</div>
									<div class="col-md-5" style="text-align: right;">								
										<button class="btn btn-danger fa fa-arrows" data-method="setDragMode" data-option="move" type="button" title="移动">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
							            </span>
							          </button>
							          <button type="button" class="btn btn-danger fa fa-search-plus" data-method="zoom" data-option="0.1" title="放大图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
							              <!--<span class="fa fa-search-plus"></span>-->
							            </span>
							          </button>
							          <button type="button" class="btn btn-danger fa fa-search-minus" data-method="zoom" data-option="-0.1" title="缩小图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
							              <!--<span class="fa fa-search-minus"></span>-->
							            </span>
							          </button>
							          <button type="button" class="btn btn-danger fa fa-refresh" data-method="reset" title="重置图片">
								            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;reset&quot;)" aria-describedby="tooltip866214">
								       </button>
							        </div>
									<div class="col-md-3">
										<button class="btn btn-danger btn-block avatar-save fa fa-save" type="button" data-dismiss="modal"> 保存修改</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
		<script src="${base}/resources/admin/js/plugins/cropper/html2canvas.min.js"></script>
		<script type="text/javascript">
			$('#avatarInput').on('change', function(e) {
				var filemaxsize = 1024 * 3;//5M
				var target = $(e.target);
				var Size = target[0].files[0].size / 1024;
				if(Size > filemaxsize) {
					layer.alert('图片过大，请重新选择!');
					$(".avatar-wrapper").removeChild(0);
					return false;
				}
				if(!this.files[0].type.match(/image.*/)) {
					layer.alert('请选择正确的图片!')
				} else {
					var filename = document.querySelector("#avatar-name");
					var texts = document.querySelector("#avatarInput").value;
					var teststr = texts; //你这里的路径写错了
					testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
					filename.innerHTML = testend;
				}
			
			});

			$(".avatar-save").on("click", function() {
				var img_lg = document.getElementById('imageHead');
				// 截图小的显示框内的内容
				html2canvas(img_lg, {
					allowTaint: true,
					taintTest: false,
					onrendered: function(canvas) {
						//生成base64图片数据
						var dataUrl = canvas.toDataURL("image/jpeg");
						var url = dataUrl.replace("data:image/jpeg;base64,","");
						imagesAjax(url)
					}
				});
			})
			
			function imagesAjax(src) {
				var one = $("#one").val()
				
				$.ajax({
					url: "${base}/admin/file/uploadByBase64",
					data: {
						"imgStr":src
					},
					type: "POST",
					dataType: 'json',
					success: function(re) {
						if(re.message.type=="success"){
							$('input[name='+one+']', window.parent.document).val(re.url);
		   					var index = parent.layer.getFrameIndex(window.name);
		   					parent.layer.close(index);
						}						
					}
				});
			}
		</script>


</body>

</html>
