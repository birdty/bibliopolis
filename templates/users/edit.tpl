
<h3 class="page-header">Edit User</h3>

<form action="/users/save" method="post">
  <fieldset class="form-group">
    <label for="example_first_name">First Name</label>
    <input type="text" name="first_name" class="form-control" id="example_first_name" placeholder="John" value="<<first_name>>">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_last_name">First Name</label>
    <input type="text" name="last_name" class="form-control" id="example_last_name" placeholder="Doe" value="<<last_name>>">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_username">Username</label>
    <input type="text" name="username" class="form-control" id="example_username" placeholder="doejohn" value="<<username>>">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_email_address">Email Address</label>
    <input type="email" name="email_address" class="form-control" id="example_email_address" placeholder="me@example.com" value="<<email_address>>">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_password">Password</label>
    <input type="password" name="password" class="form-control" id="example_password" placeholder="" value="<<password>>">
    <small class="text-muted">Must be at least 8 characters and include one upper case, lower case characters. Also include a number and one special character.</small>
  </fieldset>

  <input type="hidden" name="account_id" value="2">
  <input type="hidden" name="id" value="<<id>>">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
