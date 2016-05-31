<script type="text/javascript" src="assets/js/table.js"></script>

<script type="text/javascript">

var user_table;

$('document').ready(

    function() 
    {
      user_table = new Table({'id': 'users'});
      user_table.sort();
    }
);

function on_add_user_clicked()
{
  $($('#add_user').prop('elements')).each(function(){
      if ( $(this).val('name') != 'account_id' )
      {
	$(this).val('');
      }
  });
}

function add_user_form_submitted()
{
    var data = {};

    var first_name = $('#first_name').val();
    var last_name = $('#last_name').val();
    var username = $('#username').val();
    var password = $('#password').val();
    var account_id = $('#account_id').val();

    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['username'] = username;
    data['password'] = password;
    data['account_id'] = account_id;

    $.ajax(
      {
	type: 'POST',
	url: '/users/add',
	dataType: 'json',
	data: data,
	success: function(response){
	    if ( response['success'] == 1 )
	    {
		user_table.add_row_from(response); 
		user_table.sort();
		hideModal('add_user_modal');
	    }
	    else
	    {
		alert('Could not add User.');
		hideModal('add_user_modal');
	    }
	},
	error: function() 
	{
	  alert("Error occurred when adding user.");
	  hideModal('add_user_modal');
	},
	complete: function() { },
	async: false
      }
    );   

    return false;
}

function on_delete_row_clicked(id)
{
    var data = {};

    data['id'] = id;

    $.ajax(
      {
	type: 'POST',
	url: '/users/delete/' + id,
	dataType: 'json',
	data: data,
	success: function(response){
	    if ( response['success'] == 1 )
	    {
		user_table.remove_row(id); 
	    }
	    else
	    {
		alert('Could not remove User.');
	    }
	},
	error: function() 
	{
	  alert("Error occurred when removing user.");
	},
	complete: function() { },
	async: false
      }
    );   

    return false;
}

</script>


<div class="container-fluid">

<div class="row">

  <div class="col-xs-6">

    <div class="pull-left">

      <h2>Users</h2>

    </div>

    <div class="pull-right">
	  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#add_user_modal" onClick="on_add_user_clicked();">Add User</button>
    </div>

  </div>

</div>

<section id="responsive-tables">

  <table class="table table-bordered table-striped table-condensed cf" id="users" summary="Users in your account.">

    <thead class="cf">

      <tr>
	<th>&nbsp;</th>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Username</th>
      <tr>

      <tbody>

	<<rows>>

      </tbody>

  </table>

</section>

<!-- Add User  -->
<div id="add_user_modal" class="modal fade" role="dialog">
 
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">

      <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title">Modal Header</h4>
      </div>

      <div class="modal-body">

	<form action="/users/add" method="post" onSubmit="add_user_form_submitted(); return false;" id="add_user">

	  <fieldset class="form-group">
	    <label for="first_name">First Name</label>
	    <input type="text" name="first_name" class="form-control" id="first_name" placeholder="John">
	  </fieldset>

	  <fieldset class="form-group">
	    <label for="last_name">Last Name</label>
	    <input type="text" name="last_name" class="form-control" id="last_name" placeholder="Doe">
	  </fieldset>

	  <fieldset class="form-group">
	    <label for="username">Username</label>
	    <input type="text" name="username" class="form-control" id="username" placeholder="doejohn">
	  </fieldset>

	  <fieldset class="form-group">
	    <label for="email_address">Email Address</label>
	    <input type="email" name="email_address" class="form-control" id="email_address" placeholder="me@example.com">
	  </fieldset>

	  <fieldset class="form-group">
	    <label for="password">Password</label>
	    <input type="password" name="password" class="form-control" id="password" placeholder="doejohn">
	    <small class="text-muted">Must be at least 8 characters and include one upper case, lower case characters. Also include a number and one special character.</small>
	  </fieldset>

	  <input type="hidden" name="account_id" id="account_id" value="2">
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default">Close</button>
      </div>

    </div>

  </div>

</div>

</div>
