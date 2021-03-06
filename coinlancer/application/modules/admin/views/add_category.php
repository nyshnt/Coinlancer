<!DOCTYPE html>
<html>
<head>
    <?php echo $this->load->view(ADMIN_CSS_INCLUDE_PATH); ?>
    <style type="text/css">
    	sup{color: red;}
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <?php echo $this->load->view(ADMIN_HEADER_PATH); ?>
    <?php echo $this->load->view(ADMIN_SIDEBAR_PATH); ?>
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="prtm-page-bar">
        <ul class="breadcrumb">
            <?php
            $breadcrumb_details = json_decode($breadcrumb);
            $breadcrumb_count = count($breadcrumb_details);
            foreach ($breadcrumb_details as $breadcrumb) {
                ?>
                <li class="breadcrumb-item <?php echo $breadcrumb->class; ?>">
                    <a href="<?php echo $breadcrumb->link; ?>">    <i class="material-icons"><?php echo $breadcrumb->icon; ?></i> <?php echo fetch_ucfirst($breadcrumb->title); ?></a>
                </li>
            <?php } ?>
        </ul>
    </div>    
      <h1>
        <?php echo $main_title; ?>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
						<h3 class="box-title"><?php echo $main_title; ?></h3>
						<a href="<?php echo base_url().'admin/Master/list_category'; ?>" class="btn btn-primary pull-right">Manage Category</a>
						</div>
						<!-- /.box-header -->
						<!-- form start -->
						<form action="" id="form_data">
						<div class="box-body">
						<input type="hidden" name="is_mobile" id="is_mobile" value="web"/>
						                   <div class="col-md-8 input_fields_wrap"> 
                                            <div class="navbar-form">
                                                <?php echo form_label('category name')."<span style='color:red' id='category_error'> * </span> <br>";
                                                
                                                  $data1= array(
                                                    'name'          => 'category_name',
                                                    'id'            => 'category_name',
                                                    'maxlength'     => 40,
                                                    'autocomplete'  => 'off',
                                                    'class'         => 'form-control input_small class_form',
                                                    'placeholder'   => 'Enter Exam Category'

                                                );

                                                 echo form_input($data1);
                                                 if(isset($err_mesg)){echo $err_mesg; }
                                                 ?>
                                             <span class="category_error" id="category_error"></span>  
                                                <button class='add_field_button btn btn-sm btn-warning'><i class="glyphicon glyphicon-plus"></i></button><br>
                                                 
                                            </div>
                                        </div>
						
						<div class="clearfix"></div>
						<div class="col-md-6">
							<div class="box-footer pull-right">
							<a href=""><button type="button" class="btn btn-info">Reset</button></a>
							<button type="submit" id="btn_submit" class="btn btn-success">Add Now</button>
						 </div>
						</div>
						</div>
						</form>
					</div>
				</div>
			</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <?php echo $this->load->view(ADMIN_JS_INCLUDE_PATH); ?>
    <?php echo $this->load->view(ADMIN_FOOTER_PATH); ?>
</body>
</html>
<script>
$(document).ready(function () {
        var max_fields = 10; //maximum input boxes allowed
        var wrapper = $(".input_fields_wrap"); //Fields wrapper
        var add_button = $(".add_field_button"); //Add button ID

        var x = 1; //initlal text box count
        $(add_button).click(function (e) { //on add input button click
            e.preventDefault();
            if (x < max_fields) { //max input box allowed
                x++; //text box increment
                $(wrapper).append('<div class="navbar-form mrtop"><input type="text" name="category_name" class="form-control input_small class_form" placeholder="Enter Exam Category"/> <span class="unit_error" id="category_error"></span> <a href="#" class="remove_field btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a></div><div class="clearfix"></div>'); //add input box
            }
        });

        $(wrapper).on("click", ".remove_field", function (e) { //user click on remove text
            e.preventDefault();
            $(this).parent('div').remove();
            x--;
        })
    });
	$('#form_data').on('submit', function (e) {
        //validations for input fields starts from hear              jlkjlj
		e.preventDefault();
            //$('.fail_msg').hide();
            $('.success_msg').hide();
			  // i.preventDefault();
         str = true;
		var subject_pattern=/^[a-zA-Z1-9][a-zA-Z0-9 -]*$/;
        $('.class_form').each(function () {
	
            if (this.value == null || this.value == "") {
                $(this).css('border', '1px solid red');
                $(this).next('#category_error').html('<b style="color:red;">Enter category name</b>');
                str = false;
            } else {
                $(this).css('border', '');
                 $(this).next('#category_error').html('');
            }
			if (this.value != "") {
				if(!this.value.match(subject_pattern)){
                $(this).css('border', '1px solid red');
                $(this).next('#category_error').html('<b style="color:red;">Invalid category name</b>');
                str = false;
            } else {
                $(this).css('border', '');
                 $(this).next('#category_error').html('');
                   }
			}
			return str;
			 });
if(str == true){
$("#btn_submit").attr('disabled', 'disabled');
// data insert starts form hear 
var formdetails =JSON.stringify($('#form_data').serializeObject());
$.ajax({
dataType: 'JSON',
method: 'POST',
data: formdetails,
url: "<?php echo ADMIN_PATH.'Master/add_category'; ?>",
contentType: false,
cache: false,
processData: false,
success: function (data) {
console.log(data);
switch (data.code)
{
case 200:
$('.success_msg').html(data.description).addClass('alert alert-success fade in');
setTimeout(function () {
window.location = "<?php echo ADMIN_PATH.'Master/list_category'; ?>";
}, 3000);
break;
case 200:
$('.fail_msg').html(data.description).addClass('alert alert-danger ');
case 204:
$('.fail_msg').html(data.description).addClass('alert alert-danger');
setTimeout(function () {
window.location = "<?php echo ADMIN_PATH.'Master/list_category'; ?>";
}, 3000);
case 301:
case 422:
case 575:
$('.success_msg').html(data.description).addClass('alert alert-danger fade in');
break;
}
},
error: function (error) {
console.log(error);
},
});
}
       
   });
</script>